package com.kh.onsu.report.model.dao;

import com.kh.onsu.report.model.dto.ReportDto;

public interface ReportDao {

	String NAMESPACE = "com.onsu.admin.reportboard.";
	
	public int insert(ReportDto dto);
	
	public ReportDto selectOne(String report_id);
}
