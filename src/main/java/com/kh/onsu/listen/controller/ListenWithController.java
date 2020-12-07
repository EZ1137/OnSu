package com.kh.onsu.listen.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsu.admin.model.biz.AdminBiz;
import com.kh.onsu.calendar.model.biz.CalendarBiz;
import com.kh.onsu.listen.model.biz.ListenVideoBiz;
import com.kh.onsu.listen.model.biz.ListenWithBiz;
import com.kh.onsu.listen.model.dto.ListenVideoDto;
import com.kh.onsu.listen.model.dto.ListenWithDto;
import com.kh.onsu.online.model.biz.ClassBiz;

@Controller
public class ListenWithController {
	
	private Logger logger = LoggerFactory.getLogger(ListenWithController.class);
	
	@Autowired
	private ListenVideoBiz listenVideoBiz;
	@Autowired
	private ListenWithBiz listenWithBiz;
	@Autowired
	private CalendarBiz calendarBiz;
	@Autowired
	private AdminBiz adminBiz;
	@Autowired
	private ClassBiz classBiz;
	
	@RequestMapping(value = "/with/listen")
	public String selectList(Model model, Principal principal) {
		logger.info("[listenWList]");
		
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
	      
		model.addAttribute("lvlist", listenVideoBiz.selectList(member_id));
		model.addAttribute("lwlist", listenWithBiz.selectList(member_id));
	    model.addAttribute("mlist", adminBiz.selectOne2(member_id));
	    model.addAttribute("callist", calendarBiz.schedule(member_id));
		
		return "/user/mypage";
	}
	
	@RequestMapping(value = "/with/listenDetail")
	public String selectOne(Model model, int listen_wclassno, @RequestParam String member_id) {
		
		logger.info("[listenWDtail]");
		
		int class_no = listen_wclassno;
		
		model.addAttribute("dto", classBiz.selectOne(class_no));
		model.addAttribute("member_id", member_id);
		
		return "/user/listenwdetail";
	}
	
	@RequestMapping(value = "/with/listenInsert")
	public String insert(Model model, @RequestParam String member_id, String title, int listen_classno) {
		logger.info("[listenVInsert]");
		
		String listen_wmemberid = member_id;
		String listen_wclasstitle = title;
		int listen_wclassno = listen_classno;
		
		int res = listenWithBiz.insert(new ListenWithDto(0, listen_wmemberid, listen_wclassno, 1, listen_wclasstitle));
		
		if (res > 0) {
			return "redirect:/mypage.do";
		}
		return "/studydetail";
	}	
	
	@RequestMapping(value = "/listenWDelete")
	public String delete(int listen_wclassno) {
		logger.info("[listenWDelete]");
		
		int res = listenWithBiz.delete(listen_wclassno);
		if(res > 0) {
			return "redirect:listenWList";
		}
		return "redirect:listenWDetail?listen_wno=" + listen_wclassno;
	}
}