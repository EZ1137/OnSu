package com.kh.onsoo.report.controller;

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

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.report.model.biz.ReportBiz;
import com.kh.onsoo.report.model.dto.ReportDto;



@Controller
public class ReportController {
	
	@Autowired
    private AdminBiz adminBiz;
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ReportBiz reportBiz;
	
	@RequestMapping(value="/reportinsert.do")
	public String insertForm(Model model, Principal principal) {
		
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


         model.addAttribute("mlist", adminBiz.selectOne2(member_id));

		
		return "reportinsert";
	}
	
	@RequestMapping(value="/reportinsretres.do")
	public String reportInsert(Model model, ReportDto dto) {
		int res = reportBiz.insert(dto);
		if(res>0) {
			return "redirect:onsooMain";
		}
		return "reportinsert";
	}

}
