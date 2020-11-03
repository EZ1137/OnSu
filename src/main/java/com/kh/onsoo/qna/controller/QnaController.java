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
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onsoo.admin.model.biz.AdminBiz;
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
	public String selectList(Model model, Principal princopal) {
		
		logger.info("QnaController.selectList");
		model.addAttribute("qna", qnaBiz.selectList());
		//
		model.addAttribute(princopal);
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
	      System.out.println("username : " + username);
	    //
		
		return "qnalist";
	}

	@RequestMapping(value = "/qnaone.do")
	public String selectOne(Model model, @RequestParam("qnano") int qnano) {
		
		logger.info("QnaController.selectOne");
		model.addAttribute("qnadto", qnaBiz.selectOne(qnano));
		
		return "qnaone";
	}

	@RequestMapping(value = "/qnainsertform.do")
	public String insertForm() {
		
		logger.info("QnaController.insertForm");
		
		return "qnainsert";
	}

	@RequestMapping(value = "/qnainsertres.do")
	public String insertRes(Model model, QnaDto qnaDto) {
		
		logger.info("QnaController.insertForm");
		int res = qnaBiz.insert(qnaDto);
		
		if (res > 0) {
			return "qna.do";
		} else {
			return "qnainsertform.do";	
		}
	}

	@RequestMapping(value = "/qnaupdateform.do")
	public String updateForm(Model model, int qnano) {
		
		logger.info("QnaController.updateForm");
		model.addAttribute("qnadto", qnaBiz.selectOne(qnano));
		
		return "qnaupdate";
	}

	@RequestMapping(value = "/qnaupdateres.do")
	public String updateRes(QnaDto qnaDto) {
		
		logger.info("QnaController.updateForm");
		int res = qnaBiz.update(qnaDto);
		
		if (res > 0) {
			return "qnaone.do?qnano=" + qnaDto.getQnano();
		} else {
			return "qnaupdate.do?qnano=" + qnaDto.getQnano();	
		}
	}

	@RequestMapping(value = "/qnaanswerform.do")
	public String answerForm(Model model, int qnano) {
		
		logger.info("QnaController.answerForm");
		model.addAttribute("qnadto", qnaBiz.selectOne(qnano));
		
		return "qnaanswer";
	}

	@RequestMapping(value = "/qnaanswerres.do")
	public String answerRes(QnaDto qnaDto) {
		
		logger.info("QnaController.answerForm");
		int res = qnaBiz.update(qnaDto);
		
		if (res > 0) {
			return "qnaone.do?qnano=" + qnaDto.getQnano();
		} else {
			return "qnaanswer.do?qnano=" + qnaDto.getQnano();	
		}
	}

	@RequestMapping(value = "/qnadelete.do")
	public String delete(int qnano) {
		
		logger.info("QnaController.delete");
		int res = qnaBiz.delete(qnano);
		
		if (res > 0) {
			return "qna.do";
		} else {
			return "qnaone.do?qnano=" + qnano;	
		}
	}
}



