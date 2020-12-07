package com.kh.onsu.notice.model.dao;

import java.util.List;

import com.kh.onsu.notice.model.dto.NoticeDto;

public interface NoticeDao {
	
	String NAMESPACE="notice.";
	
	public List<NoticeDto> selectList();
	public NoticeDto selectOne(int notice_no);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int notice_no);
	
	
	public List<NoticeDto> Nsearch(String search);
}
