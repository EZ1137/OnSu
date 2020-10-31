package com.kh.onsoo.listen.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.listen.model.dao.ListenVideoDao;
import com.kh.onsoo.listen.model.dto.ListenVideoDto;

@Service
public class ListenVideoBizImpl implements ListenVideoBiz {
	
	@Autowired
	private ListenVideoDao listenDao;

	@Override
	public List<ListenVideoDto> selectList() {
		return listenDao.selectList();
	}

	@Override
	public ListenVideoDto selectOne(int listen_no) {
		return listenDao.selectOne(listen_no);
	}

	@Override
	public int insert(ListenVideoDto dto) {
		return listenDao.insert(dto);
	}

	@Override
	public int update(ListenVideoDto dto) {
		return listenDao.update(dto);
	}

	@Override
	public int delete(int listen_no) {
		return listenDao.delete(listen_no);
	}

}
