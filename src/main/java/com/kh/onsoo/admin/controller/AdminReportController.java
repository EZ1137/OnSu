package com.kh.onsoo.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onsoo.admin.model.biz.AdminReportBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.admin.model.dto.AdminReportDto;

@Controller
public class AdminReportController {

	@Autowired
	private AdminReportBiz biz;
	
	private Logger logger = LoggerFactory.getLogger(AdminReportController.class);
	
	@RequestMapping("admin/reportlist.do")
	public String selectList(Model model) {
		logger.info("ReportController selectList");
		
		model.addAttribute("reportlist", biz.selectList());
		
		return "admin/report";
	}
	
	@RequestMapping("admin/reportdetail.do")
	public String detail(Model model, String report_content) {
		logger.info("ReportController detail");
		
		AdminReportDto dto = biz.selectOne(report_content);
		System.out.println(dto.getReport_content());
		model.addAttribute("rdto", dto);
		return "admin/reportdetail";
	}
	
	@RequestMapping("reportupdate.do")
	public String update(Model model, String member_id, String member_role) {
		logger.info("ReportController update");
		
		AdminDto dto = new AdminDto();
		dto.setMember_id(member_id);
		dto.setMember_role(member_role);
		System.out.println(member_id);
		System.out.println(dto.getMember_id());
		model.addAttribute("res",biz.update(dto));
		return "redirect:admin/reportlist.do";
	}
	
}
