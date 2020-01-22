package com.my.funiture;

import java.util.List;

import com.my.member.MemberModel;
import com.my.order.OrderModel;

public interface AdminDAO {
	
	// 회원정보
	List<MemberModel> memberList();
	
	public Object admemberModify(MemberModel member);
	
	public Object admemberDelete(MemberModel member);

	public List<OrderModel> adOrderList();
	   
	   public List<OrderModel> adCustomList();
	   
	   public List<OrderModel> adOnedayList();
	   
	   public OrderModel orderGetOne(int order_no);
	   
	   public OrderModel customGetOne(int order_no);
	   
	   public OrderModel onedayGetOne(int order_no);
	   
	   public Object orderModify (OrderModel orderModel);
	   
	   public Object customOrderModify (OrderModel orderModel);
	   
	   public Object onedayOrderModify (OrderModel orderModel);
	
}
