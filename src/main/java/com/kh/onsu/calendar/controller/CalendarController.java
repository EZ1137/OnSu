package com.kh.onsu.calendar.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onsu.admin.model.biz.AdminBiz;
import com.kh.onsu.calendar.model.biz.CalendarBiz;
import com.kh.onsu.calendar.model.dto.CalendarDto;
import com.kh.onsu.listen.model.biz.ListenVideoBiz;
import com.kh.onsu.listen.model.biz.ListenWithBiz;
import com.kh.onsu.utils.Utils;

@Controller
public class CalendarController {
	
	private Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private ListenVideoBiz listenVideoBiz;
	@Autowired
	private ListenWithBiz listenWithBiz;
	@Autowired
	private CalendarBiz calendarBiz;
	@Autowired
	private AdminBiz adminBiz;
	
	@RequestMapping(value = "calendar")
	public String calendarList(Model model, Principal principal) {
		logger.info("[calendar]");
		
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
	
	@RequestMapping(value = "calendarDetail")
	public String selectOne(Model model, int calendar_no) {
		logger.info("[calendarDetail]");
		
		model.addAttribute("dto", calendarBiz.selectOne(calendar_no));
		
		return "/user/calendardetail";
	}
	
	@RequestMapping(value = "/calendarInsert")
	public String insert(Model model, @RequestParam String member_id) {
		logger.info("[calendarInsert]");
		
		model.addAttribute("member_id", member_id);
		
		return "/user/calendarinsert";
	}
	
	@RequestMapping(value = "/calendarInsertRes")
	public String insertres(CalendarDto dto, Model model, @RequestParam String year, String month, String date, String hour, String min,
			String calendar_title, String calendar_content, String member_id) {
		logger.info("[calendarInsertRes]");
		
		String calendar_mdate = year + Utils.isTwo(month) + Utils.isTwo(date) + Utils.isTwo(hour) + Utils.isTwo(min);
		
		int res = calendarBiz.insert(new CalendarDto(0, calendar_title, calendar_content, calendar_mdate, null, member_id));
		
		if (res > 0) {
			return "redirect:calendar";
		}
		return "/user/calendarinsert";
	}
	
	@RequestMapping(value = "/calendarUpdate")
	public String update(Model model, int calendar_no) {
		logger.info("[calendarUpdate]");
		
		CalendarDto dto = calendarBiz.selectOne(calendar_no);
		model.addAttribute("dto", dto);
		
		return "/user/calendarupdate";
	}
	
	@RequestMapping(value = "/calendarUpdateRes", method = RequestMethod.POST)
	public String updateres(Model model, CalendarDto dto) {
		logger.info("[claendarUpdateRes]");
		
		int res = calendarBiz.update(dto);
		if (res > 0) {
			return "redirect:calendarDetail?calendar_no=" + dto.getCalendar_no();
		}
		return "redirect:calendarUpdate?calendar_no=" + dto.getCalendar_no();
	}
	
	@RequestMapping(value = "/calendarDelete")
	public String delete(int calendar_no) {
		logger.info("[calendarDelete.do]");
		
		int res = calendarBiz.delete(calendar_no);
		if (res > 0) {
			return "redirect:calendar";
		}
		return "redirect:calendarDetail?calendar_no=" + calendar_no;
	}
	
	@RequestMapping(value = "/calendarListView")
	public String listView(Model model, @RequestParam String year, String month, String date) {
		logger.info("[calendarListView]");
		
		String yyyyMMdd = year + Utils.isTwo(month) + Utils.isTwo(date);
		
		model.addAttribute("list", calendarBiz.calendarList(yyyyMMdd));
		
		return "/user/calendarlist";
	}
	
	@RequestMapping(value = "calendarList")
	@ResponseBody
	public List<CalendarDto> calendarList2(Model model, Principal principal)throws Exception {
		logger.info("[calendarLiset.do]");
		
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
	    
		return calendarBiz.schedule(member_id);
		
	}
}