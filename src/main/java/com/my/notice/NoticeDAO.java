package com.my.notice;

import java.util.List;

import com.my.qna.QnaModel;
// DB 작업을 위한 메소드를 선언하는 인터페이스
public interface NoticeDAO {
	// 용도에 맞게 메소드를 만들어준다.
	// -- 관리자 용 
	// 글 목록을 보기 위한 메소드 
	public List<NoticeModel> list() throws Exception;
	
	// 글 쓰기를 위한 메소드
	public void insert(NoticeModel model) throws Exception;
	
	// 글 상세보기를 위한 메소드
	public NoticeModel view(int no) throws Exception;
	
	// 글 수정을 위한 메소드
	public int modify(NoticeModel model) throws Exception;
	
	// 글 삭제를 위한 메소드
	public void delete(int no) throws Exception;
	
	// -- 회원용
	// 글 목록을 보기 위한 메소드
	public List<NoticeModel> ylist() throws Exception;
	
	// 제목으로 검색
	public List<NoticeModel> searchSub(String search) throws Exception;
	
	// 내용으로 검색
	public List<NoticeModel> searchCon(String search) throws Exception;
	
}
