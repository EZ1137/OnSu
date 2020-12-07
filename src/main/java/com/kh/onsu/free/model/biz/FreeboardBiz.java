package com.kh.onsu.free.model.biz;

import java.util.List;

import com.kh.onsu.free.model.dto.FreeboardDto;

public interface FreeboardBiz {
	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_no);
	public int insert(FreeboardDto dto);
	public int update(FreeboardDto dto);
	public int delete(int free_no);

}
