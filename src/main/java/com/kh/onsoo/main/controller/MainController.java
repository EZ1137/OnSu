package com.kh.onsoo.main.controller;

import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdminBiz adminBiz;
	
	
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String contact(Model model) {
		return "contact";
	}
	
	@RequestMapping(value = "/about.do", method = RequestMethod.GET)
	public String about(Model model) {			
		return "about";
	}
	
	
	//로그인 
		@RequestMapping(value = "/login/loginForm.do",method = RequestMethod.GET)
		public String loginForm(Locale locale, Model model) {
			 logger.info("Welcome Login Form! ");
			return "login/loginForm";
		}
		
		//접속 거부 페이지 
		@RequestMapping(value = "/login/accessDenied.do",method = RequestMethod.GET)
		public String accessDenied(Locale locale, Model model) {
			logger.info("Welcome Access Denied");
			return "login/accessDenied";
		}
		
		
		//관리자 페이지 
			@RequestMapping(value = "/admin/adminHome.do", method = RequestMethod.GET)
			public String home(Locale locale, Model model) {
				logger.info("Welcome Admin Home!");
				
				return "admin/adminHome";
			}
			
			
			//블락페이지 
			@RequestMapping(value ="/block/blockhome.do", method = RequestMethod.GET)
			public String blockhome(Locale locale, Model model) {
				logger.info("블락당한 사람들 페이지 ");
				return "/block/block";
			}
			
			//계정 로그인 페이지 이동 
			@RequestMapping(value = "/intro/introduction.do", method = RequestMethod.GET)
			public String introduction(Locale locale, Model model) {
				logger.info("Welcome Introduction!");
				
				//시큐리티 컨텍스트 객체를 얻습니다.
				SecurityContext context = SecurityContextHolder.getContext();
				
				//인증객체를 얻습니다. 
				Authentication authentication = 
												context.getAuthentication();
												// context에 있는 인증정보를 getAuthentication()으로 갖고온다.
				//로그인한 사용자 정보를 가진 객체를 얻습니다.
				UserDetails principal = (UserDetails)authentication.getPrincipal();
										//authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
										//유저객체는 UserDetails를 implement 함 
				
				String username = principal.getUsername();  //사용자 이름 
				String password = principal.getPassword();	// 사용자 비밀번호 (암호화)
				
				System.out.println("username :"+username+", password :"+password);
				
				
				
				//사용자가 가진 모든 롤 정보를 얻습니다.
				Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
																					//권한정보를 담아서 
				Iterator<? extends GrantedAuthority> iter =authorities.iterator();
				
				//while문을 통해 갖고있는 권한을 출력해준다.
				while(iter.hasNext()) {
					GrantedAuthority auth = iter.next();
					System.out.println(" 권한 : "+auth.getAuthority());
				}
				
				
				
				return "intro/introduction";
			}
			
			
			
			
			//회원가입창 이동
			@RequestMapping( value ="/guest/registForm.do",method = RequestMethod.GET)
			public String registerForm(Locale locale, Model model) {
				logger.info("회원가입창 이동 ");
				return "guest/registForm";
			}
			
			//회원가입 데이터 
			@RequestMapping(value ="/regist.do",method = RequestMethod.POST )
			public String regist(@ModelAttribute AdminDto dto) {
				logger.info("회원가입 완료 ");
				
				String encPassword = passwordEncoder.encode(dto.getMember_pw());
				dto.setMember_pw(encPassword);
				
				System.out.println("인서트문 들어가나요 ");
				
				if(adminBiz.insert(dto)>0) {
					return "redirect: login/loginForm.do";
				}
				return "redirect: user/registForm.do";
			}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

