package com.kh.onsoo.listen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onsoo.listen.model.biz.ListenVideoBiz;
import com.kh.onsoo.listen.model.dto.ListenVideoDto;

@Controller
public class ListenVideoController {
	
	private Logger logger = LoggerFactory.getLogger(ListenVideoController.class);

	@Autowired
	private ListenVideoBiz listenBiz;
	
	@RequestMapping(value = "/listenVList.do")
	public String selectList(Model model) {
		logger.info("[listenVList]");
		
		model.addAttribute("list", listenBiz.selectList());
		
		return "";
	}
	
	@RequestMapping(value = "/listenVDetail.do")
	public String selectOne(Model model, int listen_no) {
		logger.info("[listenVDetail]");
		
		model.addAttribute("dto", listenBiz.selectOne(listen_no));
		
		return "";
	}
	
	@RequestMapping(value = "listenVInsert.do")
	public String insert() {
		logger.info("[listenVInsert]");
		
		return "";
	}
	
	@RequestMapping(value = "listenVInsertRes.do")
	public String insertres(ListenVideoDto dto, Model model) {
		logger.info("[listenVInsertRes.do]");
		
		int res = listenBiz.insert(dto);
		
		if (res > 0) {
			return "";
		}
		
		return "";
	}
	
	@RequestMapping(value = "/listenVUpdate.do")
	public String update(Model model, int listen_vno) {
		logger.info("[listenVUpdate.do]");
		
		ListenVideoDto dto = listenBiz.selectOne(listen_vno);
		model.addAttribute("dto", dto);
		
		return "";
	}
	
	@RequestMapping(value = "/listenVUpdateRes.do")
	public String updateres(Model model, ListenVideoDto dto) {
		logger.info("[listenVUpdateRes.do]");
		
		int res = listenBiz.update(dto);
		if(res > 0) {
			return "redirect:listenVDetail.do?listen_vno=" + dto.getListen_vno();
		}
		
		return "redirect:listenVUpdate.do?listen_vno=" + dto.getListen_vno();
	}
	
	@RequestMapping(value = "/listenVDelete.do")
	public String delete(int listen_vno) {
		logger.info("[listenVDelete.do]");
		
		int res = listenBiz.delete(listen_vno);
		if(res > 0) {
			return "redirect:listenVList.do";
		}
		return "redirect:listenVDetail.do?listen_vno=" + listen_vno;
	}
}









