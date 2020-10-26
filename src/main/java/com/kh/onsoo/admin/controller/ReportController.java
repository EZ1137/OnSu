package com.kh.onsoo.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onsoo.admin.model.biz.ReportBiz;
import com.kh.onsoo.admin.model.dto.ReportDto;

@Controller
public class ReportController {

	@Autowired
	private ReportBiz biz;
	
	private Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@RequestMapping("/reportlist.do")
	public String selectList(Model model) {
		logger.info("ReportController selectList");
		
		model.addAttribute("reportlist", biz.selectList());
		
		return "report";
	}
	
	@RequestMapping("/reportdetail.do")
	public String detail(Model model, int report_no) {
		logger.info("ReportController detail");
		
		ReportDto dto = biz.selectOne(report_no);
		model.addAttribute("dto", dto);
		return "reportdetail";
	}
	
}
