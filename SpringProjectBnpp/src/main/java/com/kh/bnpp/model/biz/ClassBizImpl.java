package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.ClassDao;
import com.kh.bnpp.model.dto.ClassDetailDto;
import com.kh.bnpp.model.dto.ClassDto;

@Service
public class ClassBizImpl implements ClassBiz { 
	
	@Autowired
	private ClassDao dao;
	
	@Override
	public List<ClassDetailDto> selectList(String teacher_id) {
		return dao.selectList(teacher_id);
	}

	@Override
	public ClassDto selectOne(int class_num) {
		return dao.selectOne(class_num);
	}

	@Override
	public int insert(ClassDto dto) {
		System.out.println("dto.getClass_how() : " + dto.getClass_how());
		//문자열비교는 == 아니고 .equlse()!!!!!!!!!!!!!!!!!!!!!!!!!
		if(dto.getClass_how().equals("N")) {
			System.out.println("온라인 강의라서 장소에 온라인 강의입니다!! 넣어주기");
			dto.setClass_where("온라인 강의 입니다!!");
		}
		return dao.insert(dto);
	}

	@Override
	public int update(ClassDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int class_num) {
		return dao.delete(class_num);
	}

}
