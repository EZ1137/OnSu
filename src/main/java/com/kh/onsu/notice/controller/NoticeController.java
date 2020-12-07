package com.kh.onsu.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsu.notice.model.biz.NoticeBiz;
import com.kh.onsu.notice.model.dto.NoticeDto;

@Controller
public class NoticeController {
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeBiz noticeBiz;
	
	
	@RequestMapping(value = "/notice")
	public String selectList(Model model) {
		model.addAttribute("notice", noticeBiz.selectList());
		return "notice";
	}
	
	@RequestMapping(value = "/noticeForm")
	public String insertForm() {
		return "noticeinsert";
	}
	
	@RequestMapping(value = "/noticeRes")
	public String noticeinsertRes(NoticeDto dto, Model model) {
		int res = noticeBiz.insert(dto);
		
		if (res > 0) {
			return "redirect: notice";
		} else {
			return "redirect: noticeForm";
		}
	}
	
	@RequestMapping(value = "/noticedetail")
	public String selectOne(Model model, @RequestParam("notice_no") int notice_no) {
		logger.info("notice_no : " + notice_no);
		
		model.addAttribute("dto", noticeBiz.selectOne(notice_no));
		
		return "noticedetail";
	}
	
	@RequestMapping(value = "/noticeUpdate")
	public String updateform(Model model, int notice_no) {
		model.addAttribute("dto", noticeBiz.selectOne(notice_no));
		return "noticeupdate";
	}
	
	@RequestMapping(value = "/updateRes")
	public String updateRes(NoticeDto dto) {
		int res = noticeBiz.update(dto);
		
		if (res > 0) {
			return "redirect: noticedetail?notice_no=" + dto.getNotice_no();
		} else {
			return "redirect: noticeUpdate?notice_no=" + dto.getNotice_no();
		}
	}
	
	@RequestMapping(value = "/noticedelete")
	public String delete (int notice_no) {
		int res = noticeBiz.delete(notice_no);
		
		if (res > 0) {
			return "redirect: notice"; 
		} else {
			return "noticedetail?notice_seq=" + notice_no;
		}
	}
	
	@RequestMapping(value = "noticesearch", method = RequestMethod.GET)
	public String search(Model model, @RequestParam String search) {
		logger.info("notice 검색 : " + search);
		model.addAttribute("list", noticeBiz.Nsearch(search));
		
		return "/noticesearch";
	}
}