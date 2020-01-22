package com.my.mypage;

import java.util.List;

import com.my.customB.CuboardModel;
import com.my.member.MemberModel;
import com.my.order.OrderModel;
import com.my.qna.QnaModel;

//가져다 쓸 model 들을 import해서 써야함

public interface MypageDao {

	public MemberModel getMember(String id);

	public List<OrderModel> myorderList(String id);

	public List<OrderModel> creList(String id);

	public List<QnaModel> qnaList(String id);


	public Object orderCancel(OrderModel orderModel);

	public Object reCancel(OrderModel orderModel);

	public Object refound(OrderModel orderModel);

	public Object exchange(OrderModel orderModel);
	
	public Object oneCancel(OrderModel orderModel);

	public List<OrderModel> myorderCus(String id);

	public List<OrderModel> myorderOne(String id);

}
