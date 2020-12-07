package com.kh.onsu.listen.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsu.listen.model.dao.ListenWithDao;
import com.kh.onsu.listen.model.dto.ListenWithDto;

@Service
public class ListenWithBizImpl implements ListenWithBiz {

	@Autowired
	private ListenWithDao listenDao;
	
	public List<ListenWithDto> selectList(String member_id) {
		return listenDao.selectList(member_id);
	}

	@Override
	public ListenWithDto selectOne(int listen_wclassno) {
		return listenDao.selectOne(listen_wclassno);
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
	public int delete(int listen_wclassno) {
		return listenDao.delete(listen_wclassno);
	}

}
