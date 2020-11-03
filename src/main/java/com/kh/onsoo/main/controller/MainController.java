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
	
	

	//로그인 
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
			
			

			//��������� 
			@RequestMapping(value ="/block/blockhome.do", method = RequestMethod.GET)
			public String blockhome(Locale locale, Model model) {
				logger.info("������� ����� ������ ");
				return "/block/block";
			}
			

		
			
			//소개페이지 

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
			
			
			
			

			@RequestMapping( value ="/guest/registForm.do",method = RequestMethod.GET)
			public String registerForm(Locale locale, Model model) {
				logger.info("ȸ������â �̵� ");
				return "guest/registForm";
			}
			
			//ȸ������ ������ 
			@RequestMapping(value ="/regist.do",method = RequestMethod.POST )
			public String regist(@ModelAttribute AdminDto dto) {
				logger.info("ȸ������ �Ϸ� ");

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
				

				System.out.println("�μ�Ʈ�� ������ ");

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

