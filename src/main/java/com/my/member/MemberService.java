package com.my.member;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements MemberDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	// 로그인 체크
	@Override
	public MemberModel memberLogin(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.login", member);
	}
	
	// 아이디 중복 체크
		@Override
		public int checkId(String id) {
			return sqlSessionTemplate.selectOne("member.checkId", id);
		}

	// 회원정보 입력
	@Override
	public Object insertMember(MemberModel member) {
		return sqlSessionTemplate.insert("member.insertMember", member);
	}

	// 이름으로 비밀번호와 아이디 찾기
	@Override
	public MemberModel idFindByName(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.findId", member);
	}
	
	// 이름으로 비밀번호와 아이디 찾기
		@Override
		public MemberModel pwFindByName(MemberModel member) {
			return sqlSessionTemplate.selectOne("member.findPw", member);
		}

	// 회원수정
	@Override
	public Object memberModify(MemberModel member) {
		return sqlSessionTemplate.update("member.updateMember", member);
	}
	
	// 아이디 찾기
	@Override
	public MemberModel getMember(String id) {
		return sqlSessionTemplate.selectOne("member.getMember", id);
	}
		
	// 회원탈퇴
	@Override
	public Object memberDelete(String id) {
		return sqlSessionTemplate.delete("member.deleteMember", id);
	}

	@Override
	public Object addPoint(MemberModel member) {
		return sqlSessionTemplate.update("member.addPoint", member);
	}

}
