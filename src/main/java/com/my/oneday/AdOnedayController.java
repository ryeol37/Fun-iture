package com.my.oneday;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.paging.CommonPaging;
import com.my.oneday.AdOnedayModel;

//강의 CRUD
@Controller
@RequestMapping("/oneday")
public class AdOnedayController {

	@Resource(name = "adOnedayService")
	private AdOnedayService adOnedayService;

	@ModelAttribute("adOnedayModel")
	public AdOnedayModel adOnedayModel() {
		return new AdOnedayModel();
	}

	/* 강좌 리스트 불러오기 페이징 */
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockpaging = 5;
	private String pagingHtml;
	private CommonPaging commonPaging;
	
	/*main_save 이미지 저장 경로*/
//	private String filePath = "C:\\java\\App\\Fun-iture\\src\\main\\webapp\\resources\\oneday_upload\\";
	private String filePath = "/Users/wooseob/Desktop/Java/Fun-iture/src/main/webapp/resources/oneday_upload/";

	private ModelAndView mav = new ModelAndView();

	/* 강좌 리스트 불러오기 */
	@RequestMapping(value = "/adlist", method = RequestMethod.GET)
	public ModelAndView onedayList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<AdOnedayModel> onedayList = adOnedayService.list();

		/* 이 밑으론 페이징 */
		if (request.getParameter("page") == null || request.getParameter("page").trim().isEmpty()
				|| request.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		totalCount = onedayList.size();

		commonPaging = new CommonPaging(currentPage, totalCount, blockCount, blockpaging, "/funiture/oneday/adlist");
		pagingHtml = commonPaging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (commonPaging.getEndCount() < totalCount) {
			lastCount = commonPaging.getEndCount() + 1;
		}

		onedayList = onedayList.subList(commonPaging.getStartCount(), lastCount);

		/*뷰 페이지에서 불러올 데이터를 담을 list 설정*/
		mv.addObject("list", onedayList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("ad/admin_form/adOnedayList");
		return mv;

	}

	/* 새 강좌 등록하기 폼 */
	@RequestMapping(value = "/adwriteForm", method = RequestMethod.GET)
	public ModelAndView onedayWriteForm(HttpServletRequest request) {
		mav.setViewName("ad/admin_form/adOnedayWriteForm");
		return mav;
	}

	/* 새 강좌 등록하기 */
	@RequestMapping(value = "/adwrite", method = RequestMethod.POST)
	public ModelAndView onedayWrite(@ModelAttribute("adOnedayModel") AdOnedayModel adOnedayModel, BindingResult result,
			HttpServletRequest request) throws IOException {
		
		/* HttpServletRequest로 파일 가져오기 - MultipartHttpServletRequest 이걸 직접적으로 받아오려니까 안먹힘... */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("main_save");
		System.out.println(adOnedayModel.getDay());
		
		/*setDay로 받아온 숫자 날짜 형식으로 저장하기 */
		try {
			adOnedayModel.setDay(new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("day")));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		/* oneday_no 값을 시퀀스로 생성함 */
		int seqName = adOnedayService.getOneday_NO_SEQ();

		/* adOnedayModel의 oneday_no를 시퀀스 값으로 넣음 */
		adOnedayModel.setOneday_no(seqName);

		/* 강좌 상세정보 이미지 파일 이름 지정, 서버에 입력 */
		/*request로 받아온 파일이 없을 경우 - main_save_ 뒤에 강의 번호 이름 붙여서 저장*/
		if (!multipartRequest.getFile("main_save").getOriginalFilename().equals("")) {
			MultipartFile multipartFile0 = multipartRequest.getFile("main_save");
			String file_name0 = "main_save_" + seqName;
			String file_ext0 = multipartFile0.getOriginalFilename()
					.substring(multipartFile0.getOriginalFilename().lastIndexOf('.') + 1);
			if (file_ext0 != "") {
				String full_name = file_name0 + "." + file_ext0;
				File file = new File(filePath + full_name);

				if (!file.exists()) {
					file.mkdirs();
				}
				try {
					multipartFile0.transferTo(file);
				} catch (Exception e) {
				}
				adOnedayModel.setMain_save(full_name);
			}
		} else {
			/*저장한 이미지가 없을 경우 null로 보내지 않도록 "사진없음"으로 저장하기 */
			adOnedayModel.setMain_save("사진없음");
		}
		// 로그인 세션 가져오기
		HttpSession session = request.getSession();
		// 세션 아이디를 id로
		String id = (String) session.getAttribute("session_id");
		// 작성자 아이디에 세션 아이디 담기
		adOnedayModel.setId_admin(id);
		/* 입력 service 실행 */
		adOnedayService.write(adOnedayModel);
		/* 입력 완료 후 리스트로 리다이렉트 */
		mav.setViewName("redirect:/oneday/adlist");
		return mav;
	}

	/* 강좌 상세보기+강좌 수정하기 폼 */
	@RequestMapping(value = "/admodifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(HttpServletRequest request) {

		// 모델앤뷰 선언-여기에 불러올 강좌 정보를 담아야됨
		ModelAndView mav = new ModelAndView();
		// 강좌 불러올 원데이 클래스 넘버를 넣음
		int oneday_no = Integer.parseInt(request.getParameter("oneday_no"));
		// oneday_no를 넣어서 불러올 강의 정보 찾음
		List<AdOnedayModel> list = adOnedayService.view(oneday_no);
		// 모델에 list에 들어갈 부분 설정
		mav.addObject("list", list);
		// 모델앤뷰 불러올 뷰 페이지 이름 설정
		mav.setViewName("ad/admin_form/adOnedayView");
		// 모델앤뷰 반환
		
		return mav;
		/* 수정폼에 가져올 미리 넣어둘 정보는 jsp에 모델에서 가져오는 패턴 넣으면 되나? */
	}

	/* 강좌 수정 */
	@RequestMapping(value = "/admodify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("onedayModel") AdOnedayModel onedayModel, BindingResult result,
			HttpServletRequest request) {
		try {
			onedayModel.setDay(new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("day")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		/* oneday_no 값을 시퀀스로 생성함 */
		int seqName = adOnedayService.getOneday_NO_SEQ();
		/* HttpServletRequest로 파일 가져오기 */
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("main_save");

		/* 강좌 상세정보 이미지 파일 이름 지정, 서버에 입력 */
		/*만약 수정폼에서 이미지를 새로 저장하지 않았다면 main_old 기존에 main_save로 저장했던 파일을 그대로 저장하기 */
		if (((MultipartRequest) request).getFile("main_save").getOriginalFilename().equals("")) {
			onedayModel.setMain_save(request.getParameter("main_old"));
		} else {
			/*새로 main_save 이미지를 가져왔으면 */
			MultipartFile multipartFile0 = multipartRequest.getFile("main_save");
			/*main_save_뒤에 강의 번호 붙여서 저장하기 */
			String file_name0 = "main_save_" + seqName;
			String file_ext0 = multipartFile0.getOriginalFilename()
					.substring(multipartFile0.getOriginalFilename().lastIndexOf('.') + 1);
			if (file_ext0 != "") {
				String full_name = file_name0 + "." + file_ext0;
				File file = new File(filePath + full_name);

				if (!file.exists()) {
					file.mkdirs();
				}
				try {
					multipartFile0.transferTo(file);
				} catch (Exception e) {
				}
				onedayModel.setMain_save(full_name);
			}
		}

		adOnedayService.modify(onedayModel);

		return "redirect:/oneday/adlist";

	}

	/* 강좌 삭제 */
	@RequestMapping(value = "/addelete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		// oneday_no로 강좌 번호 받아옴
		int oneday_no = Integer.parseInt(request.getParameter("oneday_no"));
		// adOnedayService에서 delete메소드 실행해서 강좌 삭제함
		adOnedayService.delete(oneday_no);
		// 리스트로 리다이렉트
		return "redirect:/oneday/adlist";
	}
	

}
