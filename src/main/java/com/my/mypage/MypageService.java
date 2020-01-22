package com.my.mypage;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.my.customB.CuboardModel;
import com.my.member.MemberModel;
import com.my.order.OrderModel;
import com.my.qna.QnaModel;

import org.mybatis.spring.SqlSessionTemplate;

/*추가할 model 명들 import 해야함*/
@Service
public class MypageService implements MypageDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberModel getMember(String id) {
		return sqlSessionTemplate.selectOne("mypage.select_member", id);
	}

	@Override
	public List<OrderModel> myorderList(String id) {
		return sqlSessionTemplate.selectList("order.myorderList", id);
	}

	@Override
	public List<QnaModel> qnaList(String id) {
		return sqlSessionTemplate.selectList("qna.qnaList", id);
	}

	@Override
	public List<OrderModel> creList(String id){
		return sqlSessionTemplate.selectList("order.creList");
	}
	
	@Override
	public Object orderCancel(OrderModel orderModel){
		return sqlSessionTemplate.update("order.orderCancel", orderModel);
	}
	
	@Override
	public Object reCancel(OrderModel orderModel){
		return sqlSessionTemplate.update("order.reCancel", orderModel);
	}
	
	@Override
	public Object refound(OrderModel orderModel){
		return sqlSessionTemplate.update("order.refound", orderModel);
	}
	
	@Override
	public Object exchange(OrderModel orderModel){
		return sqlSessionTemplate.update("order.exchange", orderModel);
	}
	@Override
	public Object oneCancel(OrderModel orderModel) {
		return sqlSessionTemplate.delete("order.oneCancel", orderModel);
	}
	
	@Override
	public List<OrderModel> myorderCus(String id) {
		return sqlSessionTemplate.selectList("order.myorderCus", id);
	}
	@Override
	public List<OrderModel> myorderOne(String id) {
		return sqlSessionTemplate.selectList("order.myorderOne", id);
	}
	


}
