package com.my.mailing;

import java.util.List;

public interface MailingDAO {
	
	// 목록
	public List<MailingModel> list() throws Exception;
	
	// 쓰기
	public void insert(MailingModel model) throws Exception;
	
	/*// 상세보기
	public MailingModel view(int no) throws Exception;
	
	// 삭제
	public void delete(int no) throws Exception;*/
	
}
