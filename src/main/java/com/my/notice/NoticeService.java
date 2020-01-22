package com.my.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.my.notice.NoticeModel;
import com.my.notice.NoticeDAO;
// 클라이언트의 요청을 처리해주는 로직을 수행 할 메소드를 선언한다.

public interface NoticeService {

	// 글 목록
	public List<NoticeModel> list() throws Exception;

	// 글 쓰기
	public void insert(NoticeModel model) throws Exception;

	// 글 상세보기
	public NoticeModel view(int no) throws Exception;

	// 글 수정
	public int modify(NoticeModel model) throws Exception;

	// 글 삭제
	public void delete(int no) throws Exception;
	
	// 회원 글 목록
	public List<NoticeModel> ylist() throws Exception;
	
	// 제목으로 검색
	public List<NoticeModel> searchSub(String search) throws Exception;
	
	// 내용으로 검색
	public List<NoticeModel> searchCon(String search) throws Exception;
	
}
