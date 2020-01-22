package com.my.order;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.basket.BasketModel;
import com.my.basket.BasketService;
import com.my.goods.goodsService;
import com.my.goods.goodsModel;
import com.my.member.MemberModel;
import com.my.member.MemberService;
import com.my.order.OrderModel;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="goodsService")
	private goodsService goodsService;
	
	@Resource(name="basketService")
	private BasketService basketService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	ModelAndView mav = new ModelAndView();
	MemberModel memberModel = new MemberModel();
	goodsModel goodsModel = new goodsModel();
	goodsModel goodsModel2 = new goodsModel();
	BasketModel basketModel = new BasketModel();
	OrderModel orderModel = new OrderModel();
	OrderModel orderModel2 = new OrderModel();

	private List<BasketModel> basketList = new ArrayList<BasketModel>();
	
	/* 장바구니 -> 주문 폼 */
	@RequestMapping(value="/basketBuy")
	public ModelAndView basketOrderForm(HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		
		String id = (String)session.getAttribute("session_id");
		
		if(id != "") {
			basketModel.setId(id);
			basketList = basketService.BasketList(basketModel);
			memberModel = memberService.getMember(id);
			
			mav.addObject("basketList", basketList);
			mav.addObject("memberModel", memberModel);
			mav.setViewName("order/basketOrderForm");
			return mav;
		}else {
			mav.setViewName("order/orderError");
			return mav;
		}
	}
	
	/* 상품 -> 주문 폼 */
	@RequestMapping(value="/orderBuy")
	public ModelAndView orderForm(HttpServletRequest request, goodsModel goodsModel, HttpSession session) {
		
		session = request.getSession();
		
		int goods_no = goodsModel.getGoods_no();
		int goods_qty = goodsModel.getGoods_qty();
		String id = (String)session.getAttribute("session_id");
		
		if(id != "") {

			goodsModel = goodsService.goodsView(goods_no);
			memberModel = memberService.getMember(id);
			goodsModel.setGoods_qty(goods_qty);
			mav.addObject("goodsModel", goodsModel);
			mav.addObject("memberModel", memberModel);
			mav.setViewName("order/orderForm");

			return mav;
		}else {
			mav.setViewName("order/orderError");
			return mav;
		}
	}
	
	/* 장바구니 -> 주문 완료 */
	@RequestMapping(value="/basketOrderOk")
	public ModelAndView basketOrderOk(HttpServletRequest request, HttpSession session, OrderModel orderModel) {

		session = request.getSession();
		
		String id = (String)session.getAttribute("session_id");
		
		basketModel.setId(id);
		basketList = basketService.BasketList(basketModel);
		memberModel = memberService.getMember(id);
		
		orderModel.setId(id);

		for(int i=0; i<basketList.size(); i++) {
			basketModel = basketList.get(i);
			
			goodsModel = goodsService.goodsView(basketModel.getGoods_no());
			int goods_qty = goodsModel.getGoods_qty() - basketModel.getGoods_qty();
			int point = (int)(basketModel.getGoods_price() * 0.01);
			goodsModel.setGoods_qty(goods_qty);
			goodsService.amountDown(goodsModel);
			
			orderModel.setGoods_no(basketModel.getGoods_no());
			orderModel.setOrder_qty(basketModel.getGoods_qty());
			orderModel.setOrder_price(basketModel.getGoods_price() * basketModel.getGoods_qty());
			
			//무통장 입금인 경우
			if(orderModel.getSettle_type().equals("무통장 입금")) {
				orderModel.setStatus_no(1);
				orderModel.setOrder_bank(orderModel.getOrder_bank());
			} 
			//카드 결제인 경우
			else {
				orderModel.setStatus_no(2);
				orderModel.setOrder_bank("(null)");
				memberModel.setPoint(memberModel.getPoint()+point);
				memberService.addPoint(memberModel);
			}
			
			if(orderModel.getUse_point() != 0) {
				memberModel.setPoint(memberModel.getPoint() - orderModel.getUse_point());
				memberService.addPoint(memberModel);	
			}
			
			//수량이 모자란 경우
			if(goods_qty<0) {
				basketService.deleteBasket(basketModel);
				mav.setViewName("basket/basketQtyError");
				return mav;
			}
			
			orderService.insertOrder(orderModel);
			basketService.deleteBasket(basketModel);
		}
		
		mav.setViewName("order/orderOk");
		
		return mav;
	}

	   /* 상품 -> 주문완료 */
	   @RequestMapping(value="/orderOk")
	   public ModelAndView orderOk(HttpServletRequest request, HttpSession session, goodsModel goodsModel, OrderModel orderModel) {
	      
	      session = request.getSession();
	      
	      String id = (String)session.getAttribute("session_id");

	      int goods_no = goodsModel.getGoods_no();
	      int goods_qty = goodsModel.getGoods_qty();
	      int order_price = goodsModel.getGoods_qty() * goodsModel.getGoods_price();
	      int point = (int)(goodsModel.getGoods_price() * 0.01);
	      
	      orderModel.setId(id);
	      orderModel.setGoods_no(goods_no);
	      orderModel.setOrder_qty(goods_qty);
	      orderModel.setOrder_price(order_price);
	      
	      if(orderModel.getSettle_type().equals("무통장 입금")) {
	         orderModel.setStatus_no(1);
	         orderModel.setOrder_bank(orderModel.getOrder_bank());
	      } else {
	         orderModel.setStatus_no(2);
	         orderModel.setOrder_bank("(null)");
	         memberModel.setPoint(memberModel.getPoint()+point);
	         memberService.addPoint(memberModel);
	      }
	      
	      //적립금 사용한 경우
	      if(orderModel.getUse_point() != 0) {
	         orderModel.setOrder_price(order_price - orderModel.getUse_point());
	         memberModel.setPoint(memberModel.getPoint() - orderModel.getUse_point());
	         memberService.addPoint(memberModel);
	      }
	      goodsModel = goodsService.goodsView(orderModel.getGoods_no());
	      goods_qty = goodsModel.getGoods_qty() - orderModel.getOrder_qty();
	      goodsModel.setGoods_qty(goods_qty);
	      goodsService.amountDown(goodsModel);
	      
	      orderService.insertOrder(orderModel);

	      mav.setViewName("order/orderOk");
	      return mav;
	   }
	   
	 //적립금
	      @RequestMapping(value = "/checkPoint", method = RequestMethod.POST)
	      @ResponseBody
	      public String checkPoint(HttpServletRequest request, HttpSession session, OrderModel orderModel, MemberModel memberModel) {
	         
	         String id = (String)session.getAttribute("session_id");
	         memberModel = memberService.getMember(id);
	         boolean point = memberModel.getPoint() < orderModel.getUse_point();
	         
	         return String.valueOf(point);
	      }
	   
	}