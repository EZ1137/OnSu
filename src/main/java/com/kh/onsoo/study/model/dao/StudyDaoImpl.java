package com.kh.onsoo.study.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.study.model.dto.StudyDto;

@Repository
public class StudyDaoImpl implements StudyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(StudyDaoImpl.class);
	
	@Override
	public List<StudyDto> selectList() {
		
		List<StudyDto> list = new ArrayList<StudyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			logger.info("[ERROR selectList]");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public StudyDto selectOne(int class_no) {
		
		StudyDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", class_no);
		} catch (Exception e) {
			logger.info("[ERROR selectOne]");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(StudyDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR insert]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(StudyDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			logger.info("[ERROR update]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int class_no) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", class_no);
		} catch (Exception e) {
			logger.info("[ERROR delete]");
			e.printStackTrace();
		}
		return res;
	}

}
