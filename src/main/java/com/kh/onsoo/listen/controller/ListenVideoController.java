package com.kh.onsoo.listen.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.calendar.model.biz.CalendarBiz;
import com.kh.onsoo.listen.model.biz.ListenVideoBiz;
import com.kh.onsoo.listen.model.biz.ListenWithBiz;
import com.kh.onsoo.listen.model.dto.ListenVideoDto;
import com.kh.onsoo.online.model.biz.ClassBiz;

@Controller
public class ListenVideoController {
	
	private Logger logger = LoggerFactory.getLogger(ListenVideoController.class);
	
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
	
	@RequestMapping(value = "/listenVideo.do")
	public String selectList(Model model, Principal principal) {
		logger.info("[listenVList]");
		
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
	      
		model.addAttribute("lvlist", listenVideoBiz.selectList(member_id));
		model.addAttribute("lwlist", listenWithBiz.selectList(member_id));
	    model.addAttribute("mlist", adminBiz.selectOne2(member_id));
	    model.addAttribute("callist", calendarBiz.schedule(member_id));
		
		return "/user/mypage";
		
	}
	
	@RequestMapping(value = "/listenVDetail.do")
	public String selectOne(Model model, int listen_vclassno, @RequestParam String member_id) {
		logger.info("[listenVDetail]");
		
		int class_no = listen_vclassno;
		
		model.addAttribute("dto", classBiz.selectOne(class_no));
		model.addAttribute("member_id", member_id);
		
		return "/user/listenvdetail";
	}
	
	@RequestMapping(value = "listenVInsert.do")
	public String insert(Model model, @RequestParam String member_id) {
		logger.info("[listenVInsert]");
		
		model.addAttribute("member_id", member_id);
		
		return "/user/listenvinsert";
	}
	
	@RequestMapping(value = "listenVInsertRes.do")
	public String insertres(ListenVideoDto dto, Model model) {
		logger.info("[listenVInsertRes.do]");
		
		int res = 1;
		
		if (res > 0) {
			return "redirect:listenVideo.do";
		}
		
		return "redirect:listenVInsert.do";
	}
	
	
	@RequestMapping(value = "/listenVDelete.do")
	public String delete(int listen_vclassno) {
		logger.info("[listenVDelete.do]");
		
		int res = listenVideoBiz.delete(listen_vclassno);
		if(res > 0) {
			return "redirect:listenVList.do";
		}
		return "redirect:listenVDetail.do?listen_vno=" + listen_vclassno;
	}
}









