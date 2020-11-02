package com.kh.onsoo.listen.model.biz;

import java.util.List;

import com.kh.onsoo.listen.model.dto.ListenVideoDto;

public interface ListenVideoBiz {
	
	public List<ListenVideoDto> selectList();
	public ListenVideoDto selectOne(int listen_vno);
	public int insert(ListenVideoDto dto);
	public int update(ListenVideoDto dto);
	public int delete(int listen_vno);

}
