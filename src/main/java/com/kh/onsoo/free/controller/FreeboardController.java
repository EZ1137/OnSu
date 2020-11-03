package com.kh.onsoo.free.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.onsoo.free.model.biz.FreeboardBiz;
import com.kh.onsoo.free.model.dto.FreeboardDto;


@Controller
public class FreeboardController {

	private static final Logger logger = LoggerFactory.getLogger(FreeboardController.class);

	@Autowired
	private FreeboardBiz freeBiz;

	@RequestMapping("/freelist.do")
	public String freeList(Model model) {
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
	public String freeDeatil(Model model, int free_seq) {
		model.addAttribute("freeboardDto", freeBiz.selectOne(free_seq));
		return "/user/freeDetail";
	}

	@RequestMapping(value = "/freeupdateform.do")
	public String freeupdateForm(Model model, int free_seq) {

		logger.info("freeController>>updateForm");
		model.addAttribute("freeboardDto", freeBiz.selectOne(free_seq));
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
		return "redirect:freeupdateform.do?free_seq=" + dto.getFree_seq();
	}

	@RequestMapping("/freedelete.do")
	public String freeDelete(int free_seq) {

		int res = freeBiz.delete(free_seq);

		if (res > 0) {
			return "redirect:freelist.do";
		}
		logger.info("[error] freeboard delete");
		return "redirect:freedetail.do?free_seq=" + free_seq;
	}

}
