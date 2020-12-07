package com.kh.onsu.notice.model.biz;

import java.util.List;

import com.kh.onsu.notice.model.dto.NoticeDto;

public interface NoticeBiz {
	
	public List<NoticeDto> selectList();
	public NoticeDto selectOne(int notice_seq);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int notice_seq);
	
	public List<NoticeDto> Nsearch(String search);

}
