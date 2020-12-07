package com.kh.onsu.reply.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsu.reply.model.dao.ReplyDao;
import com.kh.onsu.reply.model.dto.ReplyDto;

@Service
public class ReplyBizImpl implements ReplyBiz {

	@Autowired
	private ReplyDao replydao;

	@Override
	public List<ReplyDto> replyList(int reply_boardno) {
		
		return replydao.replyList(reply_boardno);
	}

	@Override
	public int replyInsert(ReplyDto replydto) {
		
		return replydao.replyInsert(replydto);
	}

	@Override
	public int replyUpdate(ReplyDto replydto) {
		
		return replydao.replyUpdate(replydto);
	}

	@Override
	public int replyDelete(int reply_no) {
	
		return replydao.replyDelete(reply_no);
	}
	

	





}
