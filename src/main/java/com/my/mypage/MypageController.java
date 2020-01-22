package com.my.mypage;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.member.MemberModel;
import com.my.member.MemberService;
import com.my.mypage.MypageService;
import com.my.customB.CuboardModel;
import com.my.customB.CuboardService;
import com.my.goods.goodsComModel;
import com.my.goods.goodsModel;
import com.my.goods.goodsService;
import com.my.order.OrderModel;
import com.my.order.OrderService;
import com.my.qna.QnaModel;
import com.my.qna.QnaService;
import com.my.paging.boardPaging;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private int keyField;
	private String keyword;
	private String os;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount;
	private int blockPage = 5;
	private String pageHtml;
	private boardPaging page;

	@Resource(name = "mypageService")
	private MypageService mypageService;

	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "orderService")
	private OrderService orderService;

	@Resource(name = "qnaService")
	private QnaService qnaService;

	@Resource(name = "goodsService")
	private goodsService goodsService;

	@Resource(name = "cuboardService")
	private CuboardService cuboardService;

	ModelAndView mav = new ModelAndView();
	String session_id;

	@RequestMapping("/myform")
	public ModelAndView mypage(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session,
			OrderModel orderModel) {

		session.getAttribute("session_id");
		if (session.getAttribute("session_id") != null) {

			String id = (String) session.getAttribute("session_id");
			member = memberService.getMember(id);
			List<OrderModel> myorderList = orderService.myorderList(id);
			/* 입금 대기 중 / 상품 준비중 / 배송 중 / 배송 완료 / 주문 취소 / 교환 요청 / 반품 요청 */
			orderModel.setId(id);
			orderModel.setStatus_no(1);
			int statusCount1 = orderService.statusCount(orderModel);
			orderModel.setStatus_no(2);
			int statusCount2 = orderService.statusCount(orderModel);
			orderModel.setStatus_no(3);
			int statusCount3 = orderService.statusCount(orderModel);
			orderModel.setStatus_no(4);
			int statusCount4 = orderService.statusCount(orderModel);
			orderModel.setStatus_no(7);
			int statusCount7 = orderService.statusCount(orderModel);
			orderModel.setStatus_no(8);
			int statusCount8 = orderService.statusCount(orderModel);
			orderModel.setStatus_no(11);
			int statusCount11 = orderService.statusCount(orderModel);
			int statusCount5 = statusCount7 + statusCount8 + statusCount11;

			mav.addObject("myorderList", myorderList);
			mav.addObject("statusCount1", statusCount1);
			mav.addObject("statusCount2", statusCount2);
			mav.addObject("statusCount3", statusCount3);
			mav.addObject("statusCount4", statusCount4);
			mav.addObject("statusCount5", statusCount5);
			mav.addObject("member", member);
			mav.setViewName("mypage/myform");
			return mav;
		} else {
			mav.setViewName("member/loginform");
			return mav;
		}
	}

	@RequestMapping(value = "/myqnaList")
	public ModelAndView myqnaList(@ModelAttribute("member") MemberModel member, BindingResult result,
			HttpServletRequest req, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);

		List<QnaModel> myqnaList = qnaService.myqnaList(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}

		keyword = req.getParameter("keyword");

		if (keyword != null) {

			keyField = Integer.parseInt(req.getParameter("keyField"));

			if (keyField == 0) {
				myqnaList = qnaService.searchS(keyword);
			} else {
				myqnaList = qnaService.searchC(keyword);
			}
		}

		totalCount = myqnaList.size();
		blockCount = 5;
		if (keyword != null) {
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/myqnaList",
					keyField, keyword);
		} else {
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/myqnaList");
		}

		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		myqnaList = myqnaList.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("myqnaList", myqnaList);

		mav.setViewName("mypage/myqnaList");
		return mav;
	}
	// 페이징처리 안한거
	/*
	 * @RequestMapping(value = "/orderList") public ModelAndView
	 * myorderList(@ModelAttribute("member") MemberModel member, BindingResult
	 * result, HttpServletRequest req, HttpSession session) throws Exception {
	 * session.getAttribute("session_id"); String id = (String)
	 * session.getAttribute("session_id"); member = memberService.getMember(id);
	 * 
	 * List<OrderModel> myorderList = orderService.myorderList(id);
	 * 
	 * os = req.getParameter("os");
	 * 
	 * if (os != null) { if (os.equals("all")) { myorderList =
	 * orderService.myorderList(id); } else if (os.equals("before")) { myorderList =
	 * orderService.st1(id); } else if (os.equals("standby")) { myorderList =
	 * orderService.st2(id); } else if (os.equals("begin")) { myorderList =
	 * orderService.st3(id); } else if (os.equals("complate")) { myorderList =
	 * orderService.st4(id); } else if (os.equals("cancel")) { myorderList =
	 * orderService.st8(id); } else if (os.equals("exchange")) { myorderList =
	 * orderService.st10(id); } else { myorderList = orderService.st6(id); } }
	 * 
	 * mav.addObject("member", member); mav.addObject("myorderList", myorderList);
	 * 
	 * mav.setViewName("mypage/orderList"); return mav; }
	 */

	@RequestMapping(value = "/orderList")
	public ModelAndView myorderList(@ModelAttribute("member") MemberModel member, BindingResult result,
			HttpServletRequest req, HttpSession session) throws Exception {
		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);

		List<OrderModel> myorderList = orderService.myorderList(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}

		totalCount = myorderList.size();
		blockCount = 5;

		os = req.getParameter("os");

		if (os != null) {
			if (os.equals("all")) {
				myorderList = orderService.myorderList(id);
			} else if (os.equals("before")) {
				myorderList = orderService.st1(id);
			} else if (os.equals("standby")) {
				myorderList = orderService.st2(id);
			} else if (os.equals("begin")) {
				myorderList = orderService.st3(id);
			} else if (os.equals("complate")) {
				myorderList = orderService.st4(id);
			} else if (os.equals("cancel")) {
				myorderList = orderService.st8(id);
			} else if (os.equals("exchange")) {
				myorderList = orderService.st10(id);
			} else {
				myorderList = orderService.st6(id);
			}
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/orderList", os);
		} else {
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/orderList");
		}

		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		if (myorderList.size() < page.getEndCount()) {
			lastCount = myorderList.size();
		}

		myorderList = myorderList.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("myorderList", myorderList);

		mav.setViewName("mypage/orderList");
		return mav;
	}

	@RequestMapping(value = "/mycubList")
	public ModelAndView mycubList(@ModelAttribute("member") MemberModel member, BindingResult result,
			HttpServletRequest req, HttpSession session) throws Exception {
		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);
		
		List<CuboardModel> cubList = cuboardService.cubList(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}

		keyword = req.getParameter("keyword");

		if (keyword != null) {

			keyField = Integer.parseInt(req.getParameter("keyField"));

			if (keyField == 0) {
				cubList = cuboardService.searchS(keyword);
			} else {
				cubList = cuboardService.searchC(keyword);
			}
		}

		totalCount = cubList.size();
		blockCount = 5;
		if (keyword != null) {
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/mycubList",
					keyField, keyword);
		} else {
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/mycubList");
		}

		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		cubList = cubList.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("cubList", cubList);

		mav.setViewName("mypage/mycubList");
		return mav;
	}

	@RequestMapping(value = "/mycomList")
	public ModelAndView mycomList(@ModelAttribute("member") MemberModel member, BindingResult result,
			HttpServletRequest req, HttpSession session) throws Exception {
		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);

		List<goodsComModel> mycomList = goodsService.mycomList(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}

		keyword = req.getParameter("keyword");

		if (keyword != null) {

			keyField = Integer.parseInt(req.getParameter("keyField"));

			mycomList = goodsService.searchC(keyword);
			/*
			 * if (keyField == 0) { mycomList = goodsService.searchN(keyword); } else {
			 * mycomList = goodsService.searchC(keyword); }
			 */
		}

		totalCount = mycomList.size();
		blockCount = 5;
		if (keyword != null) {
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/mycomList",
					keyField, keyword);
		} else {
			page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/mycomList");
		}

		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		mycomList = mycomList.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("mycomList", mycomList);

		mav.setViewName("mypage/mycomList");
		return mav;
	}

	@RequestMapping("/creList")
	public ModelAndView creList(@ModelAttribute("member") MemberModel member, HttpSession session,
			HttpServletRequest req) throws Exception {

		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);

		List<OrderModel> creList = orderService.creList(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}
		totalCount = creList.size();
		blockCount = 5;
		page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/creList");
		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		creList = creList.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);

		mav.addObject("creList", creList);
		mav.setViewName("mypage/creList");

		return mav;
	}

	@RequestMapping(value = "/likeList")
	public ModelAndView likeList(@ModelAttribute("member") MemberModel member, HttpSession session,
			HttpServletRequest req) throws Exception {
		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);

		List<goodsModel> likeList = goodsService.likeList(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}
		totalCount = likeList.size();
		blockCount = 5;
		page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/likeList");
		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		likeList = likeList.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);

		mav.addObject("likeList", likeList);
		mav.setViewName("mypage/likeList");

		return mav;
	}

	// 주문제작
	@RequestMapping(value = "/ordermadeList")
	public ModelAndView ordermadeList(@ModelAttribute("member") MemberModel member, HttpSession session,
			HttpServletRequest req) throws Exception {
		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);

		List<OrderModel> myorderCus = mypageService.myorderCus(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}
		totalCount = myorderCus.size();
		blockCount = 5;
		page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/ordermadeList");
		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		myorderCus = myorderCus.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);
		mav.addObject("myorderCus", myorderCus);
		mav.setViewName("mypage/ordermadeList");

		return mav;
	}

	// 수강신청 내역
	@RequestMapping(value = "/orderoneList")
	public ModelAndView orderoneList(@ModelAttribute("member") MemberModel member, HttpSession session,
			HttpServletRequest req) throws Exception {
		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
		member = memberService.getMember(id);

		List<OrderModel> myorderOne = mypageService.myorderOne(id);

		if (req.getParameter("page") == null || req.getParameter("page").trim().equals("")
				|| req.getParameter("page").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(req.getParameter("page"));
		}
		totalCount = myorderOne.size();
		blockCount = 5;
		page = new boardPaging(currentPage, totalCount, blockCount, blockPage, "/funiture/mypage/orderoneList");
		pageHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		myorderOne = myorderOne.subList(page.getStartCount(), lastCount);

		mav.addObject("member", member);
		mav.addObject("pageHtml", pageHtml);

		mav.addObject("myorderOne", myorderOne);
		mav.setViewName("mypage/orderoneList");

		return mav;
	}

	//주문취소
	@RequestMapping(value="orderCancel")
	public ModelAndView orderCancel(HttpServletRequest request, OrderModel orderModel){
		System.out.println(orderModel.getOrder_no());
		
		mypageService.orderCancel(orderModel);
		System.out.println(orderModel.getId());
		mav.setViewName("redirect:/mypage/orderList");
		
		return mav;
	}
	// 교환/반품 철회 
	@RequestMapping(value="reCancel")
	public ModelAndView reCancel(HttpServletRequest request, OrderModel orderModel){
		
		mypageService.reCancel(orderModel);
		mav.setViewName("redirect:/mypage/orderList");
		
		return mav;
	}
	// 환불요청
	@RequestMapping(value="refound")
	public ModelAndView refound(HttpServletRequest request, OrderModel orderModel){
		
		mypageService.refound(orderModel);
		mav.setViewName("redirect:/mypage/orderList");
		
		return mav;
	}
	
	// 교환요청
	@RequestMapping(value="exchange")
	public ModelAndView exchange(HttpServletRequest request, OrderModel orderModel){
		
		mypageService.exchange(orderModel);
		mav.setViewName("redirect:/mypage/orderList");
		
		return mav;
	}
	
	// 원데이취소
	@RequestMapping(value="oneCancel")
	public ModelAndView oneCancel(HttpServletRequest request, OrderModel orderModel){
		
		mypageService.oneCancel(orderModel);
		mav.setViewName("redirect:/mypage/orderoneList");
		
		return mav;
	}
	
}
