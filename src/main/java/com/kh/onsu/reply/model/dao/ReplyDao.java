package com.kh.onsu.reply.model.dao;

import java.util.List;

import com.kh.onsu.reply.model.dto.ReplyDto;

public interface ReplyDao {
	
	String NAMESPACE = "reply.";
	
	public List<ReplyDto> replyList(int reply_boardno);
	public int replyInsert(ReplyDto replydto);
	public int replyUpdate(ReplyDto replydto);
	public int replyDelete(int replyno);
	
	
}
