package com.kh.onsu;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onsu.admin.model.biz.AdminBiz;
import com.kh.onsu.calendar.model.biz.CalendarBiz;
import com.kh.onsu.study.model.biz.StudyVideoBiz;
import com.kh.onsu.study.model.biz.StudyWithBiz;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CalendarBiz calendarBiz;
	@Autowired
	private AdminBiz adminBiz;
	@Autowired
	private StudyVideoBiz studyBiz;

	@Autowired
	private StudyWithBiz studyWithBiz;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Model model, Principal principal) {
		model.addAttribute("list", studyBiz.selectList());
		
		if (principal != null) {
			model.addAttribute(principal);
	      //시큐리티 컨텍스트 객체를 얻습니다.
	      SecurityContext context = SecurityContextHolder.getContext();
	      
	      //인증객체를 얻습니다. 
	      Authentication authentication = context.getAuthentication();
	                              // context에 있는 인증정보를 getAuthentication()으로 갖고온다.
	      //로그인한 사용자 정보를 가진 객체를 얻습니다.
	      UserDetails principal1 = (UserDetails)authentication.getPrincipal();
	                        //authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
	                        //유저객체는 UserDetails를 implement 함 
	      
	      String member_id = principal1.getUsername();  //사용자 이름 
	      
	      if (member_id != null) {
	      model.addAttribute("mlist", adminBiz.selectOne2(member_id));
	      model.addAttribute("callist", calendarBiz.schedule(member_id));
	      
	      model.addAttribute("withlist", studyWithBiz.selectList());
	      }
		}
		return "onsuMain";
	}
}