package com.kh.onsoo.review.controller;

import java.security.Principal;

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
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/user/review.do")
	public String review(Model model, Principal principal) {
		model.addAttribute("relist", reviewBiz.selectList());
		
		model.addAttribute(principal);
	      //시큐리티 컨텍스트 객체를 얻습니다.
	      SecurityContext context = SecurityContextHolder.getContext();
	      
	      //인증객체를 얻습니다. 
	      Authentication authentication = 
	                              context.getAuthentication();
	                              // context에 있는 인증정보를 getAuthentication()으로 갖고온다.
	      //로그인한 사용자 정보를 가진 객체를 얻습니다.
	      UserDetails principal1 = (UserDetails)authentication.getPrincipal();
	                        //authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
	                        //유저객체는 UserDetails를 implement 함 
	      
	      String member_id = principal1.getUsername();  //사용자 이름 
	      model.addAttribute("mlist", adminBiz.selectOne2(member_id));
	      
		return "/user/review";
	}
	
	@RequestMapping("/reviewInsert.do")
	public String reviewInsert(Model model, @RequestParam String member_id) {
		logger.info("[reviewInsert.do]");
		
		model.addAttribute("member_id", member_id);
		
		return "/user/reviewinsert";
	}
	
	@RequestMapping("/reviewInsertRes.do")
	public String reviewInsertRes(ReviewDto dto, @RequestParam String review_id, String review_content, int review_classno, int review_star) {
		logger.info("[reviewInsertRes.do]");
		
		int res = reviewBiz.insert(new ReviewDto(review_id, review_content, review_classno, review_star));
		
		if(res > 0) {
			return "redirect:review.do";
		}
		return "redirect:reviewInsert.do";
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








