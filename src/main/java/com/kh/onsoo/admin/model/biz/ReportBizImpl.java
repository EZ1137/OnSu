package com.kh.onsoo.admin.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.admin.model.dao.ReportDao;
import com.kh.onsoo.admin.model.dto.ReportDto;

@Service
public class ReportBizImpl implements ReportBiz {

	@Autowired
	private ReportDao dao;
	
	@Override
	public List<ReportDto> selectList() {
		return dao.selectList();
	}

	@Override
	public ReportDto selectOne(int report_no) {
		return dao.selectOne(report_no);
	}

	@Override
	public int insert(ReportDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ReportDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int Report_no) {
		return dao.delete(Report_no);
	}

}
