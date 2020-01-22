package com.my.goods;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.goods.goodsModel;
import com.my.goods.likesModel;
import com.my.goods.goodsComModel;

@Controller
@RequestMapping("goods")
public class goodsController {
	@Resource(name="goodsService")
	private goodsService goodsService;
	
	ModelAndView mav = new ModelAndView();
	
	String session_id;
	
	//goods List
	@RequestMapping("goodsList")
	public ModelAndView goodsList(HttpServletRequest request) throws Exception{		
			
		List<goodsModel> goodslist=goodsService.goodsList();		
		
		mav.addObject("goodsList", goodslist);
		mav.setViewName("goods/goodsList");
		
		return mav;
	}
	
	///goods Category List
	@RequestMapping("goodsCategoryList")
	public ModelAndView goodsCategoryList(HttpServletRequest request) throws Exception{
		
		String goodsCate_No = request.getParameter("cate_no");
		
		List<goodsModel> goodsCategoryList = goodsService.goodsCategoryList(goodsCate_No);
		
		mav.addObject("goodsCate",goodsCate_No);
		mav.addObject("goodsList", goodsCategoryList);
		mav.setViewName("goods/goodsList");
		return mav;
	}
	
	//goods View
	@RequestMapping("goodsView")
	public ModelAndView goodsView(likesModel likesModel, HttpServletRequest request) throws Exception{
		
		int goods_no = Integer.parseInt(request.getParameter("goods_no"));
		
		goodsModel goodsModel = goodsService.goodsView(goods_no);
		int likesCount = goodsService.likesCount(likesModel);
		
		
		mav.addObject("likesCount", likesCount);
		mav.addObject("goodsComList",goodsService.goodsComList(goodsModel.getGoods_no()));
		mav.addObject("goodsModel",goodsModel);

		mav.setViewName("goods/goodsView");
		return mav;
	}
	
	
	//goods Like
	@RequestMapping(value="goodsLikes",method = RequestMethod.GET)
	public ModelAndView goodsLikes(likesModel likesModel, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		String session_id = (String)session.getAttribute("session_id");
		// 로그인 세션 여부 검사----------
		if(session.getAttribute("session_id") == null){
			mav.setViewName("member/loginform");
			return mav;
		}
		// 로그인 세션 여부 검사----------
		likesModel.setId(session_id);
		likesModel goodsLikesCheck = goodsService.likesCheck(likesModel);
		
		// 중복이면
		if(goodsLikesCheck != null){
			mav.setViewName("goods/goodsLikesConfirm");
			return mav;
		}
		
		likesModel.setId(likesModel.getId());
		
		goodsService.insertLikes(likesModel);
		
		mav.addObject("goods_no", likesModel.getGoods_no());
		mav.setViewName("redirect:/goods/goodsView");
		
		return mav;
	}
	
	//goods Comment Write
	@RequestMapping("/goodsComWrite")
	public ModelAndView goodsComWrite(MultipartHttpServletRequest request, HttpSession session, goodsComModel goodsComModel) {
		
		ModelAndView mav=new ModelAndView();
		
		
			session_id=session.getAttribute("session_id").toString();
		
			
			if(session_id == null){
				mav.setViewName("member/loginform");
				return mav;
			}
			
			if(request.getParameter("goodsComment").equals("") || request.getParameter("goodsComment").trim().isEmpty()) {
			
				mav.setViewName("goods/goodsComConfirm");
				return mav;
			}
			
	
		
		
		int goods_no = Integer.parseInt(request.getParameter("item_no"));
		
		goodsComModel.setCom(request.getParameter("goodsComment").replaceAll("\r\n", "<br />"));
		goodsComModel.setGoods_no(goods_no);
		goodsComModel.setId(session_id);
		
		//파일 업로드
		
		MultipartFile mf = request.getFile("fileload");
		String path = "/Users/wooseob/Desktop/Java/Fun-iture/src/main/webapp/resources/goodsImage";
		String re_save = mf.getOriginalFilename();
		String re_save_name = (re_save);
		File fileload = new File(path+"//"+re_save_name);
		
		try {
			mf.transferTo(fileload);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		goodsComModel.setRe_save(re_save);
		
		
		goodsService.goodsComWrite(goodsComModel);
		
		mav.setViewName("redirect:goodsView?goods_no="+goods_no);
		
		return mav;
	}

	
	//goods Comment Delete
	@RequestMapping("goodsComDelete")
	public ModelAndView goodsComDelete(HttpServletRequest request, goodsComModel goodsComModel ){
	
		ModelAndView mav=new ModelAndView();
	
		goodsService.goodsComDelete(goodsComModel);
	
		mav.setViewName("redirect:goodsView?goods_no="+goodsComModel.getGoods_no());
	
		return mav;
}
	
}
