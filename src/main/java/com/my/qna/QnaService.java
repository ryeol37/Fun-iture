package com.my.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.notice.NoticeModel;

// 클라이언트의 요청을 처리해주는 비즈니스 로직을 수행할 메소드 선언

@Repository
public class QnaService implements QnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 글 목록
	@Override
	public List<QnaModel> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.qnaList");
	}

	// 글 쓰기
	@Override
	public void insert(QnaModel model) throws Exception {
		// TODO Auto-generated method stub
		
		String subject = model.getSubject();
		String id = model.getId();
		String content = model.getContent();
		// 넘어오는 파라미터 값 읽기.
		
		content = content.replaceAll("\r\n", "<br/>");
		// 줄바꿈 처리
		
        model.setSubject(subject);
        model.setId(id);
        model.setContent(content);
        
		sqlSessionTemplate.insert("qna.insert", model);
	}

	// 상세보기
	@Override
	public QnaModel view(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qna.view", qna_no);
	}

	// 글 수정
	@Override
	public int modify(QnaModel model) throws Exception {
		// TODO Auto-generated method stub

		String content = model.getContent();

		content = content.replaceAll("\r\n", "<br/>");
		model.setContent(content);
		
	
		return sqlSessionTemplate.update("qna.modify", model);
	}

	// 글 삭제
	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("qna.delete", no);
	}

	@Override
	public List<QnaComModel> commentList(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.commentList", qna_no);
	}

	@Override
	public int commentInsert(QnaComModel com) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("qna.commentInsert", com);
	}

	@Override
	public int commentUpdate(QnaComModel com) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("qna.commentUpdate", com);
	}

	@Override
	public void commentDelete(int no) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("qna.commentDelete", no);
	}

	/*// 참고 : sql문 id 확인하기.
	@Override
	public int commentcount(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qna.commentCount",no);
	}*/

	// 댓글 상세보기
	@Override
	public QnaComModel commentview(int no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("qna.commentView", no);
	}
	
	// 관리자 글 목록
	@Override
	public List<QnaModel> adlist() throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("qna.adqnaList");
	}
	
	@Override
	public List<QnaModel> myqnaList(String id) {
		return sqlSessionTemplate.selectList("qna.myqnaList", id);
	}

	@Override
	public List<QnaModel> searchS(String keyword) {
		return sqlSessionTemplate.selectList("qna.searchS", "%" + keyword + "%");
	}

	@Override
	public List<QnaModel> searchC(String keyword) {
		return sqlSessionTemplate.selectList("qna.searchC", "%" + keyword + "%");
	}
	
}
