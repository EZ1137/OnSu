package com.kh.onsoo.faq.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onsoo.faq.model.biz.FaqBiz;

@Controller
public class FaqController {
	
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	private FaqBiz faqBiz;

	@RequestMapping(value = "/faq.do", method = RequestMethod.GET)
	public String faq(Model model) {
		
		logger.info("FaqController.selectList");
		
		
		return "faq";
	}
}



