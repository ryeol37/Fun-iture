package com.my.order;

import java.util.List;

import com.my.goods.goodsModel;
import com.my.member.MemberModel;

public interface OrderDao {
	
	public Object insertOrder(OrderModel orderModel);

	public List<OrderModel> orderList(OrderModel orderModel);

	public Object deleteOrder(OrderModel orderModel);

	public OrderModel orderGetOne(int order_no);

	public Object statusModify(OrderModel orderModel);

//	추가 부분
	public List<OrderModel> myorderList(String id);

	public MemberModel getMember(String id);

	public List<goodsModel> goodsList();

	public int statusCount(OrderModel orderModel);
	
	public List<OrderModel> ordermadeList(String id);

	public List<OrderModel> orderoneList(String id);

	public List<OrderModel> creList(String id);

	public List<OrderModel> st1(String id);

	public List<OrderModel> st2(String id);

	public List<OrderModel> st3(String id);

	public List<OrderModel> st4(String id);

	public List<OrderModel> st8(String id);

	public List<OrderModel> st10(String id);

	public List<OrderModel> st6(String id);
	
}
