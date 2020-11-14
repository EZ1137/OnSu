package com.kh.onsoo.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.admin.model.dto.AdminReportDto;

@Repository
public class AdminReportDaoImpl implements AdminReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(AdminReportDaoImpl.class);
	
	@Override
	public List<AdminReportDto> selectList() {
		List<AdminReportDto> list = new ArrayList<AdminReportDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			logger.info("ReportDaoImpl selectList[error]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public AdminReportDto selectOne(String report_id) {
		AdminReportDto dto = new AdminReportDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne",report_id);
		} catch (Exception e) {
			logger.info("ReportDaoImpl selectOne[error]");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(AdminReportDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(AdminDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			logger.info("AdminreportDaoImp update[error]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int Report_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
