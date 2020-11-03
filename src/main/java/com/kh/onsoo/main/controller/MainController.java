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
	
	//��ȣȭ
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//ȸ������
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
	
	@RequestMapping(value = "/tvalid.do", method = RequestMethod.GET)
	public String tvalid(Locale locale, Model model) {			
		return "teachervalid";
	}
	
	@RequestMapping(value = "/tvalidup.do")
	public String requestupload2(MultipartHttpServletRequest mtfRequest) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);

		String path = "C:\\image\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // ���� ���� ��
			long fileSize = mf.getSize(); // ���� ������

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String safeFile = path + System.currentTimeMillis() + originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/";
	}

	//�α��� 
		@RequestMapping(value = "/login/loginForm.do",method = RequestMethod.GET)
		public String loginForm(Locale locale, Model model) {
			 logger.info("Welcome Login Form! ");
<<<<<<< HEAD
			 //
				model.addAttribute(princopal);
			      //��ť��Ƽ ���ؽ�Ʈ ��ü�� ����ϴ�.
			      SecurityContext context = SecurityContextHolder.getContext();
			      
			      //������ü�� ����ϴ�. 
			      Authentication authentication = context.getAuthentication();
			                              // context�� �ִ� ���������� getAuthentication()���� ����´�.
			      //�α����� ����� ������ ���� ��ü�� ����ϴ�.
			      UserDetails principal = (UserDetails)authentication.getPrincipal();
			                        //authentication�� �ִ�  get Princinpal ��ü�� ���������� ��´�. 
			                        //������ü�� UserDetails�� implement �� 
			      
			      String username = principal.getUsername();  //����� �̸� 
			      System.out.println("username : " + username);
			    //
=======

>>>>>>> branch 'develop' of https://github.com/parkjin1407/onsoo.git
			return "login/loginForm";
		}

	// ���ٱ��� 
		@RequestMapping(value = "/login/accessDenied.do",method = RequestMethod.GET)
		public String accessDenied(Locale locale, Model model) {
			logger.info("Welcome Access Denied");
			return "login/accessDenied";
		}

		// ������ 

			@RequestMapping(value = "/admin/adminHome.do", method = RequestMethod.GET)
			public String home(Locale locale, Model model) {
				logger.info("Welcome Admin Home!");
				
				return "admin/adminHome";
			}
			
			//ȸ������ �� 
			@RequestMapping( value ="/guest/registForm.do",method = RequestMethod.GET)
			public String registerForm(Locale locale, Model model) {
				logger.info("ȸ������ ��  ");
				return "guest/registForm";
			}
			
			//ȸ������ �Ϸ� 
			@RequestMapping(value ="/regist.do",method = RequestMethod.POST )
			public String regist(@ModelAttribute AdminDto dto) {
				logger.info("ȸ������  ");

				
				String encPassword = passwordEncoder.encode(dto.getMember_pw());
				dto.setMember_pw(encPassword);
				

				System.out.println("");

				//��� ���̵�� ȸ�����԰� ���ÿ� �������̺� ���� �ο� 
				String member_id = dto.getMember_id();

				
				if(adminBiz.insert(dto)>0 && authBiz.insert(member_id)>0 ) {
					return "redirect: login/loginForm.do";
				}
				return "redirect: user/registForm.do";
			}
			
			//���̵� �ߺ�üũ 
			/*
			@ResponseBody
			@RequestMapping(value ="idchk.do",method = RequestMethod.GET)
			public int idchk(@RequestParam("member_id")String member_id) {
				System.out.println(member_id);
				
				int res = 0 ;
				
				return res;
			}
			
			*/
			
			//���̵� �ߺ�üũ 
			@RequestMapping(value ="/idchk.do",method=RequestMethod.GET)
			@ResponseBody
			public int idchk(@RequestParam("member_id") String member_id){
				System.out.println(member_id);
				
				int res = adminBiz.idchk(member_id);
				return res;
			}
			
			@RequestMapping(value = "/login/idpwFind.do",method =RequestMethod.GET)
			public String IdPwfind(Locale locale,Model model) {
				logger.info("");
				
				return "login/idpwFind";
			}
	
}