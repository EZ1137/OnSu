package com.kh.onsoo.report.model.dao;

import java.util.List;

import com.kh.onsoo.report.model.dto.ReportDto;

public interface ReportDao {

	String NAMESPACE = "com.onsoo.admin.reportboard.";
	
	public int insert(ReportDto dto);
}
