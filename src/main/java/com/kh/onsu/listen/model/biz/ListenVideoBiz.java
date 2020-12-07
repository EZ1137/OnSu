package com.kh.onsu.listen.model.biz;

import java.util.List;

import com.kh.onsu.listen.model.dto.ListenVideoDto;

public interface ListenVideoBiz {
	
	public List<ListenVideoDto> selectList(String member_id);
	public ListenVideoDto selectOne(int listen_vclassno);
	public int insert(ListenVideoDto dto);
	public int update(ListenVideoDto dto);
	public int delete(int listen_vclassno);

}
