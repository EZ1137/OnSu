package com.kh.onsoo.admin.model.biz;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminReportDto;

public interface AdminReportBiz {
	
	public List<AdminReportDto> selectList();
	public AdminReportDto selectOne(int report_no);
	public int insert(AdminReportDto dto);
	public int update(AdminReportDto dto);
	public int delete(int Report_no);

}
