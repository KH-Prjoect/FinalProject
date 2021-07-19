package com.kh.bnpp.dao;

import java.util.List;

import com.kh.bnpp.dto.LectureDto;

public interface LectureDao {

	String NAMESPACE = "kh.bnpp.lec.";
	
	public List<LectureDto> selectList();
	public LectureDto selectOne(int lecture_num);
	public int insert(LectureDto dto);
	public int update(LectureDto dto);
	public int delete(int lecture_num);
	
}
