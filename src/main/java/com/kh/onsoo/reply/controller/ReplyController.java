package com.kh.onsoo.reply.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.onsoo.member.model.jdbc.User;
import com.kh.onsoo.reply.biz.ReplyBiz;
import com.kh.onsoo.reply.dto.ReplyDto;


@Controller
public class ReplyController {
	
	private Logger logger = LoggerFactory.getLogger(ReplyController.class);
		
	@Autowired
	private ReplyBiz replybiz;

	
	@RequestMapping("/replylist.do") //댓글 리스트
    @ResponseBody
    private List<ReplyDto> mCommentServiceList(@RequestParam int reply_boardno) throws Exception{
		logger.info("댓글 리스트");
		
		
		return replybiz.replyList(reply_boardno);
    }
    
    @RequestMapping("/replyinsert.do") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int reply_boardno, @RequestParam String reply_title, HttpSession session) throws Exception{
    	logger.info("댓글 작성 ");
    	//User user_dto = (User) session.getAttribute("login");
    	
        ReplyDto replydto = new ReplyDto();
        
        //유저정보 dto이름
        replydto.setReply_id("jayoung");
        //replydto.setReply_id(user_dto.getMember_id());

        
        replydto.setReply_boardno(reply_boardno);
        replydto.setReply_title(reply_title);
    
        
        
        logger.info(">>"+replydto.getReply_boardno());
        logger.info(">>"+replydto.getReply_id());
        logger.info(">>"+replydto.getReply_no());
        logger.info(">>"+replydto.getReply_title());
        
        logger.info(">>"+reply_title);
        logger.info(">>"+reply_boardno);
        
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다.
        
        return replybiz.replyInsert(replydto);
    }
    
    @RequestMapping("/replyupdate.do") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int reply_no, @RequestParam String reply_title, Model model) throws Exception{
    	logger.info("댓글 수정  ");
    	
        ReplyDto replydto = new ReplyDto();
        replydto.setReply_no(reply_no);
        replydto.setReply_title(reply_title);
        System.out.println(replydto.getReply_title());
        
        model.addAttribute("dto", replybiz.replyUpdate(replydto));
        
        return replybiz.replyUpdate(replydto);
    }
    
    @RequestMapping("/replydelete.do") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@RequestParam int reply_no) throws Exception{
    	logger.info("댓글 삭제  ");
    	
        return replybiz.replyDelete(reply_no);
    }


}