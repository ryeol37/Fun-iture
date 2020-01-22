package com.my.oneday;

import java.util.List;

import com.my.oneday.UserOnedayModel;

public interface UserOnedayDAO {
	
	// 강좌 목록
	public List<UserOnedayModel> list();
	
	// 강좌 주문
	public Object order(UserOnedayModel userOnedayModel);


}
