package com.kh.onsoo.admin.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.admin.model.dao.AdminReportDao;
import com.kh.onsoo.admin.model.dto.AdminReportDto;

@Service
public class AdminReportBizImpl implements AdminReportBiz {

	@Autowired
	private AdminReportDao dao;
	
	@Override
	public List<AdminReportDto> selectList() {
		return dao.selectList();
	}

	@Override
	public AdminReportDto selectOne(String report_id) {
		return dao.selectOne(report_id);
	}

	@Override
	public int insert(AdminReportDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(AdminReportDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int Report_no) {
		return dao.delete(Report_no);
	}

}
