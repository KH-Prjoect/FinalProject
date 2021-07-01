package com.kh.bnpp.model.biz;

import java.util.List;

import com.kh.bnpp.model.dto.RboardDto;

public interface RboardBiz {
	
	public List<RboardDto> selectList();

	public RboardDto selectOne(int br_num);

	public int insert(RboardDto dto);

	public int update(RboardDto dto);

	public int delete(int br_num);

}
