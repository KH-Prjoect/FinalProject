package com.kh.bnpp.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bnpp.model.dto.LectureDto;

@Repository
public class LectureDaoImpl implements LectureDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<LectureDto> selectList() {
		List<LectureDto> list = new ArrayList<LectureDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<LectureDto> selectMyList(String member_id) {
		List<LectureDto> list = new ArrayList<LectureDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectMyList", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public LectureDto selectOne(int lecture_num) {
		LectureDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", lecture_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(LectureDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(LectureDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int lecture_num) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "delete", lecture_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
