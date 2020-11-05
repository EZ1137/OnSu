package com.kh.onsoo.reply.biz;

import java.util.List;

import com.kh.onsoo.reply.dto.ReplyDto;

public interface ReplyBiz {

	public List<ReplyDto> replyList(int reply_boardno);
	public int replyInsert(ReplyDto replydto);
	public int replyUpdate(ReplyDto replydto);
	public int replyDelete(int reply_no);
	
}
