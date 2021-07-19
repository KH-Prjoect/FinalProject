package com.kh.bnpp.biz;

import java.util.List;

import com.kh.bnpp.dto.LectureDto;

public interface LectureBiz {

	public List<LectureDto> selectList();
	public LectureDto selectOne(int lecture_num);
	public int insert(LectureDto dto);
	public int update(LectureDto dto);
	public int delete(int lecture_num);
	
}
