package com.my.oneday;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.my.oneday.AdOnedayModel;
import org.mybatis.spring.SqlSessionTemplate;

@Service
public class AdOnedayService implements AdOnedayDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/* 강좌 목록 불러오기 */
	@Override
	public List<AdOnedayModel> list() {
		return sqlSessionTemplate.selectList("oneday.adOnedayList");
	}

	/* 강좌 등록 */
	@Override
	public Object write(AdOnedayModel onedayModel) {
		return sqlSessionTemplate.insert("oneday.adOnedayWrite", onedayModel);
	}

	/* 강좌 삭제 */
	@Override
	public Object delete(int oneday_no) {
		sqlSessionTemplate.delete("oneday.adOnedayDelete", oneday_no);
		// 리다이렉트해서 true 반환
		return true;
	}

	/* 강좌 수정 */
	@Override
	public Object modify(AdOnedayModel onedayModel) {
		sqlSessionTemplate.update("oneday.adOnedayModify", onedayModel);
		return true;
	}

	/* 강좌 하나 불러 오기 */
	@Override
	public List<AdOnedayModel> view(int oneday_no) {
		return sqlSessionTemplate.selectList("oneday.adOnedayView", oneday_no);
	}

	@Override
	public int getOneday_NO_SEQ() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("oneday.getOneday_NO_SEQ");
	}

}
