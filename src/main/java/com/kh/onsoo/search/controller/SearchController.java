package com.kh.onsoo.search.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsoo.online.model.biz.ClassBiz;
import com.kh.onsoo.online.model.biz.ClassBizImpl;
import com.kh.onsoo.online.model.dto.ClassDto;

@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	private ClassBiz classBiz;
	
	@RequestMapping(value = "classSearch.do", method = RequestMethod.GET)
	public String searchClass(Model model, @RequestParam String search) {
		logger.info("[classSearch.do]");
		
		model.addAttribute("list", classBiz.search(search));
		System.out.println(search);
		
		return "/classsearch";
		
	}
}
