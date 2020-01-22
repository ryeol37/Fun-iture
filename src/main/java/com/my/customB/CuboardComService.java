package com.my.customB;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class CuboardComService implements CuboardServiceImpl {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(CbModel cubCom) {
		sqlSessionTemplate.insert("cuboard.insertCubCom", cubCom);
	}//CuBoardController.com()

	@Override
	public void modify(CbModel cubCom) {
//		견적 협의 후 최종 확인이 이루어지면 custom_board table의 price 열이 업데이트 된다.
		sqlSessionTemplate.update("cuboard.updatePrice", cubCom);
	}//CuBoardController.addOrders()

	@Override
	public void delete(int no) {
		sqlSessionTemplate.delete("cuboard.deleteCubCom",no);
	}//CuBoardController.delCom()

	public OrderCusModel selectMem(String id) {
		return sqlSessionTemplate.selectOne("cuboard.selectMem", id);
	}//CuBoardController.addOrders()
	
	public void addOrders(OrderCusModel orders) {
		sqlSessionTemplate.insert("cuboard.addOrders",orders);
	}//CuBoardController.addOrders()
}
