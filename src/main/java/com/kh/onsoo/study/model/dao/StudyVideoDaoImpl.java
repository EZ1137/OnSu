package com.kh.onsoo.study.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.study.model.dto.StudyDto;
import com.kh.onsoo.study.model.dto.StudyImageDto;

@Repository
public class StudyVideoDaoImpl implements StudyVideoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(StudyVideoDaoImpl.class);
	
	@Override
	public List<StudyDto> selectListTeacher() {
		
		List<StudyDto> list = new ArrayList<StudyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE_VIDEO + "selectList_teacher");
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
			list = sqlSession.selectList(NAMESPACE_VIDEO + "selectList");
		} catch (Exception e) {
			logger.info("[ERROR selectList]");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int selectNum() {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE_VIDEO + "selectNum");
		} catch (Exception e) {
			logger.info("[ERROR get class_no]");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public StudyDto selectOne(int class_no) {
		
		StudyDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE_VIDEO + "selectOne", class_no);
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
			res = sqlSession.insert(NAMESPACE_VIDEO + "insert", dto);
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
			res = sqlSession.update(NAMESPACE_VIDEO + "update", dto);
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
			res = sqlSession.delete(NAMESPACE_VIDEO + "delete", class_no);
		} catch (Exception e) {
			logger.info("[ERROR delete]");
			e.printStackTrace();
		}
		return res;
	}


}
