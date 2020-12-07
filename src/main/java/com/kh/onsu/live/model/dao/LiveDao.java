package com.kh.onsu.live.model.dao;

import com.kh.onsu.live.model.dto.LiveDto;

public interface LiveDao {

	String NAMESPACE = "live.";
	
	public LiveDto selectOne(int live_no);
	public int insert(LiveDto dto);
	public int delete(int live_no);
}
