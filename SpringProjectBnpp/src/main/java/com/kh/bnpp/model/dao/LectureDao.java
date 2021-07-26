
package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.LectureDto;

public interface LectureDao {

	String NAMESPACE = "kh.bnpp.lec.";
	
	public List<LectureDto> selectList();
	public LectureDto selectOne(int lecture_num);
	public List<LectureDto> selectMyList(String member_id);
	public int insert(LectureDto dto);
	public int update(LectureDto dto);
	public int delete(int lecture_num);
	
}

