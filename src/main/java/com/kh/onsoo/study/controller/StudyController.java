package com.kh.onsoo.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);
	
	@RequestMapping(value = "/studylist.do")
	public String studyList(Model model) {
		
		return "studylist";
	}
	
	@RequestMapping(value="/studyinsert.do")
	public String studyInsert(Model model) {
		return "studyinsert";
	}
}
