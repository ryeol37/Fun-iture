package com.my.customB;

import java.util.Date;

public class CuboardComModel extends CbModel {
	private int no;
	private int cub_no;
	private String id;
	private String com;
	private Date com_reg_date;
	
	private String price;
	private String options;
	private int cu_no;//확인용 form에 상품 정보 넘겨주기 위함
	private String memo;
	private int status_no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCub_no() {
		return cub_no;
	}
	public void setCub_no(int cub_no) {
		this.cub_no = cub_no;
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
	
	
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	
	
	public int getCu_no() {
		return cu_no;
	}
	public void setCu_no(int cu_no) {
		this.cu_no = cu_no;
	}
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	
}
