package com.kh.onsoo.free.model.dao;

import java.util.List;

import com.kh.onsoo.free.model.dto.FreeboardDto;
import com.kh.onsoo.utils.PagingVO;

public interface FreeboardDao {

	String NAMESPACE = "com.onsoo.free.";
	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_no);
	public int insert(FreeboardDto dto);
	public int update(FreeboardDto dto);
	public int delete(int free_no);
	
	//페이징
	public List<FreeboardDto> selectBoard(PagingVO vo);
	public int countBoard();
	
}
