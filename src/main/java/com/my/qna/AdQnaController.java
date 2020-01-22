package com.my.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.funiture.AdminFormController;

@Controller
public class AdQnaController {

	private static final Logger logger = LoggerFactory.getLogger(AdQnaController.class);
	
	@Autowired
	QnaService qnaService;
	
	// QNA 게시글 목록
	@RequestMapping("/adqna/list")
	public ModelAndView list() throws Exception{
		logger.info("QNA 게시글 목록");
		List<QnaModel> list = qnaService.adlist();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ad/qna/adQnaList");
		mav.addObject("list",list);
		
		return mav;
	}
	
	// QNA 상세보기
	@RequestMapping("/adqna/view")
	public ModelAndView view(HttpServletRequest request) throws Exception{
		logger.info("QNA 게시글 상세보기");
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("qna_no"));
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		
		List<QnaComModel> commentlist = qnaService.commentList(qna_no);
		
		mav.setViewName("ad/qna/adQnaView");
		mav.addObject("view",qnaService.view(no));
		mav.addObject("commentList",commentlist);
		return mav;
	}
	
	// qna 글 삭제
			@RequestMapping("/adqna/addelete")
			public String delete(@RequestParam int qna_no) throws Exception{
				logger.info("QNA 게시글 삭제");
				qnaService.delete(qna_no);
				return "redirect:/adqna/list";
			}
	
	// QNA 댓글
	// 댓글 작성
		@RequestMapping(value="/adqna/comment", method = RequestMethod.POST)
		public String commentInsert(@ModelAttribute QnaComModel model, HttpServletRequest request, HttpSession session) throws Exception{
			logger.info("댓글 작성");
			
			String id = (String) session.getAttribute("session_id");
			model.setId(id);
			
			
			/*String id = (String) request.getParameter("id");*/
			String com = (String) request.getParameter("com");
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			
			model.setId(id);
			model.setQna_no(qna_no);
			model.setCom(com);
			
			qnaService.commentInsert(model);
			
			System.out.println(model.getId());
			System.out.println(model.getQna_no());
			System.out.println(model.getCom());
			
			return "redirect:/adqna/view?qna_no="+qna_no;
	
		}
		
		// 코멘트 수정 폼
		@RequestMapping(value="/adqna/modifycom", method=RequestMethod.GET)
		public ModelAndView commentUpdate(HttpServletRequest request, QnaComModel model) throws Exception{
			logger.info("댓글 수정 폼");
			ModelAndView mav = new ModelAndView();
			
			int no = Integer.parseInt(request.getParameter("no"));
			
			model = qnaService.commentview(no);
			/*System.out.println(model.getNo());*/
			
			/*String com = model.getCom();
			
			com = com.replaceAll("<br/>","\r\n");
			model.setCom(com);
			System.out.println(com);*/
			qnaService.commentUpdate(model);
			
			mav.setViewName("modifyCom");
			mav.addObject("model",model);
			return mav;
			
		}
		
		// 코멘트 수정 처리
		@RequestMapping(value="/adqna/modifycomment", method=RequestMethod.POST)
		public ModelAndView commentUpdate(QnaComModel model) throws Exception{
			logger.info("댓글 수정처리");
			ModelAndView mav = new ModelAndView();
			
			qnaService.commentUpdate(model);
			/*System.out.println(model);*/
			mav.addObject("qna_no",model.getQna_no());
			mav.setViewName("redirect:/adqna/view");
			
			return mav;
		
	}
		
		
		
		// qna 댓글 삭제
		@RequestMapping("/adqna/deletecom")
		public ModelAndView commentDelete(HttpServletRequest request, HttpSession session) throws Exception{
			logger.info("댓글삭제");
			
			int no = Integer.parseInt(request.getParameter("no"));
			/*System.out.println(no);*/
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			/*System.out.println(qna_no);*/
			ModelAndView mav = new ModelAndView();
			
			qnaService.commentDelete(no);
			
			mav.addObject("qna_no",qna_no); // view 화면에 보내줄 객체
			mav.setViewName("redirect:/adqna/view");
			
			return mav;
		}
		
		
}
