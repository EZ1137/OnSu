package com.kh.onsoo.free.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onsoo.free.model.dto.FreeboardDto;

@Repository
public class FreeboardDaoImpl implements FreeboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(FreeboardDaoImpl.class);

	@Override
	public List<FreeboardDto> selectList() {
		List<FreeboardDto> list = new ArrayList<FreeboardDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			logger.info("[ERROR] freeboard selectList ");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public FreeboardDto selectOne(int free_seq) {

		FreeboardDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", free_seq);
		} catch (Exception e) {
			logger.info("[Error] freeboard selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(FreeboardDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] freeboard insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(FreeboardDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			logger.info("[ERROR] freeboard update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int free_seq) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",free_seq);
		} catch (Exception e) {
			logger.info("[ERROR] freeboard delete");
			e.printStackTrace();
		}
		
		return res;
	}

}
