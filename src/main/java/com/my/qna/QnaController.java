package com.my.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.member.MemberModel;
import com.my.member.MemberService;
import com.my.mypage.MypageService;
import com.my.paging.QnaPaging;
import com.my.validator.QnaValidator;

// Controller : service와 view의 중재자 역할
// ModelAndView : controller에서의 view의 중재역할 담당
// - addObject() : view 내부에 변수와 매핑 (class에서 모든 처리로직을 담은 결과를 "속성",값으로 설정)
// - setViewName() : 클라이언트의 요청을 처리 후 응답할 view 설정
// @RequestParam : <form>태그에서 POST방식으로 넘어온 파라미터들을 제어 가능함.

@Controller
public class QnaController {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	private int currentPage=1; // 현재 페이지
	private int totalCount; // 전체 게시물 수
	private int blockCount; // 한 페이지의 게시물의 수
	private int blockPage=2; // 한 화면에 보여줄 페이지 수
	private String pageHtml; // jsp에서 쓸 paging 객체 선언.
	private QnaPaging page; // paging 로직이 담긴 클래스 선언.
	
	private QnaValidator qnaValidator;
	
	@Autowired
	QnaService qnaService;
	
	ModelAndView mav = new ModelAndView();
	
	// QNA 리스트
	@RequestMapping("/qna/list")
	public ModelAndView list(MemberModel member, HttpServletRequest request, QnaModel model, HttpSession session) throws Exception{
		logger.info("QNA 게시글 목록");
		
		session.getAttribute("session_id");
		if (session.getAttribute("session_id") != null) {

			String id = (String) session.getAttribute("session_id");
			member = memberService.getMember(id);
			System.out.println("id = " + id);
	List<QnaModel> list = qnaService.list();
	
	// paging
	if (request.getParameter("page")==null||
			request.getParameter("page").trim().equals("")||
			request.getParameter("page").equals("0")) {
			currentPage =1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	totalCount = list.size();
	blockCount = 10;
	page = new QnaPaging(currentPage, totalCount, blockCount, blockPage,"/funiture/qna/list");
	// piging 클래스 객체선언 후 파라미터 정의
	pageHtml = page.getPagingHtml().toString();
	int lastCount = totalCount;
	if(page.getEndCount()<totalCount) {
		lastCount = page.getEndCount()+1;
	}
	list = list.subList(page.getStartCount(), lastCount);
	
//	ModelAndView mav = new ModelAndView();
	mav.setViewName("qna/qnaList");
	
	mav.addObject("list",list);
	mav.addObject("page",currentPage);
	mav.addObject("pageHtml",pageHtml);
		
	return mav;
		} else {
			mav.setViewName("member/loginform");
			return mav;
	}
	}
	// 글쓰기 폼
	@RequestMapping("/qna/writeForm")
	public ModelAndView write(Model model,HttpSession session) throws Exception {
		
		logger.info("QNA 글 작성");
		
		HashMap<String,String> category = new HashMap<String,String>();
		
		category.put("상품문의","상품문의");
		category.put("배송문의","배송문의");
		category.put("기타문의","기타문의");

		
		model.addAttribute("model",new QnaModel()); 
		model.addAttribute("category",category);

		mav.setViewName("qna/qnaWriteForm");
		
		return mav;
	}
	
	// 글쓰기 처리
	@RequestMapping(value="/qna/writeForm", method=RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute("model") QnaModel model, HttpSession session, BindingResult result, MemberModel member) throws Exception{
		logger.info("QNA 작성 글 처리");
		
//		ModelAndView mav = new ModelAndView();
		
		
		new QnaValidator().validate(model, result); // 유효성검사 수행
		
		if(result.hasErrors()) { // 에러발생시
			mav.setViewName("qna/qnaWriteForm");
			return mav;
		}
		
		// 에러 통과 후
		
		String id = (String) session.getAttribute("session_id");
		model.setId(id);
		
		qnaService.insert(model);

		mav.addObject("id",id);
		mav.addObject("model",model);
		mav.setViewName("redirect:/qna/list");
		
		return mav;
		}
	
	// 코멘트 달기
	@RequestMapping(value="/qna/comment", method = RequestMethod.POST)
	public String commentInsert(@ModelAttribute QnaComModel model, HttpServletRequest request, HttpSession session) throws Exception{
		logger.info("QNA 댓글 작성");
		String id = (String) request.getParameter("id");
		String com = (String) request.getParameter("com");
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
		model.setId(id);
		model.setQna_no(qna_no);
		model.setCom(com);
		
		qnaService.commentInsert(model);
		
		/*System.out.println(model.getId());
		System.out.println(model.getQna_no());
		System.out.println(model.getCom());*/
		
		return "redirect:/qna/view?qna_no="+qna_no;
		
}
	
	// qna 상세보기
	@RequestMapping("/qna/view")
	public ModelAndView view(HttpServletRequest request, QnaModel model) throws Exception{
		logger.info("QNA 게시글 상세보기");
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("qna_no"));
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
		
		List<QnaComModel> commentlist = qnaService.commentList(qna_no);
		
		mav.setViewName("qna/qnaView");
		mav.addObject("view",qnaService.view(no));
		mav.addObject("commentList",commentlist);
		return mav;
	}
	
	// qna 수정 폼
	@RequestMapping(value="/qna/modify", method=RequestMethod.GET)
	public ModelAndView update(@ModelAttribute("modify") QnaModel model, HttpServletRequest request) throws Exception{
		logger.info("QNA 게시글 수정");
		ModelAndView mav = new ModelAndView();
		
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
		model = qnaService.view(qna_no);
		System.out.println(model.getQna_no());
		String content = model.getContent();
		
		content = content.replaceAll("<br/>","\r\n");
		
		String category = model.getCategory();
		model.setCategory(category);
		model.setContent(content);
		System.out.println(model.getContent());
		System.out.println(model.getCategory());
		mav.setViewName("qna/qnaModifyForm");
		mav.addObject("modify",model);
		
		return mav;
		
	}
	
	// qna 글 수정 처리
	@RequestMapping(value="/qna/modify", method=RequestMethod.POST)
	public ModelAndView modfiy(@ModelAttribute("modify") QnaModel model, HttpServletRequest request) throws Exception{
		logger.info("QNA 게시글 수정처리");
		ModelAndView mav = new ModelAndView();
		
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		String category = request.getParameter("category");
		System.out.println(category);
		/*System.out.println(qna_no);*/
		qnaService.modify(model);
		
		mav.setViewName("redirect:/qna/list");
		
		return mav;
		
}
	
	// 코멘트 수정 폼
	@RequestMapping(value="/qna/modifycom", method=RequestMethod.GET)
	public ModelAndView commentUpdate(HttpServletRequest request, QnaComModel model) throws Exception{
		logger.info("댓글 수정 폼");
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		model = qnaService.commentview(no);
		System.out.println(model.getNo());
		
		/*String com = model.getCom();*/
		
		/*com = com.replaceAll("<br/>","\r\n");*/
		/*model.setCom(com);
		System.out.println(com);*/
		/*qnacomService.commentUpdate(model);*/
		
		mav.setViewName("modifyCom");
		mav.addObject("model",model);
		System.out.println(model);
		return mav;
		
		
		
	}
	
	// 코멘트 수정 처리
	@RequestMapping(value="/qna/modifycomment", method=RequestMethod.POST)
	public ModelAndView commentUpdate(QnaComModel model) throws Exception{
		logger.info("댓글 수정처리");
		ModelAndView mav = new ModelAndView();
		
		/*int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		System.out.println(qna_no);*/
		qnaService.commentUpdate(model);
		/*System.out.println(model);*/
		mav.addObject("qna_no",model.getQna_no());
		mav.setViewName("redirect:/qna/view");
		
		return mav;
	
}

	// qna 글 삭제
	@RequestMapping("/qna/delete")
	public String delete(@RequestParam int qna_no) throws Exception{
		logger.info("QNA 게시글 삭제");
		qnaService.delete(qna_no);
		return "redirect:/qna/list";
	}
	
	// qna 댓글 삭제
	@RequestMapping("/qna/deletecom")
	public ModelAndView commentDelete(HttpServletRequest request, HttpSession session) throws Exception{
		logger.info("QNA 댓글 삭제");
		
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		System.out.println(qna_no);
		ModelAndView mav = new ModelAndView();
		
		qnaService.commentDelete(no);
		
		mav.addObject("qna_no",qna_no); // view 화면에 보내줄 객체
		mav.setViewName("redirect:/qna/view");
		
		return mav;
	}
	
}

