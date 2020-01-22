package com.my.common;

import java.util.ArrayList;
import java.util.List;
import java.text.NumberFormat;

public class CustomCommon {

//	AdminCustomController.modifyForm() / CuBoardController.writeForm()
	public List setOptionList(String options){
		List optinoList = new ArrayList();
		String[] option = options.split(",");
		List<String> optionTypes = new ArrayList<String>();
		List<Integer> optionSs = new ArrayList<Integer>();
		List<String> optionName = new ArrayList<String>();
		for(int i=0; i<option.length; i++) {
			int md = option[i].length()-2;
			int first = option[i].lastIndexOf(':');
			optionName.add("\""+option[i].substring(0, first)+"\"");
			optionSs.add(Integer.parseInt(option[i].substring(first+1, md)));
			optionTypes.add("\""+option[i].substring(md)+"\"");
		}
		optinoList.add(optionSs);
		optinoList.add(optionName);
		optinoList.add(optionTypes);
		return optinoList;
	}
//	CuBoardController.write()
	public String setOptionsUser(String optionDefault, ArrayList<Integer> options){
		String[] option = optionDefault.split(",");
		StringBuffer temp = new StringBuffer();
		for(int i=0; i<options.size(); i++) {
			if(i>0) {temp.append(",");}
			int first = option[i].lastIndexOf(':');
			int md = option[i].length()-2;
			temp.append(option[i].substring(0, first)+":");
			temp.append(options.get(i));
			temp.append(option[i].substring(md));
		}
		return temp.toString();
	}
	
//	파일 업로드를 할 때(AdminCustomController.write()&modify() / CustomController.reviewWrite()
	public String setFileName(String fileName,String add) {
		int end = fileName.lastIndexOf('.');
		String file_name = fileName.substring(0, end);
		String file_ext = fileName.substring(end+1);
		return add+file_name+"_"+System.currentTimeMillis()+"."+file_ext;
	}
	
//	CuBoardController.com() 에서 최종 견적에 대한 댓글일 경우
	public String getComFinal(String price,String options, int cub_no, int cu_no) {
		StringBuffer temp = new StringBuffer();
		temp.append("아래와 같이 최종 협의 내용을 알려드립니다.<br/>");
		temp.append("동의하시면 확인 버튼을 누르세요!<br/>");
		temp.append("<p style='background-color:#d2d2d2'>[가격]</p>");
		temp.append("￦");
		temp.append(NumberFormat.getNumberInstance().format(Integer.parseInt(price)));
		temp.append("<br/>");
		temp.append("<p style='background-color:#d2d2d2'>[최종옵션]</p>");
		temp.append(options);
		temp.append("<br/>");
		temp.append("<form name='form'>");
		temp.append("<input type='hidden' name='price' value='"+price+"'/>");
		temp.append("<input type='hidden' name='options' value='"+options+"'/>");
		temp.append("<input type='hidden' name='cub_no' value='"+cub_no+"'/>");
		temp.append("<input type='hidden' name='cu_no' value='"+cu_no+"'/>");
		temp.append("<input type='hidden' name='memo' value=''/>");
		temp.append("<input type='hidden' name='status_no' value='1'/>");
		temp.append("</form>");
		temp.append("<p style='padding-top:20px'>");
		temp.append("<input type='button' value='확인' style='margin:5px 0px 5px'"
				+"data-toggle='modal' data-target='#confirm'>");
		temp.append("<br/>");
		temp.append("버튼을 눌러 결제를 마치신 후에는 마이페이지>나의 주문제작내역에서 내용을 확인해주세요.<br/>");
		temp.append("무통장 입금의 경우에는 입금 확인 후 주문제작이 시작됩니다.<br/>");
		temp.append("</p>");
		return temp.toString();
	}
}
