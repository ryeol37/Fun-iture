package com.my.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// 객체를 자동생성하고 데이터베이스 예외를 spring 예외로
// 변환해서 출력하도록 해주는 어노테이션
@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	// SqlSession 객체를 자동으로 대입받는 어노테이션
	@Autowired
	private SqlSessionTemplate SqlSession;
	
	@Override // 관리자 글 목록
	public List<NoticeModel> list() throws Exception{
		return SqlSession.selectList("notice.adnoticeList");
	}
	
	@Override // 관리자 글 쓰기
	public void insert(NoticeModel model) throws Exception {
		// TODO Auto-generated method stub
		SqlSession.insert("notice.insert",model);
		
	}

	@Override // 관리자&회원 상세보기
	public NoticeModel view(int no) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("notice.view",no);
	}

	@Override // 관리자 글 수정
	public int modify(NoticeModel model) throws Exception {
		return SqlSession.update("notice.modify",model);
	}

	@Override // 관리자 글 삭제
	public void delete(int no) throws Exception {
		SqlSession.update("notice.delete",no);
		// TODO Auto-generated method stub
		
	}

	@Override // 회원 글 목록
	public List<NoticeModel> ylist() throws Exception {
		return SqlSession.selectList("notice.noticeList");
	}


	@Override // 제목으로 검색
	public List<NoticeModel> searchSub(String search) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectList("notice.searchSub", "%"+search+"%");
	}

	@Override // 내용으로 검색
	public List<NoticeModel> searchCon(String search) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectList("notice.searchCon", "%"+search+"%");
	}
	
	

	
	
}
