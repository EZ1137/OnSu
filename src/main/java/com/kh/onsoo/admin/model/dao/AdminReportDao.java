package com.kh.onsoo.admin.model.dao;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminReportDto;

public interface AdminReportDao {
	
	String NAMESPACE = "com.onsoo.admin.reportboard.";
	
	public List<AdminReportDto> selectList();
	public AdminReportDto selectOne(int report_no);
	public int insert(AdminReportDto dto);
	public int update(AdminReportDto dto);
	public int delete(int Report_no);

}
