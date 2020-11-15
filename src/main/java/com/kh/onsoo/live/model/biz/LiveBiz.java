package com.kh.onsoo.live.model.biz;

import com.kh.onsoo.live.model.dto.LiveDto;

public interface LiveBiz {

	
	public LiveDto selectOne(int live_no);
	public int insert(LiveDto dto);
	public int delete(int live_no);
	
}
