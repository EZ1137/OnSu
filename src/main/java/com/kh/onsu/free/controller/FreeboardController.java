package com.kh.onsu.free.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsu.admin.model.biz.AdminBiz;
import com.kh.onsu.free.model.biz.FreeboardBiz;
import com.kh.onsu.free.model.dto.FreeboardDto;
import com.kh.onsu.reply.model.biz.ReplyBiz;

@Controller
public class FreeboardController {

	private static final Logger logger = LoggerFactory.getLogger(FreeboardController.class);

	@Autowired
	private FreeboardBiz freeBiz;
	
	@Autowired
	private AdminBiz  adminBiz;
	
	@Autowired
	private ReplyBiz replybiz;

	@RequestMapping("/freelist")
	public String freeList(Model model, Principal principal) {
		
		model.addAttribute("list", freeBiz.selectList());
	      
		return "/user/freeList";
	}

	@RequestMapping(value = "/freeinsert", method = RequestMethod.GET)
	public String insertForm() {
		logger.info("freeController insertForm");
		return "/user/freeInsert";
	}

	@RequestMapping(value = "/freeinsertres")
	public String freeInsert(FreeboardDto dto) {

		int res = freeBiz.insert(dto);
		
		if (res > 0) {
			logger.info("freeController insert success");

			return "redirect:freelist";
		}
		logger.info("[Error] freeController insert");
		return "/user/freeInsert";
	}

	@RequestMapping("/freedetail")
	public String freeDeatil(Model model, int free_no) {
		model.addAttribute("freeboardDto", freeBiz.selectOne(free_no));
		
		return "/user/freeDetail";
	}

	@RequestMapping(value = "/freeupdateform")
	public String freeupdateForm(Model model, int free_no) {

		logger.info("freeController updateForm");
		model.addAttribute("freeboardDto", freeBiz.selectOne(free_no));
		return "/user/freeUpdate";
	}

	@RequestMapping(value = "/freeupdateres")
	public String freeupdateres(Model model, FreeboardDto dto) {

		logger.info("freeController update res");
		int res = freeBiz.update(dto);
		if (res > 0) {
			return "redirect:freelist";
		}
		logger.info("[Error] freeboard update res");
		return "redirect:freeupdateform?free_no=" + dto.getFree_no();
	}

	@RequestMapping("/freedelete")
	public String freeDelete(int free_no) {

		int res = freeBiz.delete(free_no);

		if (res > 0) {
			return "redirect:freelist";
		}
		logger.info("[Error] freeboard delete");
		return "redirect:freedetail?free_no=" + free_no;
	}

}
