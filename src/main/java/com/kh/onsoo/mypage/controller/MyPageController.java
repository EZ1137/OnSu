package com.kh.onsoo.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onsoo.calendar.model.biz.CalendarBiz;
import com.kh.onsoo.listen.model.biz.ListenVideoBiz;
import com.kh.onsoo.listen.model.biz.ListenWithBiz;

@Controller
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private ListenVideoBiz listenVideoBiz;
	@Autowired
	private ListenWithBiz listenWithBiz;
	@Autowired
	private CalendarBiz calendarBiz;
	
	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String myPage(Model model) {
		logger.info("[mypage.do]");
		
		model.addAttribute("lvlist", listenVideoBiz.selectList());
		model.addAttribute("lwlist", listenWithBiz.selectList());
		model.addAttribute("callist", calendarBiz.schedule());
		
		return "/user/mypage";
		
	}
}
