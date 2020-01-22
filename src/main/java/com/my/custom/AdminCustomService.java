package com.my.custom;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminCustomService implements CustomServiceImpl	{
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public void insert(CModel custom) {
		sqlSessionTemplate.insert("custom.insertCustom", custom);
	}//AdminCustomController.write()

	@Override
	public List<CustomModel> selectRowsCus() {
		
		return sqlSessionTemplate.selectList("custom.selectRowsCusAd");
	}//AdminCustomController.list()
	
	@Override
	public CModel selectOneCus(int cu_no) {
		return sqlSessionTemplate.selectOne("custom.selectOneCus",cu_no);
	}//AdminCustomController.modifyForm(), delete()

	@Override
	public void modify(CModel custom) {
		sqlSessionTemplate.update("custom.updateCustom", custom);
	}//AdminCustomController.modify()

	@Override
	public void delete(int cu_no) {
		sqlSessionTemplate.delete("custom.deleteCustom", cu_no);
	}//AdminCustomController.delete()

}
