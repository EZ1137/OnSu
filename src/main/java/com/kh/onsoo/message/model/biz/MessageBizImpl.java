package com.kh.onsoo.message.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.message.model.dao.MessageDao;
import com.kh.onsoo.message.model.dto.MessageDto;

@Service
public class MessageBizImpl implements MessageBiz {
	
	@Autowired
	private MessageDao msgDao;

	@Override
	public List<MessageDto> toList(String member_id) {
		return msgDao.toList(member_id);
	}

	@Override
	public List<MessageDto> fromList(String member_id) {
		return msgDao.fromList(member_id);
	}

	@Override
	public MessageDto selectOne(int msg_no) {
		return msgDao.selectOne(msg_no);
	}

	@Override
	public int sendMSG(MessageDto dto) {
		return msgDao.sendMSG(dto);
	}

	@Override
	public int deleteMSG(int msg_no) {
		return msgDao.deleteMSG(msg_no);
	}

}
