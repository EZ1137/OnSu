package com.kh.onsoo.main.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@RequestMapping(value = "/upload2", method = RequestMethod.GET)
	public String upload2(Locale locale, Model model) {

		return "upload2";
	}
	
	@RequestMapping(value = "/tvalid.do", method = RequestMethod.GET)
	public String tvalid(Locale locale, Model model) {			
		return "teachervalid";
	}
	
	@RequestMapping(value = "requestupload2")
	public String requestupload2(MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);

		String path = "C:\\image\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String safeFile = path + System.currentTimeMillis() + originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:/";
	}
	
	
	//�α��� 
		@RequestMapping(value = "/login/loginForm.do",method = RequestMethod.GET)
		public String loginForm(Locale locale, Model model, Principal princopal) {
			 logger.info("Welcome Login Form! ");
			 //
				model.addAttribute(princopal);
			      //시큐리티 컨텍스트 객체를 얻습니다.
			      SecurityContext context = SecurityContextHolder.getContext();
			      
			      //인증객체를 얻습니다. 
			      Authentication authentication = context.getAuthentication();
			                              // context에 있는 인증정보를 getAuthentication()으로 갖고온다.
			      //로그인한 사용자 정보를 가진 객체를 얻습니다.
			      UserDetails principal = (UserDetails)authentication.getPrincipal();
			                        //authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
			                        //유저객체는 UserDetails를 implement 함 
			      
			      String username = principal.getUsername();  //사용자 이름 
			      System.out.println("username : " + username);
			    //
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

