package com.my.order;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.my.goods.goodsModel;
import com.my.member.MemberModel;


@Service
public class OrderService implements OrderDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Object insertOrder(OrderModel orderModel) {
		return sqlSessionTemplate.insert("order.insertOrder", orderModel);
	}

	@Override
	public List<OrderModel> orderList(OrderModel orderModel) {
		return sqlSessionTemplate.selectList("order.orderList", orderModel);
	}

	@Override
	public Object deleteOrder(OrderModel orderModel) {
		return sqlSessionTemplate.delete("order.deleteOrder", orderModel);
	}

	@Override
	public OrderModel orderGetOne(int order_no) {
		return sqlSessionTemplate.selectOne("order.orderGetOne", order_no);

	}

	@Override
	public Object statusModify(OrderModel orderModel) {
		return sqlSessionTemplate.update("order.statusModify", orderModel);
	}

	@Override
	public List<OrderModel> myorderList(String id) {
		return sqlSessionTemplate.selectList("order.myorderList", id);
	}

	@Override
	public int statusCount(OrderModel orderModel) {
		return sqlSessionTemplate.selectOne("order.statusCount", orderModel);
	}

	@Override
	public MemberModel getMember(String id) {
		return sqlSessionTemplate.selectOne("member.select_member", id);
	}

	@Override
	public List<goodsModel> goodsList() {
		return sqlSessionTemplate.selectList("goods.goodsList");
	}
//	0205 추가
	@Override
	public List<OrderModel> creList(String id) {
		return sqlSessionTemplate.selectList("order.creList", id);
	}
	
	@Override
	public List<OrderModel> st1(String id){
		return sqlSessionTemplate.selectList("order.st1", id);
	}
	@Override
	public List<OrderModel> st2(String id){
		return sqlSessionTemplate.selectList("order.st2", id);
	}
	@Override
	public List<OrderModel> st3(String id){
		return sqlSessionTemplate.selectList("order.st3", id);
	}
	@Override
	public List<OrderModel> st4(String id){
		return sqlSessionTemplate.selectList("order.st4", id);
	}
	@Override
	public List<OrderModel> st8(String id){
		return sqlSessionTemplate.selectList("order.st8", id);
	}
	@Override
	public List<OrderModel> st10(String id){
		return sqlSessionTemplate.selectList("order.st10", id);
	}
	@Override
	public List<OrderModel> st6(String id){
		return sqlSessionTemplate.selectList("order.st6", id);
	}
	
	@Override
	public List<OrderModel> ordermadeList(String id) {
		return sqlSessionTemplate.selectList("order.ordermadeList", id);
	}
	
	@Override
	public List<OrderModel> orderoneList(String id) {
		return sqlSessionTemplate.selectList("order.orderoneList", id);
	}

}
