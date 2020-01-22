package com.my.custom;

import java.util.List;

public interface CustomServiceImpl {

	//관리자 : 새 주문제작 등록
	//회원 : 새 리뷰 등록
	public void insert(CModel model);
	
	//관리자&회원 : 주문제작 리스트 가져오기
	public List<CustomModel> selectRowsCus();
	
	//회원 : 주문제작 상세보기, 관리자 : 주문제작 수정 폼&삭제
	public CModel selectOneCus(int no);
	
	//관리자 : 주문제작 수정하기
	//회원 : 주문제작 리뷰 수정하기
	public void modify(CModel model);
	
	//관리자 : 주문제작 삭제하기
	//회원 : 주문제작 리뷰 삭제하기
	public void delete(int no);
}
