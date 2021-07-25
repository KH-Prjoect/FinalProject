package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.LectureDao;
import com.kh.bnpp.model.dto.LectureDto;

@Service
public class LectureBizImpl implements LectureBiz {

	@Autowired
	private LectureDao dao;
	
	@Override
	public List<LectureDto> selectList() {
		return dao.selectList();
	}

	@Override
	public LectureDto selectOne(int lecture_num) {
		return dao.selectOne(lecture_num);
	}
	
	@Override
	public List<LectureDto> selectMyList(String member_id) {
		return dao.selectMyList(member_id);
	}

	@Override
	public int insert(LectureDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(LectureDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int lecture_num) {
		return dao.delete(lecture_num);
	}

}
