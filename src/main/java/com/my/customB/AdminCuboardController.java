package com.my.customB;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.paging.CommonPaging;

@Controller
@RequestMapping(value = "ad/cuboard")
public class AdminCuboardController {

	private int currentPage=1;   // 현재페이지
	private int totalCount;	 // 전체 게시물 수
	private int blockCount;	 // 한 페이지의  게시물의 수
	private int blockPage=5;	 // 한 화면에 보여줄 페이지 수
	private String pageHtml;
	private CommonPaging page;
	
	@Resource
	private CuboardService cuboardService;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String adList(HttpServletRequest req,CuboardModel cuboard, Model model) {
		List<CuboardModel> cuboardList;

//		DB에서 data 가져옴
		cuboardList = cuboardService.selectRowsCubAd(cuboard);

//		paging
		if(req.getParameter("page")==null||
			req.getParameter("page").trim().equals("")||
			req.getParameter("page").equals("0")) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}
		totalCount = cuboardList.size();
		blockCount =10;
		if(cuboard.getKeyword()==null || cuboard.getKeyword().trim().equals("")) {
			model.addAttribute("slctCate", 1);
			page = new CommonPaging(currentPage, totalCount, blockCount, blockPage,
					"/funiture/ad/cuboard/list");
		}else {
			model.addAttribute("searchCate", cuboard.getSearchCate());
			model.addAttribute("keyword", cuboard.getKeyword());
			model.addAttribute("slctCate", cuboard.getSlctCate());
			page = new CommonPaging(currentPage, totalCount, blockCount, blockPage,
					"/funiture/ad/cuboard/list",cuboard.getSearchCate(),cuboard.getKeyword(),cuboard.getSlctCate());
		}
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
		return "ad/customB/adCuboardList";
	}
}
