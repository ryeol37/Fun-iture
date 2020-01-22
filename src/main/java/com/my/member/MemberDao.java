package com.my.member;

public interface MemberDao {
	public MemberModel memberLogin(MemberModel member);
	
	public MemberModel getMember(String id);
	
	public Object insertMember(MemberModel member);
	
	public MemberModel idFindByName(MemberModel member);
	
	public MemberModel pwFindByName(MemberModel member);
	
	public Object memberModify(MemberModel member);
	
	public Object memberDelete(String id);
	
	public int checkId(String id);

	public Object addPoint(MemberModel member);
	
		
}
