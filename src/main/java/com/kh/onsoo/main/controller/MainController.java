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
	
	
	//�α��� 
		@RequestMapping(value = "/login/loginForm.do",method = RequestMethod.GET)
		public String loginForm(Locale locale, Model model) {
			 logger.info("Welcome Login Form! ");
			return "login/loginForm";
		}
		
		//���� �ź� ������ 
		@RequestMapping(value = "/login/accessDenied.do",method = RequestMethod.GET)
		public String accessDenied(Locale locale, Model model) {
			logger.info("Welcome Access Denied");
			return "login/accessDenied";
		}
		
		
		//������ ������ 
			@RequestMapping(value = "/admin/adminHome.do", method = RequestMethod.GET)
			public String home(Locale locale, Model model) {
				logger.info("Welcome Admin Home!");
				
				return "admin/adminHome";
			}
			
			
			//��������� 
			@RequestMapping(value ="/block/blockhome.do", method = RequestMethod.GET)
			public String blockhome(Locale locale, Model model) {
				logger.info("������� ����� ������ ");
				return "/block/block";
			}
			
			//���� �α��� ������ �̵� 
			@RequestMapping(value = "/intro/introduction.do", method = RequestMethod.GET)
			public String introduction(Locale locale, Model model) {
				logger.info("Welcome Introduction!");
				
				//��ť��Ƽ ���ؽ�Ʈ ��ü�� ����ϴ�.
				SecurityContext context = SecurityContextHolder.getContext();
				
				//������ü�� ����ϴ�. 
				Authentication authentication = 
												context.getAuthentication();
												// context�� �ִ� ���������� getAuthentication()���� ����´�.
				//�α����� ����� ������ ���� ��ü�� ����ϴ�.
				UserDetails principal = (UserDetails)authentication.getPrincipal();
										//authentication�� �ִ�  get Princinpal ��ü�� ���������� ��´�. 
										//������ü�� UserDetails�� implement �� 
				
				String username = principal.getUsername();  //����� �̸� 
				String password = principal.getPassword();	// ����� ��й�ȣ (��ȣȭ)
				
				System.out.println("username :"+username+", password :"+password);
				
				
				
				//����ڰ� ���� ��� �� ������ ����ϴ�.
				Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
																					//���������� ��Ƽ� 
				Iterator<? extends GrantedAuthority> iter =authorities.iterator();
				
				//while���� ���� �����ִ� ������ ������ش�.
				while(iter.hasNext()) {
					GrantedAuthority auth = iter.next();
					System.out.println(" ���� : "+auth.getAuthority());
				}
				
				
				
				return "intro/introduction";
			}
			
			
			
			
			//ȸ������â �̵�
			@RequestMapping( value ="/guest/registForm.do",method = RequestMethod.GET)
			public String registerForm(Locale locale, Model model) {
				logger.info("ȸ������â �̵� ");
				return "guest/registForm";
			}
			
			//ȸ������ ������ 
			@RequestMapping(value ="/regist.do",method = RequestMethod.POST )
			public String regist(@ModelAttribute AdminDto dto) {
				logger.info("ȸ������ �Ϸ� ");
				
				String encPassword = passwordEncoder.encode(dto.getMember_pw());
				dto.setMember_pw(encPassword);
				
				System.out.println("�μ�Ʈ�� ������ ");
				
				if(adminBiz.insert(dto)>0) {
					return "redirect: login/loginForm.do";
				}
				return "redirect: user/registForm.do";
			}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

