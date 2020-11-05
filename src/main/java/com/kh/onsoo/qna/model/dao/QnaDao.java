package com.kh.onsoo.qna.model.dao;

import java.util.List;

import com.kh.onsoo.qna.model.dto.QnaDto;

public interface QnaDao {
	
	String NAMESPACE = "qna.";
	
	public List<QnaDto> selectList();

	public QnaDto selectOne(int qnano);

	public int insert(QnaDto qnaDto);

	public int setsecret(QnaDto qnaDto);

	public int update(QnaDto qnaDto);
	
	public int answer(QnaDto qnaDto);

	public int delete(int qnano);

}
