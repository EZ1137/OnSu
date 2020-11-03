package com.kh.onsoo.online.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.online.model.dto.ClassDto;

@Repository
public class ClassDaoImpl implements ClassDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(ClassDaoImpl.class);
	
	public List<ClassDto> search(String search) {
		List<ClassDto> list = new ArrayList<ClassDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"search", search);
		} catch (Exception e) {
			logger.info("[ERROR] search");
			e.printStackTrace();
		}
		
		return list;
	}

}
