package com.my.qna;

import java.util.Date;

public class QnaComModel {
	
	private int no; // 댓글 번호
	private int qna_no; // qna 글 번호
	private String id; // 댓글 작성자 id
	private String com; // 코멘트 내용
	private Date com_reg_date; // 작성일
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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
	
}
