package com.kh.onsoo.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.onsoo.admin.model.dto.AuthDto;

@Repository
public class AuthDaoImpl implements AuthDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

}
