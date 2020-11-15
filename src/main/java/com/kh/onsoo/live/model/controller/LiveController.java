package com.kh.onsoo.live.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onsoo.live.model.biz.LiveBiz;
import com.kh.onsoo.live.model.dto.LiveDto;

@Controller
public class LiveController{
	
	private static final Logger logger = LoggerFactory.getLogger(LiveController.class);
	
	@Autowired
	private LiveBiz livebiz;


	@RequestMapping("/with/teacher/livedetail.do")
	public String livedetail(Model model, int live_no) {
		model.addAttribute("liveDto",livebiz.selectOne(live_no));
		return "liveDetail";
	}
	
	@RequestMapping(value="/with/teacher/liveinsert.do",method=RequestMethod.GET)
	public String liveinsertForm(Model model,int class_no) {
		model.addAttribute("class_no",class_no);
		logger.info(">> Live Insert Form");
		return "liveinserttest";
	}
	
	@RequestMapping(value="/with/teacher/liveinsertres.do")
	public String liveInsert(LiveDto dto) {
		int res = livebiz.insert(dto);
		if(res>0) {
			logger.info(">>LiveInsert Res");
			return "redirect:livedetail.do?live_no="+dto.getLive_no();
			
		}
		logger.info(">> [Error] Live Insert RES");
		return "liveInsert";
	}
	
	@RequestMapping("/with/teacher/livedelete.do")
	public String liveDelete(int live_no) {
		int res = livebiz.delete(live_no);
		if(res>0) {
			return "redirect:studyDetail.do?class_no="+live_no;
		}
		logger.info(">> [Error] Live Delete");
		return "redirect:livedetail.do?live_no="+live_no;
		}
}