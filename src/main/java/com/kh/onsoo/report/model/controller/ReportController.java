package com.kh.onsoo.report.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onsoo.report.model.biz.ReportBiz;
import com.kh.onsoo.report.model.dto.ReportDto;

@Controller
public class ReportController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ReportBiz reportBiz;
	
	@RequestMapping(value="/reportinsert.do")
	public String insertForm() {
		return "reportinsert";
	}
	
	@RequestMapping(value="/reportinsretres.do")
	public String reportInsert(Model model, ReportDto dto) {
		int res = reportBiz.insert(dto);
		if(res>0) {
			return "redirect:reportlist.do";
		}
		return "reportinsert";
	}

}
