package com.my.oneday;

import java.util.List;

import com.my.oneday.AdOnedayModel;

public interface AdOnedayDAO {
	// 강의 목록
	public List<AdOnedayModel> list();

	// 강의 등록
	public Object write(AdOnedayModel onedayModel);

	// 강의 삭제
	public Object delete(int goods_num);

	// 강의 수정
	public Object modify(AdOnedayModel OnedayModel);

	// 강좌 하나 불러오기
	public List<AdOnedayModel> view(int oneday_no);

	public int getOneday_NO_SEQ();



}
