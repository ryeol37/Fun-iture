package com.my.custom;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CustomComModel extends CModel {
	private int no;
	private int cu_no;
	private String id;
	private String subject;
	private String com;
	private Date com_reg_date;
	private String re_save;
	private String reply;
	private Date re_reg_date;
	
	private MultipartFile re_img;
	private String re_img_old;
	

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public Date getCom_reg_date() {
		return com_reg_date;
	}
	public void setCom_reg_date(Date com_reg_date) {
		this.com_reg_date = com_reg_date;
	}
	public String getRe_save() {
		return re_save;
	}
	public void setRe_save(String re_save) {
		this.re_save = re_save;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getRe_reg_date() {
		return re_reg_date;
	}
	public void setRe_reg_date(Date re_reg_date) {
		this.re_reg_date = re_reg_date;
	}
	
	public MultipartFile getRe_img() {
		return re_img;
	}
	public void setRe_img(MultipartFile re_img) {
		this.re_img = re_img;
	}
	public String getRe_img_old() {
		return re_img_old;
	}
	public void setRe_img_old(String re_img_old) {
		this.re_img_old = re_img_old;
	}
	
}
