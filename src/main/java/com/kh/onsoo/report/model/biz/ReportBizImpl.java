package com.kh.onsoo.report.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.report.model.dao.ReportDao;
import com.kh.onsoo.report.model.dto.ReportDto;

@Service
public class ReportBizImpl implements ReportBiz {

	@Autowired
	private ReportDao reportDao;

	@Override
	public int insert(ReportDto dto) {
		return reportDao.insert(dto);
	}
	
}
