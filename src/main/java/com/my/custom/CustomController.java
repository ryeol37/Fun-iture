package com.my.custom;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.common.CustomCommon;
import com.my.funiture.AdminFormController;
import com.my.paging.CommonPaging;

@Controller
@RequestMapping("/custom")
public class CustomController {
	
//	String uploadPath =
//	"C:\\Java\\Apple\\Fun-iture\\src\\main\\webapp\\resources\\custom\\customReImg\\";
	String uploadPath = "/Users/wooseob/Desktop/Java/Fun-iture/src/main/webapp/resources/custom/customReImg/";
	
	private int currentPage=1;   // 현재페이지
	private int totalCount;	 // 전체 게시물 수
	private int blockCount;	 // 한 페이지의  게시물의 수
	private int blockPage=1;	 // 한 화면에 보여줄 페이지 수
	private String pageHtml;
	private CommonPaging page;
	
	@Resource
	private CustomService customService;
	
	CustomCommon common = new CustomCommon();
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest req, Model model) {
//		DB에서 data 가져옴
		List<CustomModel> customList = customService.selectRowsCus();
//		DB에 있는 main 이미지 중 1번째꺼만 list에 보여주기 위함
		for(int i=0; i<customList.size();i++) {
			CustomModel custom = customList.get(i);
			custom.setCu_main_save(custom.getCu_main_save().split(",")[0]);
		}
//		paging
		if(req.getParameter("page")==null||
			req.getParameter("page").trim().equals("")||
			req.getParameter("page").equals("0")) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}
		totalCount = customList.size();
		blockCount = 7;
		page = new CommonPaging(currentPage, totalCount, blockCount, blockPage,
				"/funiture/custom/list");
		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if(page.getEndCount()<totalCount) {
			lastCount = page.getEndCount()+1;
		}
		customList = customList.subList(page.getStartCount(), lastCount);
//		paging
		
		model.addAttribute("count", totalCount);
		model.addAttribute("listPage", currentPage);
		model.addAttribute("pageHtml", pageHtml);
		model.addAttribute("list", customList);
		
		return "custom/customList";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(HttpServletRequest req, Model model) {
		int cu_no = Integer.parseInt(req.getParameter("cu_no"));
		int listPage = 0;
		if(req.getParameter("list")==null||
			req.getParameter("list").trim().equals("")||
			req.getParameter("list").equals("0")) {
			listPage = 1;
//			진짜로 list의 page를 안넘겼을 경우, 또는 관리자 페이지에서 view 페이지에 접근하는 경우.
		}else {
			listPage = Integer.parseInt(req.getParameter("list"));
		}
		
		CustomModel custom = (CustomModel) customService.selectOneCus(cu_no);
//		jsp에서 cu_main_save에 있는 이미지를 순서대로 보여주기 위함
		String[] cu_main_save = custom.getCu_main_save().split(",");
		
//		상품 후기 리스트 
		List<CustomComModel> customCom = customService.selectRowsCusCom(cu_no);
		
		model.addAttribute("item", custom);
		model.addAttribute("cu_main_save", cu_main_save);
		model.addAttribute("review", customCom);
		model.addAttribute("totalCount", customCom.size());
		model.addAttribute("listPage", listPage);
		
		return "custom/customView";
	}
	
	@RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
	public String reviewForm(HttpServletRequest req, Model model) {
		int cu_no = Integer.parseInt(req.getParameter("cu_no"));
		
		model.addAttribute("cu_no", cu_no);//새창 닫힌 후 view?cu_no 하기 위해서 jsp로 넘기는 값
		return "customReviewForm";
	}
	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(MultipartHttpServletRequest mhsr, HttpSession session,
			CustomComModel customCom,
			BindingResult result, Model model) throws Exception{
		String id;
		if(session.getAttribute("session_id")==null) {
			return "custom/error";
		}//로그인 후 이용해주세요.
		else{ id=session.getAttribute("session_id").toString();}
		customCom.setId(id);
		String com = customCom.getCom().replaceAll("\r\n", "<br/>");
		customCom.setCom(com);
		
		int cu_no = customCom.getCu_no();
		
		System.out.println("UPLOAD_PATH : "+uploadPath);
		
		MultipartFile reImg = mhsr.getFile("re_img");
		String re_name = reImg.getOriginalFilename();
		if(re_name != null && !re_name.trim().equals("")) {
			String re_save = common.setFileName(re_name,"re_");
			FileCopyUtils.copy(reImg.getInputStream(), new FileOutputStream(uploadPath+"/"+re_save));
			customCom.setRe_save(re_save);
			customService.insertHasfile(customCom);
		} else {
			customService.insert(customCom);
		}
		
		model.addAttribute("cu_no", cu_no);
		return "redirect:/custom/view";
	}
	
	@RequestMapping(value = "/reviewModifyForm", method = RequestMethod.GET)
	public String reviewModifyForm(HttpServletRequest req, Model model) {
		int no = Integer.parseInt(req.getParameter("no"));
		
		CustomComModel customCom = (CustomComModel)customService.selectOneCom(no);
		String com = customCom.getCom().replaceAll("<br/>", "\r\n");
		customCom.setCom(com);
		model.addAttribute("modi", customCom);
		return "customReviewModifyForm";
	}
	
	@RequestMapping(value = "/reviewModify", method = RequestMethod.POST)
	public String reviewModify(MultipartHttpServletRequest mhsr, HttpSession session,
			CustomComModel customCom, Model model) throws Exception {
		System.out.println("UPLOAD_PATH : "+uploadPath);
		
		String com = customCom.getCom().replaceAll("\r\n", "<br/>");
		customCom.setCom(com);
		
		MultipartFile reImg = mhsr.getFile("re_img");
		String re_name = reImg.getOriginalFilename();
		if(re_name != null && !re_name.trim().equals("")) {
			String re_save = common.setFileName(re_name,"re_");
			FileCopyUtils.copy(reImg.getInputStream(), new FileOutputStream(uploadPath+"/"+re_save));
			customCom.setRe_save(re_save);
			File delFile = new File(uploadPath+"/"+customCom.getRe_img_old());
			delFile.delete();
			customService.modify(customCom);
		} else {
			if(customCom.getRe_img_old()!=null) {
				customCom.setRe_save(customCom.getRe_img_old());
				customService.modify(customCom);
			}else {
				customService.modifyWof(customCom);
			}
		}
		
		model.addAttribute("cu_no", customCom.getCu_no());
		return "redirect:/custom/view";
	}

	@RequestMapping(value = "/reviewDelete", method = RequestMethod.GET)
	public String reviewDelete(HttpServletRequest req, Model model) {
		int cu_no = Integer.parseInt(req.getParameter("cu_no"));
		int no = Integer.parseInt(req.getParameter("no"));
		
		CustomComModel customCom = (CustomComModel)customService.selectOneCom(no);
		File delFile = new File(uploadPath+"/"+customCom.getRe_save());
		delFile.delete();
		
		customService.delete(no);
		
		model.addAttribute("cu_no", cu_no);
		return "redirect:/custom/view";
	}
	
	@RequestMapping(value = "/reviewComWrite", method = RequestMethod.POST)
	public String reviewComWrite(CustomComModel customCom, Model model) {

		customService.registComRe(customCom);
		
		model.addAttribute("cu_no", customCom.getCu_no());
		return "redirect:/custom/view";
	}
	
	@RequestMapping(value = "/reviewComDelete", method = RequestMethod.GET)
	public String reviewComDelete(CustomComModel customCom, Model model) {
		
		customService.deleteComRe(customCom.getNo());
		
		model.addAttribute("cu_no", customCom.getCu_no());
		return "redirect:/custom/view";
	}
	
}
