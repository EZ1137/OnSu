package com.kh.onsu.admin.model.biz;

import org.springframework.stereotype.Service;

import com.kh.onsu.admin.model.dto.AuthDto;

@Service
public interface AuthBiz {
	public int insert(String member_id);

	public int updateb(String member_id);

}
