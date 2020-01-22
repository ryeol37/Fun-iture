package com.my.custom;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class CustomService implements CustomServiceImpl	{
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public void insert(CModel customCom) {
		sqlSessionTemplate.insert("custom.insertCustomCom", customCom);
	}//CustomController.reviewWrite()
	public void insertHasfile(CModel customCom) {
		sqlSessionTemplate.insert("custom.insertCusComFile", customCom);
	}//CustomController.reviewWrite()

	@Override
	public List<CustomModel> selectRowsCus() {
		
		return sqlSessionTemplate.selectList("custom.selectRowsCusMem");
	}//CustomController.list()
	
	@Override
	public CModel selectOneCus(int cu_no) {
		return sqlSessionTemplate.selectOne("custom.selectOneCus",cu_no);
	}//CustomController.view()
	public List<CustomComModel> selectRowsCusCom(int cu_no) {
		return sqlSessionTemplate.selectList("custom.selectRowsCusCom",cu_no);
	}//CustomController.view()

	@Override
	public void modify(CModel customCom) {
		sqlSessionTemplate.update("custom.updateCusCom", customCom);
	}//CustomController.reviewModify()
	public void modifyWof(CModel customCom) {
		sqlSessionTemplate.update("custom.updateCusComWof", customCom);
	}//CustomController.reviewModify()

	@Override
	public void delete(int no) {
		sqlSessionTemplate.delete("custom.deleteCusCom", no);
	}//CustomController.reviewDelete()
	
	public CModel selectOneCom(int no) {
		return sqlSessionTemplate.selectOne("custom.selectOneCom",no);
	}
	
	public CModel registComRe(CModel customCom) {
		return sqlSessionTemplate.selectOne("custom.registComRe",customCom);
	}//CustomController.reviewComWrite()
	
	public CModel deleteComRe(int no) {
		return sqlSessionTemplate.selectOne("custom.deleteComRe",no);
	}//CustomController.reviewComDelete()
	
}
