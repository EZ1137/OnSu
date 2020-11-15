package com.kh.onsoo.pay.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.pay.model.dto.PayDto;

@Repository
public class PayDaoImpl implements PayDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(PayDaoImpl.class);

	@Override
	public PayDto selectPay(String pay_memberid, int pay_classno) {
		PayDto dto = new PayDto();
		
		String c_no = Integer.toString(pay_classno);
		
		Map<String, String> map = new HashMap<>();
		map.put("pay_memberid", pay_memberid);
		map.put("pay_classno", c_no);
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectPay", map);
		} catch (Exception e) {
			logger.info("[ERROR] selectPay");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int insert(PayDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] insert");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int delete(PayDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", dto);
		} catch (Exception e) {
			logger.info("[ERROR] delete");
			e.printStackTrace();
		}
		
		return res;
	}

}
