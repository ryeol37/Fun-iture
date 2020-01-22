package com.my.customB;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CuboardModel extends CbModel {
	private int cub_no;
	private int cu_no;
	private String id;
	private String subject;
	private String options;
	private String content;
	private String cub_save;
	private Date reg_date;
	private int price;
	private String status;
	
	private MultipartFile cub_img;
	private ArrayList<Integer> option;
	private String optionDefault;
	
	private int com;//list에서 댓글 개수
	private String name;//view에서 주문제작 상품 이름
	private String cu_detail;//view에서 주문제작 상품 상세이미지
	private String cub_old;//modifyForm에서 기존 이미지
	
	//관리자 검색용
	private String keyword;
	private String searchCate;
	private String slctCate;
	
	public int getCub_no() {
		return cub_no;
	}
	public void setCub_no(int cub_no) {
		this.cub_no = cub_no;
	}
	public int getCu_no() {
		return cu_no;
	}
	public void setCu_no(int cu_no) {
		this.cu_no = cu_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCub_save() {
		return cub_save;
	}
	public void setCub_save(String cub_save) {
		this.cub_save = cub_save;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public MultipartFile getCub_img() {
		return cub_img;
	}
	public void setCub_img(MultipartFile cub_img) {
		this.cub_img = cub_img;
	}
	public ArrayList<Integer> getOption() {
		return option;
	}
	public void setOption(ArrayList<Integer> option) {
		this.option = option;
	}
	public String getOptionDefault() {
		return optionDefault;
	}
	public void setOptionDefault(String optionDefault) {
		this.optionDefault = optionDefault;
	}
	
	public int getCom() {
		return com;
	}
	public void setCom(int com) {
		this.com = com;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCu_detail() {
		return cu_detail;
	}
	public void setCu_detail(String cu_detail) {
		this.cu_detail = cu_detail;
	}
	public String getCub_old() {
		return cub_old;
	}
	public void setCub_old(String cub_old) {
		this.cub_old = cub_old;
	}
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchCate() {
		return searchCate;
	}
	public void setSearchCate(String searchCate) {
		this.searchCate = searchCate;
	}
	public String getSlctCate() {
		return slctCate;
	}
	public void setSlctCate(String slctCate) {
		this.slctCate = slctCate;
	}
	
}
