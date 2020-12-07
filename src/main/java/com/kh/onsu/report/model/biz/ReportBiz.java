package com.kh.onsu.report.model.biz;

import com.kh.onsu.report.model.dto.ReportDto;

public interface ReportBiz {
	

	public int insert (ReportDto dto);
	
	public ReportDto selectOne(String report_id);
}
