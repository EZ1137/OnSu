package com.kh.onsoo.qna.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsoo.admin.model.biz.AdminBiz;
import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.qna.model.biz.QnaBiz;
import com.kh.onsoo.qna.model.dto.QnaDto;

@Controller
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaBiz qnaBiz;
	
	@Autowired
	private AdminBiz adminBiz;

	@RequestMapping(value = "/qna.do")
	public String selectList(Model model) {
		
		logger.info("QnaController.selectList");
		
		model.addAttribute("qna", qnaBiz.selectList());
	      
		return "/qna/qnalist";
	}

	@RequestMapping(value = "/qnaone.do", method = RequestMethod.GET)
	public String selectOne(Model model, Principal principal, @RequestParam("qnano") int qnano) {
		
		logger.info("QnaController.selectOne");
		
		/*  */
		model.addAttribute(principal);
		
		// 시큐리티 컨텍스트 객체를 얻습니다.
		SecurityContext context = SecurityContextHolder.getContext();
		
		// 인증 객체를 얻습니다.
		Authentication authentication = context.getAuthentication();
		// context에 있는 인증 정보를 getAuthentication()으로 갖고 온다.
		
		// 로그인 한 사용자 정보를 가진 객체를 얻습니다.
		UserDetails principal1 = (UserDetails)authentication.getPrincipal();
		// authentication에 있는 get Princinpal 객체애 유저 정보를 담는다.
		// 유저 객체는 UserDetails를 implement 함
		
		String member_id = principal1.getUsername();	// 사용자 이름
		System.out.println("username : " + member_id);
	    
		model.addAttribute("admindto", adminBiz.selectOne2(member_id));
	    /*  */

		model.addAttribute("qnadto", qnaBiz.selectOne(qnano));
		
		return "/qna/qnaone";
	}

	@RequestMapping(value = "/qnainsertform.do")
	public String insertForm(Model model, Principal principal) {
		logger.info("QnaController.insertForm");
		model.addAttribute(principal);
		// 시큐리티 컨텍스트 객체를 얻습니다.
		SecurityContext context = SecurityContextHolder.getContext();
		// 인증 객체를 얻습니다.
		Authentication authentication = context.getAuthentication();
		// context에 있는 인증 정보를 getAuthentication()으로 갖고 온다.
		// 로그인 한 사용자 정보를 가진 객체를 얻습니다.
		UserDetails principal1 = (UserDetails)authentication.getPrincipal();
		// authentication에 있는 get Princinpal 객체애 유저 정보를 담는다.
		// 유저 객체는 UserDetails를 implement 함
		String member_id = principal1.getUsername();	// 사용자 이름
		
		AdminDto dto =adminBiz.selectOne2(member_id);
		
		model.addAttribute("dto",dto);
		return "/qna/qnainsert";
	}

	@RequestMapping(value = "/qnainsertres.do")
	public String insertRes(Model model, QnaDto qnaDto) {
		logger.info("QnaController.insertForm");
		System.out.println(	qnaDto.getQnawriter());

		int res = qnaBiz.insert(qnaDto);
		
		if (res > 0) {
			logger.info("글 작성 성공");
			model.addAttribute("msg","글 작성 완료");
			model.addAttribute("url","/qna.do");
			return "redirect";
		} else {
			logger.info("msg","글 작성 실패");
			model.addAttribute("msg","글 작성 실패");
			model.addAttribute("url","/qnainsertform.do");
			return "redirect";	
		}
	}

	@RequestMapping(value = "/qnasetsecret.do")
	public String setSecret(Model model, QnaDto qnaDto) {
		
		logger.info("QnaController.insertForm");
		int res = qnaBiz.setsecret(qnaDto);
		
		if (res > 0) {
			return "redirect: qna.do";
		} else {
			return "qnaone.do?qnano=" + qnaDto.getQnano();	
		}
	}

	@RequestMapping(value = "/qnaupdateform.do")
	public String updateForm(Model model, int qnano) {
		
		logger.info("QnaController.updateForm");
		model.addAttribute("qnadto", qnaBiz.selectOne(qnano));
		
		return "/qna/qnaupdate";
	}

	@RequestMapping(value = "/qnaupdateres.do")
	public String updateRes(QnaDto qnaDto) {
		
		logger.info("QnaController.updateForm");
		int res = qnaBiz.update(qnaDto);
		
		if (res > 0) {
			return "redirect: qnaone.do?qnano=" + qnaDto.getQnano();
		} else {
			return "redirect: qnaupdate.do?qnano=" + qnaDto.getQnano();	
		}
	}

	@RequestMapping(value = "/qnaanswerform.do")
	public String answerForm(Model model, int qnano) {
		
		logger.info("QnaController.answerForm");
		model.addAttribute("qnadto", qnaBiz.selectOne(qnano));
		
		return "/qna/qnaanswer";
	}

	@RequestMapping(value = "/qnaanswerres.do")
	public String answerRes(QnaDto qnaDto) {
		
		logger.info("QnaController.answerForm");
		int res = qnaBiz.answer(qnaDto);
		
		if (res > 0) {
			return "redirect: qnaone.do?qnano=" + qnaDto.getQnano();
		} else {
			return "redirect: qnaanswer.do?qnano=" + qnaDto.getQnano();	
		}
	}

	@RequestMapping(value = "/qnadelete.do")
	public String delete(int qnano) {
		
		logger.info("QnaController.delete");
		int res = qnaBiz.delete(qnano);
		
		if (res > 0) {
			return "redirect: qna.do";
		} else {
			return "qnaone.do?qnano=" + qnano;	
		}
	}
}



