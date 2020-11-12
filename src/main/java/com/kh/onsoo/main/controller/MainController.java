package com.kh.onsoo.main.controller;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onsoo.admin.mail.Mailservice;
import com.kh.onsoo.admin.mail.RandomCode;
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
	
	@Autowired
	private Mailservice mailService;
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;

	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	
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
			
			
			 OAuth2Operations  oauthOperations = googleConnectionFactory.getOAuthOperations();
				
				String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
				
				System.out.println("구글 :"+ url);
					
				model.addAttribute("goolge_url",url);
					
			
			
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

			@RequestMapping(value = "/admin/adminpage.do", method = RequestMethod.GET)
			public String home(Locale locale, Model model) {
				logger.info("Welcome Admin Home!");
				
				return "admin/adminmain";
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
			public String emailchk(String member_email,HttpSession session) {
				logger.info("이메일 체크");
				System.out.println(member_email);
				
				
				int res = adminBiz.emailchk(member_email);
				
				
				RandomCode randomcode = new RandomCode();
				
				String ran = randomcode.excuteGenerate();
				
				String subject = "회원가입 인증코드 발급 안내입니다";
				StringBuilder sb = new StringBuilder();
				sb.append("귀하의 인증 코드는 "+ran+"입니다.");
				System.out.println(res+"컨트롤러 res 값 확인 ");
				
				if(res == 0) {
					
					logger.info("이메일 발송");
					mailService.send(subject, sb.toString(), 
							"dhtmdals@naver.com", member_email, null, ran);
					
					return ran;
				}else {
					logger.info("이메일 발송 실패 ");
					String fail="실패";
					return fail;
				}
			}
			

			@RequestMapping(value = "/idpwFind.do",method =RequestMethod.GET)
			public String IdPwfind(Locale locale,Model model) {
				logger.info("아이디 비빌번호 찾기");
				
				return "idpwFind";
			}
			
			
			//아이디 찾기 
			@RequestMapping(value ="idfind.do" ,method = RequestMethod.POST)	
			public String idfind(AdminDto dto,Model model){
				logger.info("아이디찾기 창 ");
				
				String member_name = dto.getMember_name();
				
				AdminDto iddto =null;
				
				iddto =adminBiz.idfind(dto);
				
				model.addAttribute("iddto",iddto);
				
				if(iddto == null) {
					model.addAttribute("msg","이름과 이메일에 맞는 계정이 없습니다.");
					model.addAttribute("url","/idpwFind.do");
					return "redirect";
				}else {
					
					return "idresult";
				}
			}
			
			//비번초기화
			@RequestMapping(value = "pwfind.do",method = RequestMethod.POST)
			public String pdfind(AdminDto dto ,Model model) {
				logger.info("비밀번호 초기화창 ");
				
			
				//랜덤객체 만들어서 ran 담기 
				RandomCode  randomcode = new RandomCode();
				String ran = randomcode.excuteGenerate();
				String member_email =dto.getMember_email();

			
				String random = passwordEncoder.encode(ran);
				//메일에 보낸 랜덤 값 넣기 
				dto.setMember_pw(random);
				
				int res = 0;
				
				res =adminBiz.pwfind(dto);
				
				System.out.println(res+"res값 찾아라");
				
				
				if(res > 0) {
					//메일보내기
					String subject = "비밀번호 초기화입니다.";
					StringBuilder sb = new StringBuilder();
					sb.append("초기화 된 비밀번호는 "+ran+"입니다.");
					
					mailService.send(subject, sb.toString(), 
							"dhtmdals@naver.com", member_email,null,ran);
					
					model.addAttribute("msg","이메일로 임시 비밀번호를 보냈습니다.");
					model.addAttribute("url","/main.do");
					return "redirect";
					
				}else {
						logger.info("비밀번호 초기화 실패");
					model.addAttribute("msg","정보를 다시입력해주세요");	
					model.addAttribute("url","/idpwFind.do");
					return "redirect";
					
				}
				
				
			}
		
		//업데이트수정 이메일
		@RequestMapping(value ="/user/registUdpatechk.do" ,method = RequestMethod.GET)	
		public String registUpdatechk(Model model ,Principal principal){
			logger.info("수정전 비밀번호페이지 ");
			
			model.addAttribute(principal);
			SecurityContext context = SecurityContextHolder.getContext();
			Authentication authentication = context.getAuthentication();
			
			UserDetails principal1 = (UserDetails)authentication.getPrincipal();
			String member_id = principal1.getUsername();
			
			AdminDto dto =adminBiz.selectOne2(member_id);
			System.out.println(dto.getMember_id());
			
			model.addAttribute("dto",dto);
			return "user/registUdpatechk";
		}
			
		//정보수정페이지
		@RequestMapping(value ="/user/registUpdate.do",method = RequestMethod.GET)
		public String registUpdate(Locale locale,Model model,String member_id,AdminDto dto) {
			logger.info("업데이트 페이지 이동");
			System.out.println(dto.getMember_email()+"입력값");
			//입력값
			String user = dto.getMember_email();
			
			//해당 아이디 저장값 
			AdminDto res = adminBiz.selectOne2(member_id);
			String dbV = res.getMember_email();
			
			System.out.println(user+"< user======"+dbV+"<=dbV=====");
			
			String member_addr = res.getMember_addr();
			
			String str = member_addr;
			
			String [] array = str.split(",");
			for(int i = 0; i<array.length; i++) {
				model.addAttribute("addr", array[0]);
				model.addAttribute("addr1", array[1]);
				model.addAttribute("addr2", array[2]);
			}
			
			
			//비교
			if(user.equals(dbV)) {
				model.addAttribute("dto",res);
				logger.info("수정페이지 ㄱ");
				return "/user/registUpdate";
			}else{
				
				model.addAttribute("msg","메일을 다시 입력해주세요");
				model.addAttribute("url","/user/registUdpatechk.do");
				return "redirect";
			}
		}
		
		@RequestMapping(value = "user/registUpdate.do",method = RequestMethod.POST)
		public String registUpdate(Locale locale, Model model, AdminDto dto,HttpSession session){
			logger.info("개인정보 수정 con");
			
			
			String encPassword = passwordEncoder.encode(dto.getMember_pw());
			dto.setMember_pw(encPassword);
			
			
			
			int res = adminBiz.registUpdate(dto);
			if(res>0) {
				model.addAttribute("msg","회원 정보가 수정되었습니다");	
				model.addAttribute("url","/main.do");	
				 return "redirect";
			}else {
				 model.addAttribute("msg", "회원정보를 다시 입력해주세요");
				 model.addAttribute("url","/user/registUpdate.do");
				return "redirect";
			}
	 }
		

		@RequestMapping(value = "block.do", method = RequestMethod.GET)
		public String block(Principal principal,Model model) {
			logger.info("block 유저 페이지 이동");
			model.addAttribute(principal);
			SecurityContext context = SecurityContextHolder.getContext();
			Authentication authentication = context.getAuthentication();
			
			UserDetails principal1 = (UserDetails)authentication.getPrincipal();
			String member_id = principal1.getUsername();
			
			AdminDto dto = adminBiz.selectOne2(member_id);
			
			
			
			
			model.addAttribute("dto",dto);
			
			return "block/blockpage";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}