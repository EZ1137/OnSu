package com.kh.onsoo.free.controller;



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

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.free.model.biz.FreeboardBiz;
import com.kh.onsoo.free.model.dto.FreeboardDto;
import com.kh.onsoo.reply.biz.ReplyBiz;
import com.kh.onsoo.utils.PagingVO;



@Controller
public class FreeboardController {

	private static final Logger logger = LoggerFactory.getLogger(FreeboardController.class);

	@Autowired
	private FreeboardBiz freeBiz;
	
	@Autowired
	private AdminBiz  adminBiz;
	
	@Autowired
	private ReplyBiz replybiz;


	@RequestMapping("/freelist.do")
	public String freeList(Model model,Principal principal) {
		
		model.addAttribute("list", freeBiz.selectList());
		
	      
		return "/user/freeList";
	}

	@RequestMapping(value="/freeinsert.do",method=RequestMethod.GET)
	public String insertForm() {
		logger.info("freeController>>insertForm");
		return "/user/freeInsert";
	}

	@RequestMapping(value = "/freeinsertres.do")
	public String freeInsert(FreeboardDto dto) {

		int res = freeBiz.insert(dto);
		if (res > 0) {
			logger.info("freeController>>insert success");

			return "redirect:freelist.do";
		}
		logger.info("freeController>>insert error");
		return "/user/freeInsert";
	}

	@RequestMapping("/freedetail.do")
	public String freeDeatil(Model model, int free_no) {
		model.addAttribute("freeboardDto", freeBiz.selectOne(free_no));
		
		return "/user/freeDetail";
	}

	@RequestMapping(value = "/freeupdateform.do")
	public String freeupdateForm(Model model, int free_no) {

		logger.info("freeController>>updateForm");
		model.addAttribute("freeboardDto", freeBiz.selectOne(free_no));
		return "/user/freeUpdate";
	}

	@RequestMapping(value = "/freeupdateres.do")
	public String freeupdateres(Model model, FreeboardDto dto) {

		logger.info("freeController>> update res");
		int res = freeBiz.update(dto);
		if (res > 0) {
			return "redirect:freelist.do";
		}

		logger.info("[error] freeboard update res");
		return "redirect:freeupdateform.do?free_no=" + dto.getFree_no();
	}

	@RequestMapping("/freedelete.do")
	public String freeDelete(int free_no) {

		int res = freeBiz.delete(free_no);

		if (res > 0) {
			return "redirect:freelist.do";
		}
		logger.info("[error] freeboard delete");
		return "redirect:freedetail.do?free_no=" + free_no;
	}
	
//	@RequestMapping("/boardList.do")
//	public String boardList(PagingVO vo, Model model,Principal principal
//			, @RequestParam(value="nowPage", required=false)String nowPage
//			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
//		logger.info("[error] freeboard paging list");
//		int total = freeBiz.countBoard();
//		
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) { 
//			cntPerPage = "5";
//		}
//		
//		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		model.addAttribute("paging", vo);
//		model.addAttribute("viewAll", freeBiz.selectBoard(vo));
//		
//		
//		return "/user/freeList";
//	}

}
