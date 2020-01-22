package com.my.notice;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
// 클라이언트 요청이 들어오면 해당하는 서비스클래스의 메소드를 호출해서 처리하는 메소드 작성.

import com.my.member.MemberModel;
import com.my.member.MemberService;
import com.my.validator.NoticeValidator;

@Controller
public class AdNoticeController {

	@Autowired
	NoticeService noticeService;
	
	// 공지사항 목록
	@RequestMapping("/adnotice/list")
	public ModelAndView list(HttpSession session) throws Exception {
		session.getAttribute("session_id");
		if (session.getAttribute("session_id") != null) {

			String id = (String) session.getAttribute("session_id");
			System.out.println("id = " + id);
		
	}
		List<NoticeModel> list = noticeService.list();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ad/notice/adNoticeList");
		mav.addObject("list", list);
		
		return mav;
	}
	
	// 공지사항 글쓰기 폼
	@RequestMapping(value = "/adnotice/writeForm",method=RequestMethod.GET)
	public String write(Model model) {
		
		model.addAttribute("model",new NoticeModel());
		
		return "ad/notice/adNoticeWriteForm";
	}
	
	// 공지사항 글쓰기 처리
	// spring에서 form의 유효성 검사를 하는 경우 매개변수로 BindingResult를 추가 해 주어야 한다.
	@RequestMapping(value = "/adnotice/writeForm", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("model") NoticeModel model, BindingResult result, HttpServletRequest request, MemberModel mem) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		// 유효성 검사 수행
		new NoticeValidator().validate(model, result);
		System.out.println(result);
		/*System.out.println(result);*/
		// 유효성 검사를 수행한 후 실패한 데이터가 있으면 {} 수행
		if(result.hasErrors()) {
			mav.setViewName("ad/notice/adNoticeWriteForm");
			return mav;
		} 
		
		// 유효성 검사 수행 정상완료하는 있으면 {} 수행
//		String id_admin = (String) session.getAttribute("id_admin");
//		
//		model.setId_admin(id_admin);	
		
				
		HttpSession session = request.getSession();
		
		String id_admin = (String) session.getAttribute("session_id");
//		
		model.setId_admin(id_admin);
		System.out.println(id_admin);
		/*session.setAttribute("mem", mem);
		session.setAttribute("session_id", mem.getId());*/
		noticeService.insert(model);
		
		mav.addObject("model",model);
		mav.setViewName("redirect:/adnotice/list");
		return mav;
	}
	
	// 공지사항 상세보기
	@RequestMapping(value = "/adnotice/view")
	public ModelAndView view(@RequestParam int no, NoticeModel model) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<NoticeModel> list  = new ArrayList<NoticeModel>();

		mav.setViewName("ad/notice/adNoticeView");
		mav.addObject("list",list);
		mav.addObject("view", noticeService.view(no));
		System.out.println(no);
		return mav;
	}
	
	
	// 공지사항 수정 폼
	@RequestMapping(value = "/adnotice/modify", method = RequestMethod.GET)
	public ModelAndView update(@ModelAttribute("modify") NoticeModel model, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		model = noticeService.view(no);
		
		String content = model.getContent();
		
		content = content.replaceAll("<br/>", "\r\n");
		model.setContent(content);
		
		System.out.println(model.getId_admin());
		System.out.println(model.getSubject());
		System.out.println(model.getContent());
		mav.setViewName("ad/notice/adNoticeModifyForm");
		mav.addObject("modify", model);

		return mav;
	}

	
	// 공지사항 수정 처리
	@RequestMapping(value = "/adnotice/modify", method = RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute("modify") NoticeModel model, HttpServletRequest request)
			throws Exception {

		ModelAndView mav = new ModelAndView();

		int no = Integer.parseInt(request.getParameter("no"));
		
		noticeService.modify(model);

		mav.setViewName("redirect:/adnotice/list");
		
		return mav;
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "/adnotice/delete")
	public String delete(@RequestParam int no) throws Exception {

		noticeService.delete(no);
		System.out.println(no);
		return "redirect:/adnotice/list";
	}


	
}
