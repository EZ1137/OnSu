package com.kh.onsoo.live.model.dao;

import com.kh.onsoo.live.model.dto.LiveDto;

public interface LiveDao {

	String NAMESPACE = "com.onsoo.live.";
	
	public LiveDto selectOne(int live_no);
	public int insert(LiveDto dto);
	public int delete(int live_no);
}
