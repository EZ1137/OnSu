package com.kh.onsu.free.model.dao;

import java.util.List;

import com.kh.onsu.free.model.dto.FreeboardDto;


public interface FreeboardDao {

	String NAMESPACE = "free.";
	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_no);
	public int insert(FreeboardDto dto);
	public int update(FreeboardDto dto);
	public int delete(int free_no);
	
	
}
