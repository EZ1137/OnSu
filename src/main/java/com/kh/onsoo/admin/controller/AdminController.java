package com.kh.onsoo.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.biz.ReportBiz;

@Controller
public class AdminController {

	@Autowired
	private AdminBiz abiz;
	@Autowired
	private ReportBiz rbiz;
	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/admin.do")
	public String selectList(Model model) {
		logger.info("AdminController selectList");
		
		model.addAttribute("list", abiz.selectList());
		model.addAttribute("reportlist",rbiz.selectList());
		return "adminmain";
	}
	
	@RequestMapping("/memberlist.do")
	public String MemberselectList(Model model) {
		logger.info("AdminController memberselectList");
		model.addAttribute("list",abiz.selectList());
		
		return "memberlist";
	}
	
	@RequestMapping("/reviewlist.do")
	public String ReviewselectList(Model model) {
		logger.info("AdminController reviewselectList");
		model.addAttribute("list",abiz.selectList());
		
		return "reviewlist";
	}
	
	@RequestMapping("/videoreviewlist.do")
	public String VideoReview(Model model) {
		logger.info("AdminController videoreviewlist");
		model.addAttribute("list");
		return "videoreview";
	}
	
}
