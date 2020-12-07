package com.kh.onsu.reply.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.onsu.member.model.jdbc.User;
import com.kh.onsu.reply.model.biz.ReplyBiz;
import com.kh.onsu.reply.model.dto.ReplyDto;

@Controller
public class ReplyController {
	
	private Logger logger = LoggerFactory.getLogger(ReplyController.class);
		
	@Autowired
	private ReplyBiz replybiz;
	
	@RequestMapping("/replylist") //댓글 리스트
    @ResponseBody
    private List<ReplyDto> mCommentServiceList(@RequestParam int reply_boardno) throws Exception{
		logger.info("댓글 리스트");
		
		return replybiz.replyList(reply_boardno);
    }
    
	@RequestMapping("/replyinsert") //댓글 작성 
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam int reply_boardno, Principal principal, Model model, @RequestParam String reply_title, HttpSession session) throws Exception{
		logger.info("댓글 작성");
	       
	    model.addAttribute(principal);
	    //시큐리티 컨텍스트 객체를 얻습니다.
	    SecurityContext context = SecurityContextHolder.getContext();
	         
	    //인증객체를 얻습니다. 
	    Authentication authentication = context.getAuthentication();
	                                 // context에 있는 인증정보를 getAuthentication()으로 갖고온다.
	    //로그인한 사용자 정보를 가진 객체를 얻습니다.
	    UserDetails principal1 = (UserDetails)authentication.getPrincipal();
	                           //authentication에 있는  get Princinpal 객체애 유저정보를 담는다. 
	                           //유저객체는 UserDetails를 implement 함 
	         
	    String member_id = principal1.getUsername();  //사용자 이름 
	    logger.info("member_id : " + member_id);
	       
	    ReplyDto replydto = new ReplyDto();
	        
	    //유저정보 dto이름
	    replydto.setReply_id(member_id);
	    replydto.setReply_boardno(reply_boardno);
	    replydto.setReply_title(reply_title);
	        
	    logger.info("getReply_boardno : " + replydto.getReply_boardno());
	    logger.info("getReply_id : " + replydto.getReply_id());
	    logger.info("getReply_no : " + replydto.getReply_no());
	    logger.info("getReply_title : " + replydto.getReply_title());
	    logger.info("reply_title : " + reply_title);
	    logger.info("reply_boardno : " + reply_boardno);
	        
	    //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다.
		return replybiz.replyInsert(replydto);
	}
    
    @RequestMapping("/replyupdate") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int reply_no, @RequestParam String reply_title, Model model) throws Exception{
    	logger.info("댓글 수정");
    	
        ReplyDto replydto = new ReplyDto();
        replydto.setReply_no(reply_no);
        replydto.setReply_title(reply_title);
        logger.info("getReply_title : " + replydto.getReply_title());
        
        model.addAttribute("dto", replybiz.replyUpdate(replydto));
        
        return replybiz.replyUpdate(replydto);
    }
    
    @RequestMapping("/replydelete") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@RequestParam int reply_no) throws Exception{
    	logger.info("댓글 삭제");
    	
        return replybiz.replyDelete(reply_no);
    }
}