package com.my.funiture;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.goods.goodsModel;
import com.my.goods.goodsService;


@Controller
public class HomeController {
	@Resource
	private goodsService goodsService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String index(Model model) {
		
//		DB에서 data 가져옴
		List<goodsModel> best = goodsService.goodsBest();
		List<goodsModel> newList = goodsService.goodsList();
		
		//List<goodsModel> bestList = goodsService.goodsBest();
		if(newList.size() > 2){
			newList = newList.subList(0, 4);
		}
//		int size = 4;
//		if(best.size() < 4) {
//			size = best.size();
//		}
//		for(int i=0; i < size; i++) {
//	
//			System.out.println(i);
//			int goodsnum = best.get(i).getGoods_no();
//			bestList.add(goodsService.goodsView(goodsnum));
//			
//		}		
		
		model.addAttribute("bestList", best);
		model.addAttribute("newList", newList);
		return "main/main";
	}
	
}
