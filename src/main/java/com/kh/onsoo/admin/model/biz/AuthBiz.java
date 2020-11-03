package com.kh.onsoo.admin.model.biz;

import org.springframework.stereotype.Service;

import com.kh.onsoo.admin.model.dto.AuthDto;

@Service
public interface AuthBiz {
	public int insert(String member_id);

}
