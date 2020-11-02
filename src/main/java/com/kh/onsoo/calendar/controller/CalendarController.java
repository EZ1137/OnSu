package com.kh.onsoo.calendar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsoo.calendar.model.biz.CalendarBiz;
import com.kh.onsoo.calendar.model.dto.CalendarDto;
import com.kh.onsoo.listen.model.biz.ListenVideoBiz;
import com.kh.onsoo.listen.model.biz.ListenWithBiz;
import com.kh.onsoo.utils.Utils;

@Controller
public class CalendarController {
	
	private Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private ListenVideoBiz listenVideoBiz;
	@Autowired
	private ListenWithBiz listenWithBiz;
	@Autowired
	private CalendarBiz calendarBiz;
	
	@RequestMapping(value = "mypage.do")
	public String myPage(Model model) {
		logger.info("[mypage.do]");
		
		model.addAttribute("lvlist", listenVideoBiz.selectList());
		model.addAttribute("lwlist", listenWithBiz.selectList());
		model.addAttribute("callist", calendarBiz.schedule());
		
		return "/user/mypage";
		
	}
	
	@RequestMapping(value = "calendarDetail.do")
	public String selectOne(Model model, int calendar_no) {
		logger.info("[calendarDetail.do]");
		
		model.addAttribute("dto", calendarBiz.selectOne(calendar_no));
		
		return "/calendardetail";
	}
	
	@RequestMapping(value = "/calendarInsert.do")
	public String insert() {
		logger.info("[calendarInsert.do]");
		
		return "/calendarinsert";
	}
	
	@RequestMapping(value = "/calendarInsertRes.do")
	public String insertres(CalendarDto dto, Model model, @RequestParam String year, String month, String date, String hour, String min,
			String calendar_title, String calendar_content, String member_id) {
		logger.info("[calendarInsertRes.do]");
		
		String calendar_mdate = year + Utils.isTwo(month) + Utils.isTwo(date) + Utils.isTwo(hour) + Utils.isTwo(min);
		
		int res = calendarBiz.insert(new CalendarDto(0, calendar_title, calendar_content, calendar_mdate, null, member_id));
		
		if(res > 0) {
			return "redirect:calendarList.do";
		}
		return "/calendarinsert";
	}
	
	@RequestMapping(value = "/calendarUpdate.do")
	public String update(Model model, int calendar_no) {
		logger.info("[calendarUpdate.do]");
		
		CalendarDto dto = calendarBiz.selectOne(calendar_no);
		model.addAttribute("dto", dto);
		
		return "/calendarupdate";
	}
	
	@RequestMapping(value = "/calendarUpdateRes.do", method = RequestMethod.POST)
	public String updateres(Model model, CalendarDto dto) {
		logger.info("[claendarUpdateRes.do]");
		
		int res = calendarBiz.update(dto);
		if(res > 0) {
			return "redirect:calendarDetail.do?calendar_no=" + dto.getCalendar_no();
		}
		return "redirect:calendarUpdate.do?calendar_no=" + dto.getCalendar_no();
	}
	
	@RequestMapping(value = "/calendarDelete.do")
	public String delete(int calendar_no) {
		logger.info("[calendarDelete.do]");
		
		int res = calendarBiz.delete(calendar_no);
		if(res > 0) {
			return "redirect:calendarList.do";
		}
		return "redirect:listenDetail.do?calendar_no=" + calendar_no;
	}
	
	@RequestMapping(value = "/calendarListView.do")
	public String listView(Model model, @RequestParam String year, String month, String date) {
		logger.info("[calendarListView.do]");
		
		String yyyyMMdd = year + Utils.isTwo(month) + Utils.isTwo(date);
		
		model.addAttribute("list", calendarBiz.calendarList(yyyyMMdd));
		
		return "/calendarlist";
	}
}














