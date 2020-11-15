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
	public int reviewInsertRes(ReviewDto dto, @RequestParam String member_id, String review_content, int review_classno, int review_star) throws Exception{
		logger.info("[reviewInsert.do]");
		
		String review_id = member_id;
		
		return reviewBiz.insert(new ReviewDto(review_id, review_content, review_classno, review_star));
	}
	
	
	@RequestMapping("/reviewUpdate")
	@ResponseBody
	public int reviewUpdateRes(Model model, @RequestParam String member_id, int review_no, String review_content) throws Exception{
		logger.info("[reviewUpdate.do]");
		
		ReviewDto dto = reviewBiz.selectOne(review_no);
		
		if(dto.getReview_id().equals(member_id)) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReview_no(review_no);
			reviewDto.setReview_content(review_content);
			
			model.addAttribute("dto", reviewBiz.update(reviewDto));
			
			return reviewBiz.update(reviewDto);
		}
		
		return 0;
	}
	
	@RequestMapping("/reviewDelete")
	@ResponseBody
	public int delete(Model model, int review_no, @RequestParam String member_id) throws Exception{
		logger.info("[reveiwDelete]");
		
		ReviewDto dto = reviewBiz.selectOne(review_no);
		
		if(member_id.equals(dto.getReview_id())) {
			return reviewBiz.delete(review_no);
		}
		return 0;
	}
}








