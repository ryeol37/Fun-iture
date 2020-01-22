package com.my.goods;

import java.util.Date;

public class goodsModel {

	private int goods_no; 
	private int cate_no;
	private String goods_name;
	private String goods_size;
	private int goods_price;
	private int goods_qty;
	private String main_save;
	private String detail_save;
	private Date reg_date;
	private String status;
	
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_size() {
		return goods_size;
	}
	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	public String getMain_save() {
		return main_save;
	}
	public void setMain_save(String main_save) {
		this.main_save = main_save;
	}
	public String getDetail_save() {
		return detail_save;
	}
	public void setDetail_save(String detail_save) {
		this.detail_save = detail_save;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
