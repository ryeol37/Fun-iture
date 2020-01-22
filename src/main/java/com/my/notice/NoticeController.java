package com.my.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.funiture.HomeController;
import com.my.paging.NoticePaging;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private int searchOption;
	private String search;
	
	private int currentPage=1; // 현재 페이지
	private int totalCount; // 전체 게시물 수
	private int blockCount; // 한 페이지의 게시물의 수
	private int blockPage=2; // 한 화면에 보여줄 페이지 수
	private String pageHtml; // jsp에서 쓸 paging 객체 선언.
	private NoticePaging page; // paging 로직이 담긴 클래스 선언.
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/notice/list")
	public ModelAndView ylist(HttpServletRequest request, NoticeModel model) throws Exception{
	
	ModelAndView mav = new ModelAndView();
	
	
	// paging
	if (request.getParameter("page")==null||
			request.getParameter("page").trim().equals("")||
			request.getParameter("page").equals("0")) {
			currentPage =1;
	} else {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	
	List<NoticeModel> list = null;
	search = request.getParameter("search");
	// 검색어를 받아서 객체 생성
	System.out.println(search);
	if (search !=null) {
		
		searchOption = Integer.parseInt(request.getParameter("searchOption"));
		// 검색 조건을 받아서 객체 생성
		
		if(searchOption == 0) { // searchOption의 값이 0 이면 (jsp에서 제목) 
			list = noticeService.searchSub(search); // 제목으로 검색 쿼리 실행
		} else if (searchOption == 1 ) { // searchOpton의 값이 1이면 (jsp에서 내용)
			list = noticeService.searchCon(search); // 내용으로 검색 쿼리 실행
		}
		
	totalCount = list.size();
	blockCount = 10;
	page = new NoticePaging(currentPage, totalCount, blockCount, blockPage,"/funituer/notice/list", searchOption, search);
	// piging 클래스 객체선언 후 파라미터 정의
	pageHtml = page.getPagingHtml().toString();
	int lastCount = totalCount;
	if(page.getEndCount()<totalCount) {
		lastCount = page.getEndCount()+1;
	}
	
	list = list.subList(page.getStartCount(), lastCount);
	
	mav.setViewName("notice/noticeList");
	mav.addObject("totalCount",totalCount);
	mav.addObject("list",list);
	mav.addObject("page",currentPage);
	mav.addObject("pageHtml",pageHtml);
	mav.addObject("search",search);
	mav.addObject("searchOption",searchOption);
	
	return mav;
	
	}
	
	list = noticeService.ylist();
	
	totalCount = list.size();
	blockCount = 10;
	page = new NoticePaging(currentPage, totalCount, blockCount, blockPage,"/funituer/notice/list");
	// piging 클래스 객체선언 후 파라미터 정의
	pageHtml = page.getPagingHtml().toString();
	int lastCount = totalCount;
	if(page.getEndCount()<totalCount) {
		lastCount = page.getEndCount()+1;
	}
	
	list = list.subList(page.getStartCount(), lastCount);
	
	mav.setViewName("notice/noticeList");
	mav.addObject("list",list);
	mav.addObject("page",currentPage);
	mav.addObject("totalCount",totalCount);
	mav.addObject("pageHtml",pageHtml);
	
	return mav;
}
	
	@RequestMapping("/notice/view")
	public ModelAndView detail(HttpServletRequest request) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		mav.setViewName("notice/noticeView");
		mav.addObject("view",noticeService.view(no));
		return mav;
	}
}
