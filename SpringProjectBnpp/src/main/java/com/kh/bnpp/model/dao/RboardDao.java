package com.kh.bnpp.model.dao;

import java.util.List;

import com.kh.bnpp.model.dto.RboardDto;

public interface RboardDao {

	String NAMESPACE = "com.board.recipe.";

	public List<RboardDto> selectList();

	public RboardDto selectOne(int br_num);

	public int insert(RboardDto dto);

	public int update(RboardDto dto);

	public int delete(int br_num);
}
