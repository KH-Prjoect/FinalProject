package com.kh.bnpp.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.dao.LectureDao;
import com.kh.bnpp.dto.LectureDto;

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
