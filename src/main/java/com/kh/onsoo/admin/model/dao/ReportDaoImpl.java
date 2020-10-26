package com.kh.onsoo.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.admin.model.dto.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(ReportDaoImpl.class);
	
	@Override
	public List<ReportDto> selectList() {
		List<ReportDto> list = new ArrayList<ReportDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			logger.info("ReportDaoImpl selectList[error]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ReportDto selectOne(int report_no) {
		ReportDto dto = new ReportDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne",report_no);
		} catch (Exception e) {
			logger.info("ReportDaoImpl selectOne[error]");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(ReportDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ReportDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int Report_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
