package com.kh.onsoo.free.model.dao;

import java.util.List;

import com.kh.onsoo.free.model.dto.FreeboardDto;


public interface FreeboardDao {

	String NAMESPACE = "com.onsoo.free.";
	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_no);
	public int insert(FreeboardDto dto);
	public int update(FreeboardDto dto);
	public int delete(int free_no);
	
	
}
