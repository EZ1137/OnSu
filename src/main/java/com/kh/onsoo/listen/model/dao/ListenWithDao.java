package com.kh.onsoo.listen.model.dao;

import java.util.List;

import com.kh.onsoo.listen.model.dto.ListenWithDto;

public interface ListenWithDao {
	
	String NAMESPACE="listenWith.";
	
	public List<ListenWithDto> selectList(String member_id);
	public ListenWithDto selectOne(int listen_wclassno);
	public int insert(ListenWithDto dto);
	public int update(ListenWithDto dto);
	public int delete(int listen_wclassno);
	
}
