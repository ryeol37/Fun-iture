package com.my.oneday;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserOnedayService implements UserOnedayDAO{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/*강좌 주문*/
	@Override
	public Object order(UserOnedayModel userOnedayModel) {
		 sqlSessionTemplate.insert("oneday.orderOneday", userOnedayModel);
		 /*주문 하면 insert 되고 동시에 주문 가능 인원수 빠지는거 필요함 */
		return true;
	}

	@Override
	public List<UserOnedayModel> list() {
		// TODO Auto-generated method stub
		return null;
	}
	/*강좌 예약가능 인원수 업데이트*/
	public Object updateMaxnum(UserOnedayModel userOnedayModel) {
		sqlSessionTemplate.update("oneday.updateMaxnum", userOnedayModel);

		return true;
	}

	/*장바구니 번호 매기기*/
	public int getOrder_no() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("oneday.getOrder_NO_SEQ");
	}




}
