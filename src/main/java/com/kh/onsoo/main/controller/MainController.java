package com.kh.onsoo.main.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.biz.AuthBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.admin.snslogin.NaverLoginBo;

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
	
	@Autowired
	private NaverLoginBo naverloginbo;
	
	private void setNaverLoginBo(NaverLoginBo naverLoginBo) {
		this.naverloginbo=naverLoginBo;
	}
	
	
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String contact(Model model) {
		return "contact";
	}
	
	@RequestMapping(value = "/about.do", method = RequestMethod.GET)
	public String about(Model model) {			
		return "about";
	}
	
	@RequestMapping(value = "/streaming.do", method = RequestMethod.GET)
	public String streaming(Model model) {			
		return "streaming";
	}

	//로그인 

		@RequestMapping(value = "/login/loginForm.do",method = RequestMethod.GET)
		public String loginForm(Locale locale, Model model, HttpSession session) {
			 logger.info("Welcome Login Form! ");
			
			 String naverlogin= naverloginbo.getAuthorizationUrl(session);
				
				model.addAttribute("naver",naverlogin);
			 
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
			
			//회원가입 폼 
			@RequestMapping( value ="/registForm.do",method = RequestMethod.GET)
			public String registerForm(Locale locale, Model model) {
				logger.info("회원가입 폼  ");
				return "registForm";
			}
			
			//회원가입 완료 
			@RequestMapping(value ="/regist.do",method = RequestMethod.POST )
			public String regist(@ModelAttribute AdminDto dto) {
				logger.info("회원가입  ");

				
				String encPassword = passwordEncoder.encode(dto.getMember_pw());
				dto.setMember_pw(encPassword);
				

				System.out.println("");

				String member_id = dto.getMember_id();

				
				if(adminBiz.insert(dto)>0 && authBiz.insert(member_id)>0 ) {
					return "redirect: login/loginForm.do";
				}
  				return "redirect:registForm.do";

			}
			

			
			@ResponseBody
			@RequestMapping(value = "/idChk.do", method=RequestMethod.POST)
			public int idchk(String member_id, HttpSession session){
				logger.info("아이디 체크 ");
				int res = adminBiz.idchk(member_id);
				return res;
			}
			
			@ResponseBody
			@RequestMapping(value = "/emailchk.do",method = RequestMethod.POST)
			public int emailchk(String member_email,HttpSession session) {
				logger.info("이메일 체크");
				int res = adminBiz.emailchk(member_email);
				return res;
			}
			

			@RequestMapping(value = "/login/idpwFind.do",method =RequestMethod.GET)
			public String IdPwfind(Locale locale,Model model) {
				logger.info("");
				
				return "login/idpwFind";
			}
	
}