package com.kh.onsoo.listen.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.listen.model.dao.ListenWithDao;
import com.kh.onsoo.listen.model.dto.ListenWithDto;

@Service
public class ListenWithBizImpl implements ListenWithBiz {

	@Autowired
	private ListenWithDao listenDao;
	
	public List<ListenWithDto> selectList() {
		return listenDao.selectList();
	}

	@Override
	public ListenWithDto selectOne(int listen_wno) {
		return listenDao.selectOne(listen_wno);
	}

	@Override
	public int insert(ListenWithDto dto) {
		return listenDao.insert(dto);
	}

	@Override
	public int update(ListenWithDto dto) {
		return listenDao.update(dto);
	}

	@Override
	public int delete(int listen_wno) {
		return listenDao.delete(listen_wno);
	}

}
