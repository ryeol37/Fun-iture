package com.my.custom;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.common.CustomCommon;

@Controller
@RequestMapping(value = "/ad/custom")
public class AdminCustomController {
	
	@Resource
	private AdminCustomService adminCustomService;
	
	CustomCommon common = new CustomCommon();
	
//	write에서 사용
	StringBuffer option;
	ArrayList<String> optionType;
	String uploadPath = "/Users/home/Java/App/funiture/src/main/webapp/resources/custom⁩/customImg⁩";
//	String uploadPath = "/Users/wooseob/Desktop/Java/Fun-iture/src/main/webapp/resources/custom/customImg/";
	StringBuffer cu_main_sb;
//	/write에서 사용
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		
//		DB에서 리스트 가져오기. 관리자용 페이지는 js로 페이징을 하기때문에 클래스에서 따로 하지 않는다.
		List<CustomModel> adCustomList = adminCustomService.selectRowsCus();
		model.addAttribute("list", adCustomList);
		return "ad/custom/adCustomList";
	}
	
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String writeForm(Model model) {
		
		return "ad/custom/adCustomWriteForm";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(MultipartHttpServletRequest mhsr,
			CustomModel custom, Model model) throws Exception{
		System.out.println("UPLOAD_PATH : "+uploadPath);
		
//		option, optionType, optionName을 하나의 String 객체로 합쳐준다.
		String options = setOptions(custom);
		custom.setOptions(options);
//		custom goods의 cate_no는 고정이다.
		custom.setCate_no(5);//임시 번호
		
		//주문제작 메인 이미지
		List<MultipartFile> mainImg = mhsr.getFiles("cu_main_v");
		cu_main_sb = new StringBuffer();
		for(int i=0; i<mainImg.size();i++) {
			MultipartFile file = mainImg.get(i);
			String filename = file.getOriginalFilename();
			
			if (filename != null && !filename.trim().equals("")){
				String main_save = common.setFileName(filename,"");
				cu_main_sb.append(main_save+",");
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(uploadPath+"/"+main_save));
			}else{
				model.addAttribute("error", new ArrayList().add("error"));
				return "redirect:/ad/custom/list";
			}
		}
		custom.setCu_main_save(cu_main_sb.toString().substring(0, cu_main_sb.length()-1));
		
		//주문제작 상세 이미지
		MultipartFile detailImg = mhsr.getFile("cu_detail_v");
		String detailname = detailImg.getOriginalFilename();
		if(detailname != null && !detailname.trim().equals("")) {
			String detail_save = common.setFileName(detailname,"");
			FileCopyUtils.copy(detailImg.getInputStream(), new FileOutputStream(uploadPath+"/"+detail_save));
			custom.setCu_detail_save(detail_save);
		} else {
			model.addAttribute("error", new ArrayList().add("error"));
			return "redirect:/ad/custom/list";
		}
		
		adminCustomService.insert(custom);
		
		return "redirect:/ad/custom/list";
	}
	
	@RequestMapping(value = "/modifyform", method = RequestMethod.GET)
	public String modifyForm(@RequestParam String cu_no, Model model) {
		
//		Custom table에서 cu_no에 해당하는 하나의 row를 가져온다. 
		CustomModel customModi 
			= (CustomModel)adminCustomService.selectOneCus(Integer.parseInt(cu_no));
//		jsp에서 사용할 수 있는 형태로 options와 cu_main_save를 가공한다.
		List optionList = common.setOptionList(customModi.getOptions());
		String[] cu_main = customModi.getCu_main_save().split(",");
		
		model.addAttribute("cu_main", cu_main);
		model.addAttribute("option", optionList);
		model.addAttribute("modi", customModi);
		return "ad/custom/adCustomModifyForm";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MultipartHttpServletRequest mhsr,CustomModel custom)
			throws Exception{
		System.out.println("UPLOAD_PATH : "+uploadPath);
//		cu_main 이미지 3개 중 일부만 수정 되었을 경우 old를 포함하여 DB에 update 하기 위함
		String[] cu_main_old = custom.getCu_main_old().split(",");
		
//		option, optionType, optionName을 하나의 String 객체로 합쳐준다.
		String options = setOptions(custom);
		custom.setOptions(options);
		
		//주문제작 메인 이미지
		List<MultipartFile> mainImg = mhsr.getFiles("cu_main_v");
		cu_main_sb = new StringBuffer();
		for(int i=0; i<mainImg.size();i++) {
			MultipartFile file = mainImg.get(i);
			String filename = file.getOriginalFilename();
			if (filename != null && !filename.trim().equals("")){
				String main_save = common.setFileName(filename,"");
				cu_main_sb.append(main_save+",");
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(uploadPath+"/"+main_save));
//				업로드 된 파일이 있을 경우 기존 파일을 삭제한다.
				File delFile = new File(uploadPath+"/"+cu_main_old[i]);
				delFile.delete();
			}else{
//				업로드 된 파일이 없을 경우 기존 파일 이름을 DB에 올린다.
				cu_main_sb.append(cu_main_old[i]+",");
			}
		}
		custom.setCu_main_save(cu_main_sb.toString().substring(0, cu_main_sb.length()-1));
		
		//주문제작 상세 이미지
		MultipartFile detailImg = mhsr.getFile("cu_detail_v");
		String detailname = detailImg.getOriginalFilename();
		if(detailname != null && !detailname.trim().equals("")) {
			String detail_save = common.setFileName(detailname,"");
			FileCopyUtils.copy(detailImg.getInputStream(), new FileOutputStream(uploadPath+"/"+detail_save));
			custom.setCu_detail_save(detail_save);
//			업로드가 될 경우 기존 파일을 삭제한다.
			File delFile = new File(uploadPath+"/"+custom.getCu_detail_old());
			delFile.delete();
		} else {
//			업로드가 안 될 경우 기존 파일로 update 한다. 
			custom.setCu_detail_save(custom.getCu_detail_old());
		}
		
		adminCustomService.modify(custom);
		return "redirect:/ad/custom/list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam String cu_no, Model model) {
		int no = Integer.parseInt(cu_no);
//		파일까지 지우려고 했는데 견적문의 게시판이랑 꼬일까봐 그냥 STATUS = 'N' 으로 UPDATE 하는 로직으로 변경하였음
/*//		DB에서 삭제하기 전에 주문 제작 상품의 이미지를 폴더에서 삭제하기 위해서 cu_no에 해당하는 하나의 row를 가져옴
		CustomModel custom
		= (CustomModel)adminCustomService.selectOneCus(no);
		
		String[] cu_main = custom.getCu_main_save().split(",");
		for(int i=0; i<cu_main.length; i++) {
			File delFile = new File(uploadPath+"/"+cu_main[i]);
			delFile.delete();	//main 파일 삭제
		}
		File delFile = new File(uploadPath+"/"+custom.getCu_detail_save());
		delFile.delete();		//detail 파일 삭제
*/
		adminCustomService.delete(no);
		return "redirect:/ad/custom/list";
	}

	private String setOptions(CustomModel custom) {
		String options;
		option = new StringBuffer();
		optionType = new ArrayList<String>();
		optionType.add(custom.getOptionType1());
		optionType.add(custom.getOptionType2());
		optionType.add(custom.getOptionType3());
		optionType.add(custom.getOptionType4());
		optionType.add(custom.getOptionType5());
		optionType.add(custom.getOptionType6());
		for(int i=0; i<custom.getOption().size(); i++) {
			option.append(custom.getOptionName().get(i)+":");
			option.append(custom.getOption().get(i));
			option.append(optionType.get(i));
			option.append(",");
		}
		options = option.toString().substring(0, option.length()-1);
		
		return options;
	}
	
}
