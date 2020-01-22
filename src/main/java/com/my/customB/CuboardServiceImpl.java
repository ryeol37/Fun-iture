package com.my.customB;

public interface CuboardServiceImpl {

//	회원 :견적문의 등록
//	회원&관리자 :견적문의 댓글 등록
	public void insert(CbModel model);
	
//	회원 :견적문의 수정 처리
//	관리자 :견적문의 댓글 최종
	public void modify(CbModel model);
	
//	회원 :견적문의 삭제 처리
//	회원&관리자 :견적문의 댓글 삭제 처리
	public void delete(int no);
}
