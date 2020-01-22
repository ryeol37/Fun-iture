package com.my.qna;

import java.util.List;

public interface QnaDAO {

	// --관리자
	// QNA 글 목록
	public List<QnaModel> adlist() throws Exception;
	
	// -- 회원
	// QNA 글 목록
	public List<QnaModel> list() throws Exception;

	// QNA 글 쓰기
	public void insert(QnaModel model) throws Exception;

	// QNA 상세보기
	public QnaModel view(int qna_no) throws Exception;

	// QNA 글 수정
	public int modify(QnaModel model) throws Exception;

	// QNA 글 삭제
	public void delete(int qna_no) throws Exception;

	// 댓글 목록
	public List<QnaComModel> commentList(int qna_no) throws Exception;

	// 댓글 상세보기
	public QnaComModel commentview(int no) throws Exception;

	// 댓글 쓰기
	public int commentInsert(QnaComModel model) throws Exception;

	// 댓글 수정
	public int commentUpdate(QnaComModel model) throws Exception;

	// 댓글 삭제
	public void commentDelete(int no) throws Exception;

	/*// 댓글 갯수
	public int commentcount(int no) throws Exception;*/
	
	public List<QnaModel> myqnaList(String id);
	
	public List<QnaModel> searchS(String keyword);
	
	public List<QnaModel> searchC(String keyword);
	
	
	

}
