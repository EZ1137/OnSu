package com.kh.onsoo.admin.model.biz;

import java.util.List;

import com.kh.onsoo.admin.model.dto.ReportDto;

public interface ReportBiz {
	
	public List<ReportDto> selectList();
	public ReportDto selectOne(int report_no);
	public int insert(ReportDto dto);
	public int update(ReportDto dto);
	public int delete(int Report_no);

}
