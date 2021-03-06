package com.kh.onsu.qna.model.biz;

import java.util.List;

import com.kh.onsu.qna.model.dto.QnaDto;

public interface QnaBiz {
	
	public List<QnaDto> selectList();

	public QnaDto selectOne(int qnano);

	public int insert(QnaDto qnaDto);

	public int setsecret(QnaDto qnaDto);

	public int update(QnaDto qnaDto);
	
	public int answer(QnaDto qnaDto);

	public int delete(int qnano);

}
