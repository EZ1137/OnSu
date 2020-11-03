package com.kh.onsoo.free.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.free.model.dao.FreeboardDao;
import com.kh.onsoo.free.model.dto.FreeboardDto;

@Service
public class FreeboardBizImpl implements FreeboardBiz {

	@Autowired
	private FreeboardDao freeboardDao;
	
	@Override
	public List<FreeboardDto> selectList() {
		return freeboardDao.selectList();
	}

	@Override
	public FreeboardDto selectOne(int free_seq) {
		return freeboardDao.selectOne(free_seq);
	}

	@Override
	public int insert(FreeboardDto dto) {
		return freeboardDao.insert(dto);
	}

	@Override
	public int update(FreeboardDto dto) {
		return freeboardDao.update(dto);
	}

	@Override
	public int delete(int free_seq) {
		return freeboardDao.delete(free_seq);
	}

}
