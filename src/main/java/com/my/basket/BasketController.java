package com.my.basket;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;

import com.my.goods.goodsModel;
import com.my.goods.goodsService;
import com.my.basket.BasketModel;

@Controller
@RequestMapping("/basket")
public class BasketController {

   @Resource(name="basketService")
   private BasketService basketService;
   
   @Resource(name="goodsService")
   private goodsService goodsService;
   
   ModelAndView mav = new ModelAndView();

   /*장바구니에 추가*/
   @RequestMapping(value="/add")
   public ModelAndView basketAdd(HttpServletRequest request, goodsModel goodsModel, HttpSession session){
      
      BasketModel basketModel = new BasketModel();
      goodsModel goodsModel2 = new goodsModel();
      
      String id = (String)session.getAttribute("session_id");
      
      if(id != "" ){
      goodsModel2 = goodsService.goodsView(goodsModel.getGoods_no());
      
      basketModel.setId(id);
      basketModel.setGoods_no(goodsModel2.getGoods_no());
      basketModel.setGoods_qty(goodsModel.getGoods_qty());
      basketService.insertBasket(basketModel);
      mav.setViewName("basket/basketOk");
     
      }else{
      
        mav.setViewName("basket/basketError");
 		mav.setViewName("redirect:/ex_index");
      }
      
      return mav;
   }

   	
	/*장바구니 리스트*/
	@RequestMapping(value="/list")
	public ModelAndView basketList(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		BasketModel basketModel = new BasketModel();
		
		String id = (String)session.getAttribute("session_id");
		
		basketModel.setId(id); 
		
		if(id != null ){
			
			List<BasketModel> basketlist = basketService.BasketList(basketModel);
			mav.addObject("basketList", basketlist);
			mav.setViewName("basket/basketList");
		}else{
			 mav.setViewName("basket/basketError");
		     mav.setViewName("redirect:/main");
		}
		
		return mav;
	}
	
	/*장바구니 삭제*/
	@RequestMapping(value="/delete")
	public ModelAndView deleteBasket(HttpServletRequest request, BasketModel basketModel){
		
		basketService.deleteBasket(basketModel);
		
		mav.setViewName("redirect:/basket/list");
		
		return mav;
	}

}