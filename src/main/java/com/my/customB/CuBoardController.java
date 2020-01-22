package com.my.customB;

import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.common.CustomCommon;
import com.my.custom.*;
import com.my.funiture.AdminFormController;
import com.my.paging.CommonPaging;

@Controller
@RequestMapping("/cuboard")
public class CuBoardController {
	
	private int currentPage=1;   // 현재페이지
	private int totalCount;	 // 전체 게시물 수
	private int blockCount;	 // 한 페이지의  게시물의 수
	private int blockPage=5;	 // 한 화면에 보여줄 페이지 수
	private String pageHtml;
	private CommonPaging page;
	
	CustomModel custom;
	@Resource
	private CustomService customService;
	@Resource
	private CuboardService cuboardService;
	@Resource
	private CuboardComService cubComService;
	private CustomCommon common = new CustomCommon();
	
//	String uploadPath =
//	"C:\\Java\\Apple\\Fun-iture\\src\\main\\webapp\\resources\\cuboard\\cuboardImg\\";
	String uploadPath = "/Users/wooseob/Desktop/Java/Fun-iture/src/main/webapp/resources/cuboard/cuboardImg/";
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest req, Model model) {
//		DB에서 data 가져옴
		List<CuboardModel> cuboardList = cuboardService.selectRowsCub();
//		paging
		if(req.getParameter("page")==null||
			req.getParameter("page").trim().equals("")||
			req.getParameter("page").equals("0")) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}
		totalCount = cuboardList.size();
		blockCount = 10;
		page = new CommonPaging(currentPage, totalCount, blockCount, blockPage,
				"/funiture/cuboard/list");
		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if(page.getEndCount()<totalCount) {
			lastCount = page.getEndCount()+1;
		}
		cuboardList = cuboardList.subList(page.getStartCount(), lastCount);
//		paging
		
		model.addAttribute("listPage", currentPage);
		model.addAttribute("pageHtml", pageHtml);
		model.addAttribute("list", cuboardList);
		return "customB/cuBoardList";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(HttpServletRequest req, Model model) {
		int cu_no = Integer.parseInt(req.getParameter("cu_no"));
		custom = (CustomModel)customService.selectOneCus(cu_no);
		List optionList = common.setOptionList(custom.getOptions());
		String CusName = custom.getName();
		
		model.addAttribute("cu_no", cu_no);
//		write 메소드 실행할때 또 DB에 갔다오지 않기 위해서 미리 갖고다닌다
		model.addAttribute("optionDefault", custom.getOptions());
		model.addAttribute("name", CusName);
		model.addAttribute("option", optionList);
		return "customB/cuBoardWriteForm";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest mhsr, HttpSession session,
			CuboardModel cuboard) throws Exception {
		String id;
		if(session.getAttribute("session_id")==null) {
			return "custom/error";
		}//로그인 후 이용해주세요.
		else{ id=session.getAttribute("session_id").toString();}
		cuboard.setId(id);//id

		String options = common.setOptionsUser(cuboard.getOptionDefault(), cuboard.getOption());
		cuboard.setOptions(options);//options
		String content = cuboard.getContent().replaceAll("\r\n", "<br/>");
		cuboard.setContent(content);
		
		MultipartFile cub_img = mhsr.getFile("cub_img");
		String cubName = cub_img.getOriginalFilename();
		if(cubName != null && !cubName.trim().equals("")) {
			String cub_save = common.setFileName(cubName,id+"_"+cuboard.getCu_no()+"_");
			FileCopyUtils.copy(cub_img.getInputStream(), new FileOutputStream(uploadPath+"/"+cub_save));
			cuboard.setCub_save(cub_save);
			cuboardService.insert(cuboard);		//이미지 있을 때
		} else {
			cuboardService.insertWoF(cuboard);	//이미지 없을 때
		}
		
		return "redirect:/cuboard/list";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(HttpServletRequest req, Model model) {
		int cub_no = Integer.parseInt(req.getParameter("cub_no"));
		int listPage = 0;
		if(req.getParameter("list")==null||
			req.getParameter("list").trim().equals("")||
			req.getParameter("list").equals("0")) {
			listPage = 1;
		}else {
			listPage = Integer.parseInt(req.getParameter("list"));
		}
		
//		견적문의 게시글 1개 가져오기
		CuboardModel cuboard = (CuboardModel) cuboardService.selectOneCub(cub_no);
//		견적문의 댓글 리스트 가져오기
		List<CuboardComModel> cubCom = cuboardService.selectRowsCubCom(cub_no);
		
		model.addAttribute("item", cuboard);
		model.addAttribute("cubCom", cubCom);
		model.addAttribute("listPage", listPage);
		return "customB/cuBoardView";
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(HttpServletRequest req, Model model) {
		int cub_no = Integer.parseInt(req.getParameter("cub_no"));
		int listPage = 0;
		if(req.getParameter("list")==null||
			req.getParameter("list").trim().equals("")||
			req.getParameter("list").equals("0")) {
			listPage = 1;
		}else {
			listPage = Integer.parseInt(req.getParameter("list"));
		}
//		견적문의 게시글 1개 가져오기
		CuboardModel cuboard = (CuboardModel) cuboardService.selectOneCub(cub_no);
		List optionList = common.setOptionList(cuboard.getOptions());
		
		String content = cuboard.getContent().replaceAll("<br/>","\r\n");
		cuboard.setContent(content);
		
		model.addAttribute("item", cuboard);
		model.addAttribute("listPage", listPage);//목록으로 돌아가려고 할 때 
//		write 메소드 실행할때 또 DB에 갔다오지 않기 위해서 미리 갖고다닌다
		model.addAttribute("optionDefault", cuboard.getOptions());
//		폼에 입력될 값들
		model.addAttribute("option", optionList);
		return "customB/cuBoardModifyForm";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MultipartHttpServletRequest mhsr, HttpSession session,
			CuboardModel cuboard, Model model) throws Exception {
		String id;
		if(session.getAttribute("session_id")==null) {
			return "custom/error";
		}//로그인 후 이용해주세요.
		else{ id=session.getAttribute("session_id").toString();}
		cuboard.setId(id);//id
		
		String options = common.setOptionsUser(cuboard.getOptionDefault(), cuboard.getOption());
		cuboard.setOptions(options);//options
		String content = cuboard.getContent().replaceAll("\r\n", "<br/>");
		cuboard.setContent(content);
		
		MultipartFile cub_img = mhsr.getFile("cub_img");
		String cubName = cub_img.getOriginalFilename();
		if(cubName != null && !cubName.trim().equals("")) {
			String cub_save = common.setFileName(cubName,id+"_"+cuboard.getCu_no()+"_");
			FileCopyUtils.copy(cub_img.getInputStream(), new FileOutputStream(uploadPath+"/"+cub_save));
			cuboard.setCub_save(cub_save);//이미지 있을 때
			if(cuboard.getCub_old()!=null) {//기존 업로드 파일이 있으면 삭제한다.
				File delFile = new File(uploadPath+"/"+cuboard.getCub_old());
				delFile.delete();
			}
		} else {
			cuboard.setCub_save(cuboard.getCub_old());	//이미지 없을 때
		}
		cuboardService.modify(cuboard);
		
		model.addAttribute("cub_no", cuboard.getCub_no());
		return "redirect:/cuboard/view";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(CuboardModel cuboard, Model model) {
		
		cuboardService.delete(cuboard.getCub_no());
		return "redirect:/cuboard/list";
	}
	
	@RequestMapping(value = "/com", method = RequestMethod.POST)
	public String com(CuboardComModel cubComModel, HttpSession session, Model model) {
		String id;
		if(session.getAttribute("session_id")==null) {
			return "custom/error";
		}//로그인 후 이용해주세요.
		else{ id=session.getAttribute("session_id").toString();}
		cubComModel.setId(id);//id
		
		int cub_no = cubComModel.getCub_no();
		String content;
//		최종 견적에 관한 댓글일 경우
		if(cubComModel.getCom()==null 
			|| cubComModel.getCom().trim()==null
			|| cubComModel.getCom()=="") {
			content = common.getComFinal(cubComModel.getPrice(),cubComModel.getOptions()
					,cubComModel.getCub_no(),cubComModel.getCu_no());
			cubComModel.setCom(content);
		} else {//일반 댓글일 경우
			content = cubComModel.getCom().replaceAll("\r\n", "<br/>");
			cubComModel.setCom(content);
		}
		
		cubComService.insert(cubComModel);
		
		model.addAttribute("cub_no", cub_no);
		return "redirect:/cuboard/view";
	}
	
	@RequestMapping(value = "/delcom", method = RequestMethod.GET)
	public String delCom(CuboardComModel cubCom, Model model) {
		
		cubComService.delete(cubCom.getNo());
		
		model.addAttribute("cub_no", cubCom.getCub_no());
		return "redirect:/cuboard/view";
	}
	
	@RequestMapping(value = "/addOrders", method = RequestMethod.POST)
	public String addOrders(CuboardComModel cubCom, HttpSession session, Model model) {
		String id;
		if(session.getAttribute("session_id")==null) {
			return "custom/error";
		}//로그인 후 이용해주세요.
		else{ id=session.getAttribute("session_id").toString();}
		cubCom.setId(id);//id
		
		String price = cubCom.getPrice();
		int status_no = cubCom.getStatus_no();
		cubComService.modify(cubCom); //cub_no&price를 가지고 custom_board table의 price를 업데이트
		
		OrderCusModel orders = new OrderCusModel();
		orders = cubComService.selectMem(id);//id를 가지고 member table에서 orders table에 들어갈 회원정보를 가져옴
		orders.setId(id);	//orders table에 필요한 정보들을 set한다.
		orders.setGoods_no(cubCom.getCu_no());
		orders.setOrder_price(Integer.parseInt(price));
		orders.setOptions(cubCom.getOptions());
		orders.setMemo(cubCom.getMemo());
		orders.setStatus_no(status_no);
		switch(status_no) {
		case 1:
			orders.setSettle_type("무통장입금");
			break;
		case 2:
			orders.setSettle_type("신용카드");
			break;
		}
		
		cubComService.addOrders(orders);
		
		model.addAttribute("cub_no", cubCom.getCub_no());
		return "redirect:/cuboard/view";
	}

}
