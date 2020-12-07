package com.kh.onsu.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onsu.admin.model.biz.AdminBiz;
import com.kh.onsu.admin.model.biz.AdminReportBiz;
import com.kh.onsu.admin.model.dto.AdminDto;

@Controller
public class AdminController {

	@Autowired
	private AdminBiz abiz;
	@Autowired
	private AdminReportBiz rbiz;
	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("admin/admin")
	public String selectList(Model model) {
		logger.info("AdminController selectList");
		
		model.addAttribute("list", abiz.selectList());
		model.addAttribute("teacherlist", abiz.teacherList());
		model.addAttribute("reportlist", rbiz.selectList());
		return "admin/adminmain";
	}
	
	@RequestMapping(value = "admin/memberlist", method = RequestMethod.GET)
	public String MemberselectList(Model model) {
		logger.info("AdminController memberselectList");
		
		model.addAttribute("list", abiz.selectList());
		
		return "admin/memberlist";
	}
	
	@RequestMapping("admin/reviewlist")
	public String ReviewselectList(Model model) {
		logger.info("AdminController reviewselectList");
		
		model.addAttribute("list", abiz.selectList());
		
		return "admin/reviewlist";
	}
	
	@RequestMapping("admin/reviewdetail")
	public String Reviewdetail(Model model, String member_id) {
		logger.info("AdminController reviewdetail");
		
		AdminDto dto = abiz.selectOne(member_id);
		model.addAttribute("dto", dto);
		
		return "admin/reviewdetail";
	}
	
	@RequestMapping(value = "/reviewupdate", method = {RequestMethod.GET, RequestMethod.POST})
	public String Reviewupdate(Model model, AdminDto dto) {
		logger.info("AdminController reviewupdate");
		
		int res = abiz.update(dto);
		logger.info("reviewUpdateRes : " + res);
		
		if (res > 0) {
			return "redirect: admin/reviewlist";
		}
		return "redirect: admin/reviewdetail?member_id=" + dto.getMember_id();
	}
	
}
