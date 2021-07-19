package com.kh.bnpp.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.dao.MemberDao2;
import com.kh.bnpp.dto.MemberDto2;

@Service
public class MemberBizImpl2 implements MemberBiz2 {

	@Autowired
	private MemberDao2 dao;
	
	@Override
	public List<MemberDto2> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberDto2 selectOne(String member_id) {
		return dao.selectOne(member_id);
	}

	@Override
	public int insert(MemberDto2 dto) {
		return dao.insert(dto);
	}

	@Override
	public int updatestudent(MemberDto2 dto) {
		return dao.updatestudent(dto);
	}
	
	@Override
	public int updateteacher(MemberDto2 dto) {
		return dao.updateteacher(dto);
	}

	@Override
	public int delete(String member_id) {
		return dao.delete(member_id);
	}

}
