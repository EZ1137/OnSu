package com.kh.onsoo.message.model.biz;

import java.util.List;

import com.kh.onsoo.message.model.dto.MessageDto;
import com.kh.onsoo.review.model.dto.ReviewDto;

public interface MessageBiz {
	
	public List<MessageDto> toList(String member_id);
	public List<MessageDto> fromList(String member_id);
	public MessageDto selectOne(int msg_no);
	public int sendMSG(MessageDto dto);
	public int deleteMSG(int msg_no);

}
