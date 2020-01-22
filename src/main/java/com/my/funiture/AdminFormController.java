package com.my.funiture;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.funiture.AdminService;
import com.my.member.MemberModel;
import com.my.member.MemberService;
import com.my.order.OrderModel;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminFormController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name = "adminService")
	private AdminService adminService;

	
	ModelAndView mav = new ModelAndView();
	
	// 로그인 페이지
	@RequestMapping(value="/ad/loginform", method = RequestMethod.GET)
	public String loginForm(){
		return "adlogin";
	}
	
	@RequestMapping(value = "/at_login", method = RequestMethod.POST)
	public ModelAndView adminlogin(Locale locale, HttpServletRequest request, MemberModel mem) {
		
		MemberModel result = memberService.memberLogin(mem);
		
		
		
		if(result != null){
			String id = result.getId();
			if(id.equals("admin")) {
			System.out.println("관리자 로그인 성공");
			HttpSession session = request.getSession();
			
			session.setAttribute("mem", result);
			session.setAttribute("session_id", result.getId());
			session.setAttribute("session_name" ,result.getName());
			session.setAttribute("session_no" ,result.getNo());
			session.setAttribute("session_status" ,result.getStatus());

			System.out.println(session.getAttribute("session_status"));
			mav.setViewName("redirect:/admemberList");
			
			return mav;
			
			}else {
				// 로그인 실패
				mav.setViewName("ad/admin_form/adloginError");
				return mav;
			}

		}else {
			mav.setViewName("ad/admin_form/adloginError");
			return mav;
		}
}
	
	// 로그아웃
	@RequestMapping("/at_logout")
	public ModelAndView adminLogout(HttpServletRequest request, MemberModel mem){
		HttpSession session = request.getSession(false);
		
		if(session != null){
			System.out.println("로그아웃 성공");
			session.invalidate();
		}
		
		//mav.setViewName("ad/admin_form/adlogout");
		mav.setViewName("redirect:/ad/loginform");
		return mav;
	}
	
	// 회원정보 
	@RequestMapping(value = "/admemberList", method = RequestMethod.GET)
	public ModelAndView memberList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
	
		List<MemberModel> memberlist;

		memberlist = adminService.memberList();

		mav.addObject("memberlist", memberlist);
		mav.setViewName("ad/admin_form/admemberList");
		return mav;
	}
	
	//관리자가 회원수정
  	@RequestMapping("admemberModifyform")
  	public ModelAndView memberModifyform(MemberModel member, HttpServletRequest request) {	
  		
			member =  memberService.getMember(member.getId());
	
			mav.addObject("member", member);
			mav.setViewName("ad/admin_form/admemberModify");
			return mav;
  	}
  	
  	@RequestMapping("admemberModify")
  	public ModelAndView admemberModify(MemberModel member, HttpServletRequest request) {		  		 		
  		
  			System.out.println("id="+ member.getId());
			adminService.admemberModify(member);
			mav.setViewName("redirect:admemberList");
			return mav;
  	}
  	
  	//관리자가 회원탈퇴 
  	@RequestMapping("admemberDelete")
  	public ModelAndView admemberDelete(MemberModel member, HttpServletRequest request) {		  		 		
  		
  			System.out.println("id="+ member.getId());
			adminService.admemberDelete(member);
			mav.setViewName("redirect:admemberList");
			return mav;
  	}
  	
  	/* 완제품 주문 관리 */
    @RequestMapping(value = "/adOrderList", method = RequestMethod.GET)
    public ModelAndView adOrderList(HttpServletRequest request) {
    
       List<OrderModel> orderList = adminService.adOrderList();

       mav.addObject("orderList", orderList);
       mav.setViewName("ad/order/adOrderList");
       return mav;
    }
    
    @RequestMapping(value="adOrderModifyForm")
    public ModelAndView adOrderModifyForm(HttpServletRequest request, OrderModel orderModel) {
       
       orderModel = adminService.orderGetOne(orderModel.getOrder_no());
         
       mav.addObject("orderModel", orderModel);
       mav.setViewName("ad/order/adOrderModify");
       return mav;

    }
    
    @RequestMapping(value="adOrderModify")
    public ModelAndView adOrderModify(HttpServletRequest request, OrderModel orderModel, MemberModel memberModel) {
       
       String id = orderModel.getId();
       int point = (int)(orderModel.getOrder_price() * 0.01);
       memberModel = memberService.getMember(id);

       adminService.orderModify(orderModel);
        
       if(orderModel.getStatus_no() == 2) {      //상품 준비 중인 경우 (무통장 결제 한 경우)
          memberModel.setPoint(memberModel.getPoint() + point);
          memberService.addPoint(memberModel);
          
       }else if(orderModel.getStatus_no() == 8 || orderModel.getStatus_no() == 7){         //주문 취소, 반품 완료인 경우
          memberModel.setPoint(memberModel.getPoint() + orderModel.getUse_point() - point);   //사용한 적립금은 돌려주고 적립된 금액은 차감
          memberService.addPoint(memberModel);
       }

        mav.setViewName("ad/order/adOrderModiOk");
        return mav;
    }
    
    /* 주문 제작 주문 관리 */
    @RequestMapping(value = "/adCustomList", method = RequestMethod.GET)
    public ModelAndView adCustomList(HttpServletRequest request) {
    
       List<OrderModel> customList = adminService.adCustomList();

       mav.addObject("customList", customList);
       mav.setViewName("ad/order/adCustomList");
       return mav;
    }
    
    @RequestMapping(value="adCustomModifyForm")
    public ModelAndView adCustomModifyForm(HttpServletRequest request, OrderModel orderModel) {

       orderModel = adminService.customGetOne(orderModel.getOrder_no());
       
       mav.addObject("orderModel", orderModel);
       mav.setViewName("ad/order/adCustomModify");
       return mav;

    }
    
    @RequestMapping(value="adCusOrderModify")
    public ModelAndView adCusOrderModify(HttpServletRequest request, OrderModel orderModel) {
       
       adminService.customOrderModify(orderModel);
       
       mav.setViewName("ad/order/adCusModifyOk");
        return mav;
    }
    
    /* 원데이 클래스 신청 관리 */
    @RequestMapping(value = "/adOnedayList", method = RequestMethod.GET)
    public ModelAndView adOnedayList(HttpServletRequest request) {
    
       List<OrderModel> onedayList = adminService.adOnedayList();

       mav.addObject("onedayList", onedayList);
       mav.setViewName("ad/order/adOnedayList");
       return mav;
    }
    
    @RequestMapping(value="adOnedayModifyForm")
    public ModelAndView adOnedayModifyForm(HttpServletRequest request, OrderModel orderModel) {

       orderModel = adminService.onedayGetOne(orderModel.getOrder_no());
       
       mav.addObject("orderModel", orderModel);
       mav.setViewName("ad/order/adOnedayModify");
       return mav;

    }
    
    @RequestMapping(value="adOneOrderModify")
    public ModelAndView adOneOrderModify(HttpServletRequest request, OrderModel orderModel) {
       
       adminService.onedayOrderModify(orderModel);
        
       mav.setViewName("ad/order/adOnedayModiOk");
        return mav;
    }
    
  	
}
