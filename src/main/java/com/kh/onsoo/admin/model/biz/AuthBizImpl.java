package com.kh.onsoo.admin.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.admin.model.dao.AuthDao;
import com.kh.onsoo.admin.model.dto.AuthDto;

@Service
public class AuthBizImpl implements AuthBiz {

	@Autowired
	private AuthDao authDao;
	
	
	@Override
	public int insert(String member_id) {
		return authDao.insert(member_id);
	}

}
