package com.kh.onsoo.message.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.message.model.dto.MessageDto;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(MessageDaoImpl.class);
	
	@Override
	public List<MessageDto> toList(String member_id) {
		List<MessageDto> list = new ArrayList<MessageDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"toList", member_id);
		} catch (Exception e) {
			logger.info("[ERROR] toList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MessageDto> fromList(String member_id) {
		List<MessageDto> list = new ArrayList<MessageDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"fromList", member_id);
		} catch (Exception e) {
			logger.info("[ERROR] fromList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MessageDto selectOne(int msg_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sendMSG(MessageDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"sendMSG", dto);
		} catch (Exception e) {
			logger.info("[ERROR] sendMSG");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteMSG(int msg_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
