package com.my.custom;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CustomModel extends CModel {
	private int cu_no;
	private int cate_no;
	private String options;
	private Date reg_date;
	private String name;
	private String cu_main_save;
	private String cu_detail_save;
	
	/////table
	
	private String optionType1;
	private String optionType2;
	private String optionType3;
	private String optionType4;
	private String optionType5;
	private String optionType6;
	private ArrayList<String> optionType;
	private ArrayList<Integer> option;
	private ArrayList<String> optionName;
	private MultipartFile cu_main_v;
	private MultipartFile cu_detail_v;
	
	private String cu_main_old;
	private String cu_detail_old;
	/////class
	
	private int review;
	private int reply;
	/////관리자 list 쿼리
	
	
	public int getCu_no() {
		return cu_no;
	}
	public void setCu_no(int cu_no) {
		this.cu_no = cu_no;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCu_main_save() {
		return cu_main_save;
	}
	public void setCu_main_save(String cu_main_save) {
		this.cu_main_save = cu_main_save;
	}
	public String getCu_detail_save() {
		return cu_detail_save;
	}
	public void setCu_detail_save(String cu_detail_save) {
		this.cu_detail_save = cu_detail_save;
	}
	
	
	public String getOptionType1() {
		return optionType1;
	}
	public void setOptionType1(String optionType1) {
		this.optionType1 = optionType1;
	}
	public String getOptionType2() {
		return optionType2;
	}
	public void setOptionType2(String optionType2) {
		this.optionType2 = optionType2;
	}
	public String getOptionType3() {
		return optionType3;
	}
	public void setOptionType3(String optionType3) {
		this.optionType3 = optionType3;
	}
	public String getOptionType4() {
		return optionType4;
	}
	public void setOptionType4(String optionType4) {
		this.optionType4 = optionType4;
	}
	public String getOptionType5() {
		return optionType5;
	}
	public void setOptionType5(String optionType5) {
		this.optionType5 = optionType5;
	}
	public String getOptionType6() {
		return optionType6;
	}
	public void setOptionType6(String optionType6) {
		this.optionType6 = optionType6;
	}
	public ArrayList<String> getOptionType() {
		return optionType;
	}
	public void setOptionType(ArrayList<String> optionType) {
		this.optionType = optionType;
	}
	public ArrayList<Integer> getOption() {
		return option;
	}
	public void setOption(ArrayList<Integer> option) {
		this.option = option;
	}
	public ArrayList<String> getOptionName() {
		return optionName;
	}
	public void setOptionName(ArrayList<String> optionName) {
		this.optionName = optionName;
	}
	
	public MultipartFile getCu_main_v() {
		return cu_main_v;
	}
	public void setCu_main_v(MultipartFile cu_main_v) {
		this.cu_main_v = cu_main_v;
	}
	public MultipartFile getCu_detail_v() {
		return cu_detail_v;
	}
	public void setCu_detail_v(MultipartFile cu_detail_v) {
		this.cu_detail_v = cu_detail_v;
	}
	
	public String getCu_main_old() {
		return cu_main_old;
	}
	public void setCu_main_old(String cu_main_old) {
		this.cu_main_old = cu_main_old;
	}
	public String getCu_detail_old() {
		return cu_detail_old;
	}
	public void setCu_detail_old(String cu_detail_old) {
		this.cu_detail_old = cu_detail_old;
	}
	
	public int getReview() {
		return review;
	}
	public void setReview(int review) {
		this.review = review;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
}
