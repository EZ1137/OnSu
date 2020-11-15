package com.kh.onsoo.search.controller;

import java.security.Principal;
import java.util.List;

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
	public String searchClass(Model model, @RequestParam String search, Principal principal) {
		logger.info("[classSearch.do]");
		
		model.addAttribute(principal);
	    //시큐리티 컨텍스트 객체를 얻습니다.
	    SecurityContext context = SecurityContextHolder.getContext();
	      
	    //인증객체를 얻습니다. 
	    Authentication authentication = 
	                              context.getAuthentication();
	                              // context에 있는 인증정보를 getAuthentication()으로 갖고온다.
	    //로그인한 사용자 정보를 가진 객체를 얻습니다.
	    UserDetails principal1 = (UserDetails)authentication.getPrincipal();
	                        //authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
	                        //유저객체는 UserDetails를 implement 함 
	      
	    String member_id = principal1.getUsername();  //사용자 이름 

	    model.addAttribute("member_id", member_id);
		
		model.addAttribute("list", classBiz.search(search));
		
		return "/classsearch";
	}
	
}
