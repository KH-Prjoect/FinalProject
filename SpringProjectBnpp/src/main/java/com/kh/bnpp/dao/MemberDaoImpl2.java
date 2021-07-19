package com.kh.bnpp.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.dto.LectureDto;
import com.kh.bnpp.dto.MemberDto2;

@Repository
public class MemberDaoImpl2 implements MemberDao2 {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberDto2> selectList() {
		List<MemberDto2> list = new ArrayList<MemberDto2>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MemberDto2 selectOne(String member_id) {
		MemberDto2 dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(MemberDto2 dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int updatestudent(MemberDto2 dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updatestudent", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int updateteacher(MemberDto2 dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updateteacher", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(String member_id) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
