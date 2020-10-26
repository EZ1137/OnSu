package com.kh.onsoo.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onsoo.study.model.biz.StudyBiz;
import com.kh.onsoo.study.model.dto.StudyDto;

@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);
	
	@Autowired
	private StudyBiz studyBiz;
	
	@RequestMapping(value = "/studylist.do")
	public String studyList(Model model) {
		
		model.addAttribute("list", studyBiz.selectList());
		return "studylist";
	}
	
	@RequestMapping(value="/studyinsert.do")
	public String insertForm() {
		return "studyinsert";
	}
	
	@RequestMapping("/studyinsertres.do")
	public String studyInsert(Model model, StudyDto dto) {
		
		int res = studyBiz.insert(dto);
		
		if(res > 0) {
			return "redirect:studylist.do";
		}
		return "studyinsert";
	}
	
	@RequestMapping("/studydetail.do")
	public String studyDetail(Model model, int class_no) {
		
		model.addAttribute("studyDto", studyBiz.selectOne(class_no));
		return "studydetail";
	}
	
	
    
}
