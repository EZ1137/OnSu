package com.kh.onsoo.admin.model.dao;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.admin.model.dto.AdminReportDto;

public interface AdminReportDao {
	
	String NAMESPACE = "com.onsoo.admin.reportboard.";
	
	public List<AdminReportDto> selectList();
	public AdminReportDto selectOne(String Report_id);
	public int insert(AdminReportDto dto);
	public int update(AdminDto dto);
	public int delete(int Report_no);

}
