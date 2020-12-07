package com.kh.onsu.message.model.dao;

import java.util.List;

import com.kh.onsu.message.model.dto.MessageDto;

public interface MessageDao {
	
	String NAMESPACE = "msg.";
	
	public List<MessageDto> toList(String member_id);
	public List<MessageDto> fromList(String member_id);
	public MessageDto selectOne(int msg_no);
	public int sendMSG(MessageDto dto);
	public int deleteMSG(int msg_no);
	
}
