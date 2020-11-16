package com.kh.onsoo.message.controller;

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

import com.kh.onsoo.message.model.biz.MessageBiz;
import com.kh.onsoo.message.model.dto.MessageDto;

@Controller
public class MessageController {
	
	private Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	private MessageBiz msgBiz;
	
	@RequestMapping("/message.do")
	public String Message(Model model, Principal principal) {
		logger.info("[message.do]");
		
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
	    
	    model.addAttribute("toList", msgBiz.toList(member_id));
	    model.addAttribute("fromList", msgBiz.fromList(member_id));
	    model.addAttribute("member_id", member_id);
		
		return "msg";
	}
	
	@RequestMapping("/sendMSG.do")
	public String sendMSG(Model model, @RequestParam String member_id) {
		logger.info("[sendMSG.do]");
		
		model.addAttribute("member_id", member_id);
		
		return "sendMSG";
	}
	
	@RequestMapping("/sendMSGRes.do")
	public String sendMSGRes(MessageDto dto, @RequestParam String member_id, String msg_toid, String msg_content) {
		logger.info("[sendMSGRes.do]");
		
		String msg_fromid = member_id;
		
		int res = msgBiz.sendMSG(new MessageDto(0, msg_fromid, msg_toid, msg_content, null, null));
		
		if(res > 0) {
			return "redirect:message.do";
		}
		return "redirect:message.do";
	}
	
}







