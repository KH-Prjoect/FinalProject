
package com.kh.bnpp.model.biz;

import java.util.List;

import com.kh.bnpp.model.dto.MemberDto;

public interface MemberBiz {

	public MemberDto login(MemberDto dto);	
	public int insert(MemberDto dto);		
	public int delete(MemberDto dto);		
	public String checkId(String checkID);  
	public String findId(MemberDto dto); 
	public String findPw(MemberDto dto); 
	public List<MemberDto> findAllT(String category); 


	public List<MemberDto> selectList();
	public MemberDto selectOne(String member_id);
	public int updatestudent(MemberDto dto);
	public int updateteacher(MemberDto dto);
	public int updatepw(MemberDto dto);
}

