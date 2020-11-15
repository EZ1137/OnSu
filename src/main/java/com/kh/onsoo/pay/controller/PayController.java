package com.kh.onsoo.pay.controller;

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
import com.kh.onsoo.pay.model.biz.PayBiz;
import com.kh.onsoo.pay.model.dto.PayDto;

@Controller
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private AdminBiz adminBiz;
	@Autowired
	private PayBiz payBiz;
	
	@RequestMapping("/video/pay.do")
	public String videoPay(Model model, Principal principal, int pay_classno) {
		
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
	    
	    String pay_memberid = member_id;
	    
	    model.addAttribute("mlist", adminBiz.selectOne2(member_id));
	    model.addAttribute("pay_memberid", pay_memberid);
	    model.addAttribute("pay_classno", pay_classno);
	      
	    int res = payBiz.insert(new PayDto(0, pay_memberid, pay_classno, null));
	    if(res > 0) {
	    	return "redirect:payRes.do";
	    }
		
		return "pay";
	}
	
	@RequestMapping("/with/pay.do")
	public String withPay(Model model, Principal principal, int pay_classno) {
		
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
	    
	    String pay_memberid = member_id;
	    
	    model.addAttribute("mlist", adminBiz.selectOne2(member_id));
	    model.addAttribute("pay_memberid", pay_memberid);
	    model.addAttribute("pay_classno", pay_classno);
	      
	    int res = payBiz.insert(new PayDto(0, pay_memberid, pay_classno, null));
	    if(res > 0) {
	    	return "redirect:payRes.do";
	    }
		
		return "pay";
	}
	
	@RequestMapping("/video/payRes.do")
	public String videoPayRes(Model model, @RequestParam String pay_memberid, int pay_classno) {
		
		model.addAttribute("dto", payBiz.selectPay(pay_memberid, pay_classno));
		model.addAttribute("member_id", pay_memberid);
		model.addAttribute("listen_classno", pay_classno);
		
		return "pay";
	}
	
	@RequestMapping("/with/payRes.do")
	public String withPayRes(Model model, @RequestParam String pay_memberid, int pay_classno) {
		
		model.addAttribute("dto", payBiz.selectPay(pay_memberid, pay_classno));
		model.addAttribute("member_id", pay_memberid);
		model.addAttribute("listen_classno", pay_classno);
		
		return "pay";
	}
	
	@RequestMapping("/video/payDelete")
	public String payVDelete(PayDto dto, @RequestParam String pay_memberid, int pay_classno) {
		
		int res = payBiz.delete(new PayDto(pay_memberid, pay_classno));
		if(res > 0) {
			return "redirect:studydetail.do?class_no=" + pay_classno + "&member_id=" + pay_memberid;
		}
		
		return "/mypage.do";
	}
	
	@RequestMapping("/with/payDelete")
	public String payWDelete(PayDto dto, @RequestParam String pay_memberid, int pay_classno) {
		
		int res = payBiz.delete(new PayDto(pay_memberid, pay_classno));
		if(res > 0) {
			return "redirect:studydetail.do?class_no=" + pay_classno + "&member_id=" + pay_memberid;
		}
		
		return "/mypage.do";
	}

}
