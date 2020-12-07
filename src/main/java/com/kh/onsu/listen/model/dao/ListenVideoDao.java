package com.kh.onsu.listen.model.dao;

import java.util.List;

import com.kh.onsu.listen.model.dto.ListenVideoDto;

public interface ListenVideoDao {
	
	String NAMESPACE="listenVideo.";
	
	public List<ListenVideoDto> selectList(String member_id);
	public ListenVideoDto selectOne(int listen_vclassno);
	public int insert(ListenVideoDto dto);
	public int update(ListenVideoDto dto);
	public int delete(int listen_vclassno);
	
}
