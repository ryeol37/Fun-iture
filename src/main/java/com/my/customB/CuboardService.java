package com.my.customB;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class CuboardService implements CuboardServiceImpl {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(CbModel cuboard) {
		sqlSessionTemplate.insert("cuboard.insertCuboard", cuboard);
	}//CuBoardController.write()
	public void insertWoF(CbModel cuboard) {
		sqlSessionTemplate.insert("cuboard.insertCuboardWoF", cuboard);
	}//CuBoardController.write()
	
//	회원 :견적문의 리스트
	public List<CuboardModel> selectRowsCub(){
		
		return sqlSessionTemplate.selectList("cuboard.selectRowsCub");
	}//CuBoardController.list()
	
//	회원 :견적문의 상세보기 & 견적문의 수정 폼
	public CbModel selectOneCub(int cub_no) {
		
		return sqlSessionTemplate.selectOne("cuboard.selectOneCub", cub_no);
	}//CuBoardController.view()
	
//	회원 :견적문의 댓글 리스트
	public List<CuboardComModel> selectRowsCubCom(int cub_no){
		
		return sqlSessionTemplate.selectList("cuboard.selectRowsCubCom",cub_no);
	}//CuBoardController.view()
	
	@Override
	public void modify(CbModel cuboard) {
		sqlSessionTemplate.update("cuboard.modifyCuboard",cuboard);
	}//CuBoardController.modify()

	@Override
	public void delete(int cub_no) {
		sqlSessionTemplate.update("cuboard.deleteCuboard",cub_no);
	}//CuBoardController.delete()

	public List<CuboardModel> selectRowsCubAd(CbModel cuboard){
		
		return sqlSessionTemplate.selectList("cuboard.selectRowsCubAd",cuboard);
	}
	
	public List<CuboardModel> searchS(String keyword) {
		return sqlSessionTemplate.selectList("cuboard.searchS", "%" + keyword + "%");
	}
	public List<CuboardModel> searchC(String keyword) {
		return sqlSessionTemplate.selectList("cuboard.searchC", "%" + keyword + "%");
	}
	
	public List<CuboardModel> cubList(String id){
	      
	      return sqlSessionTemplate.selectList("cuboard.cubList", id);
	   }
}
