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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.biz.AuthBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//암호화
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//회원정보
	@Autowired
	private AdminBiz adminBiz;
	
	@Autowired
	private AuthBiz authBiz;
	
	
	
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
		
	// 접근금지 
		@RequestMapping(value = "/login/accessDenied.do",method = RequestMethod.GET)
		public String accessDenied(Locale locale, Model model) {
			logger.info("Welcome Access Denied");
			return "login/accessDenied";
		}
		
		
		// 관리자 
			@RequestMapping(value = "/admin/adminHome.do", method = RequestMethod.GET)
			public String home(Locale locale, Model model) {
				logger.info("Welcome Admin Home!");
				
				return "admin/adminHome";
			}
			
			
		
			
			//소개페이지 
			@RequestMapping(value = "/intro/introduction.do", method = RequestMethod.GET)
			public String introduction(Locale locale, Model model) {
				logger.info("Welcome Introduction!");
				
				SecurityContext context = SecurityContextHolder.getContext();
				
				Authentication authentication = 
												context.getAuthentication();
				UserDetails principal = (UserDetails)authentication.getPrincipal();
				
				String username = principal.getUsername();  // username 
				String password = principal.getPassword();	// password 
				
				System.out.println("username :"+username+", password :"+password);
				
				
				
				Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
																					//권한 대행  
				Iterator<? extends GrantedAuthority> iter =authorities.iterator();
				
				while(iter.hasNext()) {
					GrantedAuthority auth = iter.next();
					System.out.println(" ���� : "+auth.getAuthority());
				}
				
				
				
				return "intro/introduction";
			}
			
			
			
			
			//회원가입 폼 
			@RequestMapping( value ="/guest/registForm.do",method = RequestMethod.GET)
			public String registerForm(Locale locale, Model model) {
				logger.info("회원가입 폼  ");
				return "guest/registForm";
			}
			
			//회원가입 완료 
			@RequestMapping(value ="/regist.do",method = RequestMethod.POST )
			public String regist(@ModelAttribute AdminDto dto) {
				logger.info("회원가입  ");
				
				String encPassword = passwordEncoder.encode(dto.getMember_pw());
				dto.setMember_pw(encPassword);
				
				//멤버 아이디로 회원가입과 동시에 권한테이블에 권한 부여 
				String member_id = dto.getMember_id();
				
				if(adminBiz.insert(dto)>0 && authBiz.insert(member_id)>0 ) {
					return "redirect: login/loginForm.do";
				}
				return "redirect: user/registForm.do";
			}
			
			
			//아이디 중복체크 
			/*
			@ResponseBody
			@RequestMapping(value ="idchk.do",method = RequestMethod.GET)
			public int idchk(@RequestParam("member_id")String member_id) {
				System.out.println(member_id);
				
				
				int res = 0 ;
				
				
				return res;
			}
			
			*/
			
			
			//아이디 중복체크 
			@RequestMapping(value ="/idchk.do",method=RequestMethod.GET)
			@ResponseBody
			public int idchk(@RequestParam("member_id") String member_id){
				System.out.println(member_id);
				
				int res = adminBiz.idchk(member_id);
				return res;
			}
			
			
			
			
			
			
			
	
			
			@RequestMapping(value = "/login/idpwFind.do",method =RequestMethod.GET)
			public String IdPwfind(Locale locale,Model model) {
				logger.info("���̵� ��й�ȣ ������ �̵� ");
				
				return "login/idpwFind";
			}
	
			
			
			
		
	
	
	
	
	
	
	
	
	
}

