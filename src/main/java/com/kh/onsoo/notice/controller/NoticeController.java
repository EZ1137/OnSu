package com.kh.onsoo.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsoo.notice.model.biz.NoticeBiz;
import com.kh.onsoo.notice.model.dto.NoticeDto;

@Controller
public class NoticeController {
	
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeBiz noticeBiz;
	
	@RequestMapping(value = "/notice.do")
	public String selectList(Model model) {
		model.addAttribute("notice",noticeBiz.selectList());
		return "notice";
	}
	
	@RequestMapping(value = "/noticeForm.do")
	public String insertForm() {
		return "noticeinsert";
	}
	
	@RequestMapping(value = "/noticeRes.do")
	public String noticeinsertRes(NoticeDto dto , Model model) {
		
		int res = noticeBiz.insert(dto);
		
		if(res>0) {
			return "redirect: notice.do";
		}else {
			return "redirect: noticeForm.do";
		}
	}
	
	@RequestMapping(value = "/noticedetail.do")
	public String selectOne(Model model, @RequestParam("notice_no") int notice_no) {
		
		model.addAttribute("dto",noticeBiz.selectOne(notice_no));
		return "noticedetail";
	}
	
	
	@RequestMapping(value ="/noticeUpdate.do")
	public String updateform(Model model, int notice_no) {
		model.addAttribute("dto",noticeBiz.selectOne(notice_no));
		return "noticeupdate";
	}
	
	@RequestMapping(value ="/updateRes.do")
	public String updateRes(NoticeDto dto) {
		int res = noticeBiz.update(dto);
		
		if(res>0) {
			return "redirect: noticedetail.do?notice_no="+dto.getNotice_no();
		}else {
			return "redirect: noticeUpdate.do?notice_no="+dto.getNotice_no();
		}
	}
	
	
	@RequestMapping(value ="/noticedelete.do" )
	public String delete (int notice_no) {
		int res = noticeBiz.delete(notice_no);
		if(res>0) {
			return "redirect: notice.do"; 
		}else {
			return "noticedetail.do?notice_seq="+notice_no;
		}
		
	}
	
	
	
	
}
