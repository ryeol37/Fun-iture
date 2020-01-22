package com.my.mailing;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailingService implements MailingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MailingModel> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("mailing.contactList");
	}

	@Override
	public void insert(MailingModel model) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSessionTemplate.insert("mailing.insert", model);
		
	}

	/*@Override
	public MailingModel view(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("mailing.delete",no);
	}*/

}
