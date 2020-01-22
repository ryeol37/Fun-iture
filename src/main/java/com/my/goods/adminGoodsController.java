package com.my.goods;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.my.goods.goodsService;
import com.my.goods.goodsModel;

	

@Controller
@RequestMapping("ad/goods")
public class adminGoodsController {

	@Resource
	private goodsService goodsService;
	
	ModelAndView mav = new ModelAndView();
	
	//admin goods list
		@RequestMapping("adGoodsList")
		public ModelAndView goodsList(HttpServletRequest request) throws Exception{	
			
			List<goodsModel> goodsList=goodsService.goodsList();
			
			mav.addObject("goodsList", goodsList);
			mav.setViewName("ad/adGoods/adGoodsList");
			
			return mav;
		}
		
		//admin goods Insert Form
		@RequestMapping("adGoodsInsertForm")
		public ModelAndView adGoodsInsertForm(){
			
			mav.addObject("goods", new goodsModel());
			mav.setViewName("ad/adGoods/adGoodsInsertForm");
			return mav;
		}
		
		//goods Insert
		 @RequestMapping(value="goodsInsert")    
		    public String goodsInsert(MultipartHttpServletRequest multipartHttpServletRequest,goodsModel goodsModel) throws Exception {        
		       
			 String uploadPath = "/Users/home/Java/App/funiture/src/main/webapp/resources/goodsImage";
			 
		        System.out.println("UPLOAD_PATH : "+uploadPath);
			        	
	        		//goods Insert Upload
		        	MultipartFile multipartFile = multipartHttpServletRequest.getFile("file[0]");
		        	String filename = multipartFile.getOriginalFilename();
			        	if (filename != ""){ 
						    goodsModel.setMain_save(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();				    
					        FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));			            	        
			        	}else{
			        		goodsModel.setMain_save("NULL");
			        	}
			        	
			        //Detail Image
			        MultipartFile multipartFile1 = multipartHttpServletRequest.getFile("file[1]");
			        String filename1 = multipartFile1.getOriginalFilename();
			        	if (filename1 != ""){
						    goodsModel.setDetail_save(System.currentTimeMillis()+"_detail"+multipartFile1.getOriginalFilename());					    
						    String savimagename1 = System.currentTimeMillis()+"_detail"+multipartFile1.getOriginalFilename();				    
					        FileCopyUtils.copy(multipartFile1.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename1));
			        	}else{
			        		goodsModel.setDetail_save("NULL");
			        	}

			       

		        goodsService.adGoodsInsert(goodsModel);
		        return "redirect:adGoodsList";
		    }
		 
			@RequestMapping("adGoodsDelete")
			public ModelAndView adGoodsDelete(HttpServletRequest request, goodsModel goodsModel ){
			
				ModelAndView mav=new ModelAndView();
			
				goodsService.adGoodsDelete(goodsModel);
			
				mav.setViewName("redirect:adGoodsList");
			
				return mav;
		}
			
			 
			//admin goods Modify Form
			@RequestMapping("adGoodsModifyForm")
			public ModelAndView adGoodsModifyForm(goodsModel goodsModel, HttpServletRequest request){
				
				goodsModel = goodsService.goodsView(goodsModel.getGoods_no());
				
				mav.addObject("goodsModel", goodsModel);
				mav.setViewName("ad/adGoods/adGoodsModifyForm");
				return mav;
			}
			
			
			 @RequestMapping("adGoodsModify")
				public ModelAndView goodsModify(goodsModel goodsModel, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
				
				 String uploadPath = "/Users/home/Java/App/Fun-iture/src/main/webapp/resources/goodsImage";
				 
			        System.out.println("UPLOAD_PATH : "+uploadPath);
				    
			        if (multipartHttpServletRequest.getFile("file[0]") != null){
		     		//main_save 수정
			        	MultipartFile multipartFile = multipartHttpServletRequest.getFile("file[0]");
			        	String filename = multipartFile.getOriginalFilename();
			        	if (filename != ""){ 
						    goodsModel.setMain_save(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());		    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();	    
					        FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));			            	        
			        	}else{
			        		goodsModel.setMain_save("NULL");
			        	}
			        }
			        
			        if (multipartHttpServletRequest.getFile("file[1]") != null){
				        //detail_save 수정
				        MultipartFile multipartFile1 = multipartHttpServletRequest.getFile("file[1]");
				        String filename1 = multipartFile1.getOriginalFilename();
				    	if (filename1 != ""){
						    goodsModel.setDetail_save(System.currentTimeMillis()+"_detail"+multipartFile1.getOriginalFilename());			    
						    String savimagename1 = System.currentTimeMillis()+"_detail"+multipartFile1.getOriginalFilename();		    
					        FileCopyUtils.copy(multipartFile1.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename1));
			        	}else{
			        		goodsModel.setDetail_save("NULL");
			        	}
			        }
					
			        
					goodsService.adGoodsModify(goodsModel);
					mav.addObject("goodsModel", goodsModel);
		  			mav.setViewName("redirect:adGoodsList");
		  			return mav;
			        }
			 
}
