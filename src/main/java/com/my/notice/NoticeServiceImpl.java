package com.my.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDAO noticeDAO;

	// 관리자 글 목록
	@Override
	public List<NoticeModel> list() throws Exception {
		return noticeDAO.list();
	}
	
	// 관리자 글 쓰기
	@Override
	public void insert(NoticeModel model) throws Exception {
		
		String subject = model.getSubject();
		String id_admin = model.getId_admin();
		String content = model.getContent();
		// 넘어오는 파라미터 값 읽기.
		
		content = content.replaceAll("\r\n", "<br/>");
		// 줄바꿈 처리
		
        model.setSubject(subject);
        model.setId_admin(id_admin);
        model.setContent(content);
        // DAO에 넘길 파라미터 값 정의.
        noticeDAO.insert(model);
        // DAO의 메소드 호출 
    }
		
	// 관리자 글 상세보기
	@Override
	public NoticeModel view(int no) throws Exception {
		
		return noticeDAO.view(no);
		// TODO Auto-generated method stub
		
	}
	
	// 관리자 글 수정
	@Override
	public int modify(NoticeModel model) throws Exception {
		
		String content = model.getContent();
		
		content = content.replaceAll("\r\n", "<br/>");
		model.setContent(content);
		
		return noticeDAO.modify(model);
		
	}
	
	// 관리자 글 삭제
	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		noticeDAO.delete(no);
	}
	
	// 회원 글 목록
	@Override
	public List<NoticeModel> ylist() throws Exception {
		return noticeDAO.ylist();
	}
	
	// 제목으로 검색
	@Override
	public List<NoticeModel> searchSub(String search) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.searchSub(search);
	}
	
	// 내용으로 검색
	@Override
	public List<NoticeModel> searchCon(String search) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.searchCon(search);
	}
	
	
	
	
	
}
