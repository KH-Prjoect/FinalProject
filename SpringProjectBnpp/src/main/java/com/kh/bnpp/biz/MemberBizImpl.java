package com.kh.bnpp.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.dao.MemberDao;
import com.kh.bnpp.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz{

	@Autowired
	private MemberDao dao;

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public int insert(MemberDto dto) {
		
		if(dto.getMember_role() == null) {
			dto.setMember_role("M");
		}
		return dao.insert(dto);
	}

	@Override
	public int delete(MemberDto dto) {
		return dao.delete(dto);
	}
	
	@Override
	public String checkId(String checkID) {
		return dao.checkId(checkID);
	}

	@Override
	public String findId(MemberDto dto) {
		return dao.findId(dto);
	}

	@Override
	public String findPw(MemberDto dto) {
		return dao.findPw(dto);
	}
	
	
	
}
