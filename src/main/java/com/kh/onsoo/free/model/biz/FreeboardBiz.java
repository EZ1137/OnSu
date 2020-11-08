package com.kh.onsoo.free.model.biz;

import java.util.List;

import com.kh.onsoo.free.model.dto.FreeboardDto;
import com.kh.onsoo.utils.PagingVO;

public interface FreeboardBiz {
	
	public List<FreeboardDto> selectList();
	public FreeboardDto selectOne(int free_no);
	public int insert(FreeboardDto dto);
	public int update(FreeboardDto dto);
	public int delete(int free_no);
	
	//게시물 총 갯수
	public int countBoard();
	//페이징 처리 게시글 조회
	public List<FreeboardDto>selectBoard(PagingVO vo);
}
