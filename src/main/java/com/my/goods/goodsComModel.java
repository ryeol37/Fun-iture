package com.my.goods;

import java.util.Date;

public class goodsComModel {
	private int no;
	private int goods_no;
	private String id;
	private String com;
	private Date com_reg_date;
	private String re_save;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
}
