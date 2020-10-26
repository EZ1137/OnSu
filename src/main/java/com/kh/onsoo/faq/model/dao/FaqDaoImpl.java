package com.kh.onsoo.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.faq.model.dto.FaqDto;

@Repository
public class FaqDaoImpl implements FaqDao {

	private Logger logger = LoggerFactory.getLogger(FaqDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FaqDto> selectList() {
		List<FaqDto> list = new ArrayList<FaqDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
			
		} catch (Exception e) {
			logger.info("[ERROR] selectList");
			e.printStackTrace();
		}
		
		return list;
	}

}
