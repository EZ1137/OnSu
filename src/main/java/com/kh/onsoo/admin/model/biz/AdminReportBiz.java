package com.kh.onsoo.admin.model.biz;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.admin.model.dto.AdminReportDto;

public interface AdminReportBiz {
	
	public List<AdminReportDto> selectList();
	public AdminReportDto selectOne(String report_id);
	public int insert(AdminReportDto dto);
	public int update(AdminDto dto);
	public int delete(int Report_no);

}
