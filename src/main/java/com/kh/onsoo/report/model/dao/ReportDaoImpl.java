package com.kh.onsoo.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.report.model.dto.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(ReportDaoImpl.class);

	@Override
	public int insert(ReportDto dto) {
			int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR repport insert]");
			e.printStackTrace();
		}
		return res;
	}

}
