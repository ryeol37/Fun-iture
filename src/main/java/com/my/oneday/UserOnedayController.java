package com.my.oneday;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.my.paging.CommonPaging;

import com.my.oneday.AdOnedayModel;

@Controller
@RequestMapping("/oneday")
public class UserOnedayController {

	@Resource(name = "userOnedayService")
	private UserOnedayService userOnedayService;

	@Resource(name = "adOnedayService")
	private AdOnedayService adOnedayService;

	@ModelAttribute("userOnedayModel")
	public UserOnedayModel userOnedayModel() {
		return new UserOnedayModel();
	}

	@ModelAttribute("adOnedayModel")
	public AdOnedayModel adOnedayModel() {
		return new AdOnedayModel();
	}

	/* 강좌 리스트 불러오기 페이징 */
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 6;
	private int blockpaging = 6;
	private String pagingHtml;
	private CommonPaging commonPaging;

	private ModelAndView mav = new ModelAndView();

	/* 강좌 리스트 불러오기 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
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

		commonPaging = new CommonPaging(currentPage, totalCount, blockCount, blockpaging, "/funiture/oneday/list");
		pagingHtml = commonPaging.getPagingHtml().toString();

		int lastCount = totalCount;

		if (commonPaging.getEndCount() < totalCount) {
			lastCount = commonPaging.getEndCount() + 1;
		}

		onedayList = onedayList.subList(commonPaging.getStartCount(), lastCount);

		/* 뷰 페이지에서 불러올 데이터를 담을 list 설정 */
		mv.addObject("list", onedayList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("oneday/userOnedayList");
		return mv;

	}

	/* 강좌 상세보기 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(HttpServletRequest request, @ModelAttribute AdOnedayModel adOnedayModel) {

		// 모델앤뷰 선언-여기에 불러올 강좌 정보를 담아야됨
		ModelAndView mav = new ModelAndView();
		// 강좌 불러올 원데이 클래스 넘버를 넣음
		int oneday_no = Integer.parseInt(request.getParameter("oneday_no"));
		// oneday_no를 넣어서 불러올 강의 정보 찾음
		List<AdOnedayModel> list = adOnedayService.view(oneday_no);
		// 모델에 list에 들어갈 부분 설정
		int maxnumForOption = list.get(0).getMaxnum();
		List<Object> list2 = new ArrayList<Object>();
		for (int i = 1; i <= maxnumForOption; i++) {
			list2.add(i);
		}
		mav.addObject("list2", list2);
		mav.addObject("list", list);
		// 모델앤뷰 불러올 뷰 페이지 이름 설정
		mav.setViewName("oneday/userOnedayView");

		// 모델앤뷰 반환
		return mav;
	}

	/* 강좌 예약하기 - ORDERS_ONE 테이블로 넘김 */
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public ModelAndView order(@ModelAttribute("userOnedayModel") UserOnedayModel userOnedayModel,
			HttpServletRequest request) throws IOException {
		// order_no 생성
		int seqName = userOnedayService.getOrder_no();
		// userOnedayModel 의 order_no를 시퀀스 값으로 넣음
		userOnedayModel.setOrder_no(seqName);
		// 로그인 세션 가져오기
		HttpSession session = request.getSession();
		// 세션 아이디를 id로
		String id = (String) session.getAttribute("session_id");
		// 예약자 아이디에 세션 아이디 담기
		userOnedayModel.setId(id);
		// status_no를 입금 대기중인 1로 입력
		userOnedayModel.setStatus_no(1);
		// 강좌 예약 service 실행
		userOnedayService.order(userOnedayModel);
		// 강의 maxnum 불러와서 예약할때 선택한 인원수를 빼고 남은 인원수 계산
		int updatedMaxnum = (userOnedayModel.getTestMaxnum()) - (userOnedayModel.getGoods_qty());
		// 남은 인원수 계산한걸 모델에 담아가서
		userOnedayModel.setTestMaxnum(updatedMaxnum);
		// 원데이 테이블에 있는 강좌 최대 인원수 수정함
		userOnedayService.updateMaxnum(userOnedayModel);
		// 입력 완료 후 리스트로 리다이렉트
		mav.setViewName("redirect:/oneday/list");

		return mav;
	}

	/* Ajax로 예상가격 불러오기 */
	@ResponseBody
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public ModelAndView test(ModelAndView modelAndView, AdOnedayModel adOnedayModel, HttpServletRequest request) {
		System.out.println("컨트롤러로 들어옴");
		int price = Integer.parseInt(request.getParameter("price"));
		int maxnum = Integer.parseInt(request.getParameter("maxnum"));
		modelAndView.addObject("finalPrice", price * maxnum);
		modelAndView.setViewName("price");
		return modelAndView;
	}
}
