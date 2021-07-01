package com.kh.bnpp.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bnpp.model.dao.RboardDao;
import com.kh.bnpp.model.dto.RboardDto;

@Service
public class RboardBizImpl implements RboardBiz {
	
	@Autowired
	private RboardDao dao;

	@Override
	public List<RboardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public RboardDto selectOne(int br_num) {
		return dao.selectOne(br_num);
	}

	@Override
	public int insert(RboardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(RboardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int br_num) {
		return dao.delete(br_num);
	}

}
