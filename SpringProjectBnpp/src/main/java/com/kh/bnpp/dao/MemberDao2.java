package com.kh.bnpp.dao;

import java.util.List;

import com.kh.bnpp.dto.MemberDto2;

public interface MemberDao2 {

	String NAMESPACE = "kh.bnpp.member.";
	
	public List<MemberDto2> selectList();
	public MemberDto2 selectOne(String member_id);
	public int insert(MemberDto2 dto);
	public int updatestudent(MemberDto2 dto);
	public int updateteacher(MemberDto2 dto);
	public int delete(String member_id);
	
}
