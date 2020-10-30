package com.kh.onsoo.listen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onsoo.listen.model.biz.ListenWithBiz;
import com.kh.onsoo.listen.model.dto.ListenWithDto;

@Controller
public class ListenWithController {
	
	private Logger logger = LoggerFactory.getLogger(ListenWithController.class);
	
	@Autowired
	private ListenWithBiz listenBiz;
	
	@RequestMapping(value = "/listenWList.do")
	public String selectList(Model model) {
		logger.info("[listenWList]");
		
		model.addAttribute("list", listenBiz.selectList());
	
		return "";
	}
	
	@RequestMapping(value = "/listenWDetail.do")
	public String selectOne(Model model, int listen_wno) {
		logger.info("[listenWDtail]");
		
		model.addAttribute("dto", listenBiz.selectOne(listen_wno));
		
		return "";
	}
	
	@RequestMapping(value = "listenWInsert.do")
	public String insert() {
		logger.info("[listenWInsert]");
		
		return "";
	}
	
	@RequestMapping(value="listenWInsertRes.do")
	public String insertres(ListenWithDto dto, Model model) {
		logger.info("[listenWInsertRes.do]");
		
		int res = listenBiz.insert(dto);
		if(res > 0) {
			return "";
		}
		
		return "";
	}
	
	@RequestMapping(value = "/listenWUpdate.do")
	public String update(Model model, int listen_wno) {
		logger.info("[listenWUpdate.do]");
		
		ListenWithDto dto = listenBiz.selectOne(listen_wno);
		model.addAttribute("dto", dto);
		
		return "";
	}

	@RequestMapping(value = "/listenWUpdateRes.do")
	public String updateres(Model model, ListenWithDto dto) {
		logger.info("[listenWUpdateRes.do]");
		
		int res = listenBiz.update(dto);
		if(res > 0) {
			return "redirect:listenWDetail.do?listen_wno=" + dto.getListen_wno();
		}
		
		return "redirect:listenWUpdate.do?listen_wno="+dto.getListen_wno();
	}
	
	@RequestMapping(value = "/listenWDelete.do")
	public String delete(int listen_wno) {
		logger.info("[listenWDelete.do]");
		
		int res = listenBiz.delete(listen_wno);
		if(res > 0) {
			return "redirect:listenWList.do";
		}
		return "redirect:listenWDetail.do?listen_wno=" + listen_wno;
	}
	
}













