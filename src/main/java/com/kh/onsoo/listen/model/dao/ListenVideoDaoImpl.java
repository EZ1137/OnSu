package com.kh.onsoo.listen.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.listen.model.dto.ListenVideoDto;

@Repository
public class ListenVideoDaoImpl implements ListenVideoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(ListenVideoDaoImpl.class);

	@Override
	public List<ListenVideoDto> selectList() {
		List<ListenVideoDto> list = new ArrayList<ListenVideoDto>();
		
		list = sqlSession.selectList(NAMESPACE+"selectList");
		
		return list;
	}

	@Override
	public ListenVideoDto selectOne(int listen_vno) {
		ListenVideoDto dto = new ListenVideoDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", listen_vno);
		} catch (Exception e) {
			logger.info("[ERROR] selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(ListenVideoDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(ListenVideoDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			logger.info("[ERROR] update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int listen_vno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", listen_vno);
		} catch (Exception e) {
			logger.info("[ERROR] delete");
			e.printStackTrace();
		}
		return res;
	}

}
