package com.kh.onsoo.admin.snslogin;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;

@Controller
public class SnsLoginController {
	
	private Logger logger = LoggerFactory.getLogger(SnsLoginController.class);
	
	
	@Autowired
	private AdminBiz adminBiz;
	
	//NaverLoginBo
	@Autowired
	private NaverLoginBo naverLoginBO;
	private String apiResult = null;
	
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드 
	@RequestMapping(value = "naverlogin.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public String login(Model model, HttpSession session) {
		System.out.println("네이버로그인 출발 ");
		//네이버 아이디로 인증 URL을 생성하기 위하여 naveLoginBO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:"+naverAuthUrl);
		
		//네이버
		model.addAttribute("url",naverAuthUrl);
		
		//생성한 인증 URL을 View로 전달 
		return "login/naverlogin";
	}
	
	//네이버 로그인 성공시 callback호출 메소드 
		
		@RequestMapping(value="/callback.do",method = {RequestMethod.GET,RequestMethod.POST})
		public String callback(Model model, @RequestParam String code, @RequestParam String state,HttpSession session) throws IOException, ParseException{
			
			
			System.out.println("callback 통과");
			
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			
			//로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);
			
			System.out.println(apiResult);
			
			JSONParser parsering = new JSONParser();
			Object obj = parsering.parse(apiResult.toString());
			JSONObject jsonObj = (JSONObject)obj;
			JSONObject resObj = (JSONObject)jsonObj.get("response");
			
			//id , email , 생년월일
			String codename = (String)resObj.get("id");
			String email = (String)resObj.get("email");
			String name = (String)resObj.get("name");
			String birth = (String)resObj.get("birth");
			
			AdminDto dto = new AdminDto();
			
			dto.setMember_id(email);
			dto.setMember_name(name);
			dto.setMember_email(email);
			dto.setMember_birth(birth);
			
			String naverid = dto.getMember_id();
			
			int res= 0;
			res= adminBiz.idchk(naverid);
			
			
			if(res == 1) {
				logger.info("아이디가 있을경우");
				return "/main.do";
			}else {
				model.addAttribute("dto", dto);
				logger.info("아이디가 없을경우");
				//네이버 로그인 성공 페이지 view 호출 
				return "registForm2";
			}
			
			
			
		}
	
		@RequestMapping(value = "/oauth2callback.do", method ={RequestMethod.GET,RequestMethod.POST} )
		public String googleCallback(@RequestParam("code") String code,HttpSession session) throws IOException,InterruptedException,ExecutionException{
		
			return "registForm2";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
