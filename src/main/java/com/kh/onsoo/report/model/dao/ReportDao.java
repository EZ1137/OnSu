package com.kh.onsoo.report.model.dao;

import com.kh.onsoo.report.model.dto.ReportDto;

public interface ReportDao {

	String NAMESPACE = "com.onsoo.report.";
	
	public int insert(ReportDto dto);
}
