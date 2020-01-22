package com.my.oneday;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AdOnedayModel {
	//강의 번호
	private int oneday_no;
	//글쓴이 아이디
	private String id_admin;
	//강의 제목
	private String name;
	//강의료
	private int price;
	//강의 날짜
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date day;
	//최대 참석 가능 인원수
	private int maxnum;
	//글 작성 시간
	private Date reg_date;
	//첨부 메인 이미지
	private String main_save;
	//강의 상세 정보
	private String content;
	
	public int getOneday_no() {
		return oneday_no;
	}
	public String getId_admin() {
		return id_admin;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public Date getDay() {
		return day;
	}
	public int getMaxnum() {
		return maxnum;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public String getMain_save() {
		return main_save;
	}
	public String getContent() {
		return content;
	}
	public void setOneday_no(int oneday_no) {
		this.oneday_no = oneday_no;
	}
	public void setId_admin(String id_admin) {
		this.id_admin = id_admin;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public void setMaxnum(int maxnum) {
		this.maxnum = maxnum;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public void setMain_save(String main_save) {
		this.main_save = main_save;
	}
	public void setContent(String content) {
		this.content = content;
	}


}
