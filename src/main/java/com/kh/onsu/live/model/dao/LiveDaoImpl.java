package com.kh.onsu.live.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsu.live.model.dto.LiveDto;


@Repository
public class LiveDaoImpl implements LiveDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(LiveDaoImpl.class);

	
	@Override
	public LiveDto selectOne(int live_no) {
		
		LiveDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"liveselectOne",live_no);
		} catch (Exception e) {
			logger.info("[ERROR] Live select One");
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(LiveDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "liveInsert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] Live insert");
			e.printStackTrace();
		}
		return res;

	}

	@Override
	public int delete(int live_no) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"liveDelete",live_no);
		} catch (Exception e) {
			logger.info("[ERROR] Live delete");
			e.printStackTrace();
		}

		return res;
	}

}
