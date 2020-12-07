package com.kh.onsu.admin.model.dao;

import java.util.List;

import com.kh.onsu.admin.model.dto.AdminDto;
import com.kh.onsu.admin.model.dto.AdminReportDto;

public interface AdminReportDao {
	
	String NAMESPACE = "report.";
	
	public List<AdminReportDto> selectList();
	
	public AdminReportDto selectOne(String report_id);
	
	public int insert(AdminReportDto dto);
	public int update(AdminDto dto);
	public int delete(int Report_no);

}
