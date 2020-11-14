package com.kh.onsoo.review.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.review.model.biz.ReviewBiz;
import com.kh.onsoo.review.model.dto.ReviewDto;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewBiz reviewBiz;
	@Autowired
	private AdminBiz adminBiz;
	
	@RequestMapping("/review.do")
	@ResponseBody
	public List<ReviewDto> review(int review_classno) throws Exception{
		logger.info("[review.do]");
		
		return reviewBiz.selectList(review_classno);
	}
	
	@RequestMapping("/reviewInsert.do")
	@ResponseBody
	public int reviewInsertRes(ReviewDto dto, @RequestParam String member_id, String review_content, int review_classno, int review_star) {
		logger.info("[reviewInsert.do]");
		
		String review_id = member_id;
		
		return reviewBiz.insert(new ReviewDto(review_id, review_content, review_classno, review_star));
	}
	
	@RequestMapping("/reviewDetail.do")
	public String reviewDetail(Model model, int review_no, @RequestParam String member_id) {
		logger.info("[reviewDetail.do]");
		
		model.addAttribute("dto", reviewBiz.selectOne(review_no));
		model.addAttribute("member_id", member_id);
		
		return "user/reviewdetail";
	}
	
	@RequestMapping("/reviewUpdate.do")
	public String reviewUpate(Model model, int review_no, @RequestParam String member_id) {
		logger.info("[reviewUpdate.do]");
		
		ReviewDto dto = reviewBiz.selectOne(review_no);
		model.addAttribute("dto", dto);
		model.addAttribute("member_id", member_id);
		
		if(member_id.equals(dto.getReview_id())) {
			return "/user/reviewupdate";
		}
		model.addAttribute("msg", "작성자와 다른 id 입니다.");
		model.addAttribute("url", "/reviewDetail.do?review_no=" + dto.getReview_no() + "&member_id=" + member_id);
		
		return "redirect";
	}
	
	@RequestMapping("/reviewUpdateRes")
	public String reviewUpdateRes(Model model, ReviewDto dto, @RequestParam String member_id) {
		logger.info("[reviewUpdateRes]");
		
		int res = reviewBiz.update(dto);
		if(res > 0) {
			model.addAttribute("member_id", member_id);
			return "redirect:reviewDetail.do?review_no=" + dto.getReview_no();
		}
		
		return "redirect:reviewUpdate.do?review_no=" + dto.getReview_no();
	}
	
	@RequestMapping("/reviewDelete")
	public String delete(Model model, int review_no, @RequestParam String member_id) {
		logger.info("[reveiwDelete]");
		
		ReviewDto dto = reviewBiz.selectOne(review_no);
		
		if(member_id.equals(dto.getReview_id())) {
			int res = reviewBiz.delete(review_no);
			if(res > 0) {
				return "redirect:review.do";
			}
		}
		model.addAttribute("msg", "작성자와 다른 id 입니다.");
		model.addAttribute("url", "/reviewDetail.do?review_no=" + dto.getReview_no() + "&member_id=" + member_id);
		
		return "redirect";
	}
}








