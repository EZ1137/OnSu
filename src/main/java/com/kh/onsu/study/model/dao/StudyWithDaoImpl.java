package com.kh.onsu.study.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsu.study.model.dto.StudyDto;
import com.kh.onsu.study.model.dto.StudyImageDto;
import com.kh.onsu.study.model.dao.StudyWithDao;

@Repository
public class StudyWithDaoImpl implements StudyWithDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(StudyWithDaoImpl.class);
	
	@Override
	public List<StudyDto> selectListTeacher() {
		List<StudyDto> list = new ArrayList<StudyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE_WITH + "selectList_teacher");
		} catch (Exception e) {
			logger.info("[ERROR selectList]");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<StudyImageDto> selectList() {
		
		List<StudyImageDto> list = new ArrayList<StudyImageDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE_WITH + "selectList");
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
			dto = sqlSession.selectOne(NAMESPACE_WITH + "selectOne", class_no);
		} catch (Exception e) {
			logger.info("[ERROR selectOne]");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int selectNum() {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE_WITH + "selectNum");
		} catch (Exception e) {
			logger.info("[ERROR get class_no]");
			e.printStackTrace();
		}
		return res;
	}
	
	
	@Override
	public int insert(StudyDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE_WITH + "insert", dto);
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
			res = sqlSession.update(NAMESPACE_WITH + "update", dto);
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
			res = sqlSession.delete(NAMESPACE_WITH + "delete", class_no);
		} catch (Exception e) {
			logger.info("[ERROR delete]");
			e.printStackTrace();
		}
		return res;
	}

}
