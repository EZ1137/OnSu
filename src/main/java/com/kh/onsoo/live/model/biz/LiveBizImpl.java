package com.kh.onsoo.live.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.live.model.dao.LiveDao;
import com.kh.onsoo.live.model.dto.LiveDto;

@Service
public class LiveBizImpl implements LiveBiz {

	@Autowired
	private LiveDao livedao;
	
	@Override
	public LiveDto selectOne(int live_no) {
		
		return livedao.selectOne(live_no);
	}

	@Override
	public int insert(LiveDto dto) {
		
		return livedao.insert(dto);
	}

	@Override
	public int delete(int live_no) {

		return livedao.delete(live_no);
	}

}
