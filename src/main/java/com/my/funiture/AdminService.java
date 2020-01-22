package com.my.funiture;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.my.member.MemberModel;
import com.my.order.OrderModel;

@Service
public class AdminService implements AdminDAO{
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MemberModel> memberList() {
		return sqlSessionTemplate.selectList("member.memberList");
			
	}	
	// 회원수정
	@Override
	public Object admemberModify(MemberModel member) {
		return sqlSessionTemplate.update("member.adupdateMember", member);
	} 

	// 회원삭제
		@Override
		public Object admemberDelete(MemberModel member) {
			return sqlSessionTemplate.delete("member.addeleteMember", member);
		} 

		   @Override
		   public List<OrderModel> adOrderList(){
		      return sqlSessionTemplate.selectList("order.adOrderList");
		   }
		   
		   @Override
		   public List<OrderModel> adCustomList() {
		      return sqlSessionTemplate.selectList("order.adCustomList");
		   }
		   
		   @Override
		   public List<OrderModel> adOnedayList(){
		      return sqlSessionTemplate.selectList("order.adOnedayList");
		   }
		   
		   @Override
		   public OrderModel orderGetOne(int order_no) {
		      return sqlSessionTemplate.selectOne("order.orderGetOne", order_no);
		      
		   }
		   
		   @Override
		   public OrderModel customGetOne(int order_no) {
		      return sqlSessionTemplate.selectOne("order.customGetOne", order_no);
		      
		   }
		   
		   @Override
		   public OrderModel onedayGetOne(int order_no) {
		      return sqlSessionTemplate.selectOne("order.onedayGetOne", order_no);
		      
		   }

		   @Override
		   public Object orderModify(OrderModel orderModel) {
		      return sqlSessionTemplate.update("order.orderModify", orderModel);
		   }
		   
		   @Override
		   public Object customOrderModify(OrderModel orderModel) {
		      return sqlSessionTemplate.update("order.customOrderModify", orderModel);
		   }
		   
		   @Override
		   public Object onedayOrderModify(OrderModel orderModel) {
		      return sqlSessionTemplate.update("order.oendayOrderModify", orderModel);
		   }
}
