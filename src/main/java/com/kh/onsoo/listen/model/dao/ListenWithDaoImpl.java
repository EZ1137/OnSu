package com.kh.onsoo.listen.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.listen.model.dto.ListenWithDto;

@Repository
public class ListenWithDaoImpl implements ListenWithDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(ListenWithDaoImpl.class);
	
	public List<ListenWithDto> selectList() {
		List<ListenWithDto> list = new ArrayList<ListenWithDto>();
		
		list = sqlSession.selectList(NAMESPACE+"selectList");
		
		return list;
	}
	
	public ListenWithDto selectOne(int listen_wno) {
		ListenWithDto dto = new ListenWithDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", listen_wno);
		} catch (Exception e) {
			logger.info("[ERROR] selectOne");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int insert(ListenWithDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] insert");
			e.printStackTrace();
		}
		return res;
	}
	
	public int update(ListenWithDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			logger.info("[ERROR] update");
			e.printStackTrace();
		}
		return res;
	}
	
	public int delete(int listen_wno) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"delete", listen_wno);
		} catch (Exception e) {
			logger.info("[ERROR] delete");
			e.printStackTrace();
		}
		return res;
	}
	
}
