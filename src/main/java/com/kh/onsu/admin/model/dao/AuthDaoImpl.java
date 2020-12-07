package com.kh.onsu.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDaoImpl implements AuthDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(AuthDaoImpl.class);	
	
	@Override
	public int insert(String member_id) {
		int res = 0;
		
		
		try {
			res = sqlSession.insert(NAMESPACE+"Authinsert",member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int updateb(String member_id) {
		int res= 0;
		
		try {
			res= sqlSession.update(NAMESPACE+"updateB",member_id);
		} catch (Exception e) {
			logger.info("권한 업데이트 ROLE_BLOCK");
			e.printStackTrace();
		}
		
		return res;
	}

}
