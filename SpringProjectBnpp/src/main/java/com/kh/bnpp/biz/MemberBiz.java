package com.kh.bnpp.biz;

import java.util.List;

import com.kh.bnpp.dto.MemberDto;

public interface MemberBiz {

	public MemberDto login(MemberDto dto);	//로그인
	public int insert(MemberDto dto);		//회원가입
	public int delete(MemberDto dto);		//회원탈퇴
	public String checkId(String checkID);  //아이디 중복확인
	public String findId(MemberDto dto); //아이디 찾기
	public String findPw(MemberDto dto); //비밀번호 찾기
	
	public List<MemberDto> selectList();
	public MemberDto selectOne(String member_id);
	public int updatestudent(MemberDto dto);
	public int updateteacher(MemberDto dto);
}
