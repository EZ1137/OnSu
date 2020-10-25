package com.kh.onsoo.study.model.biz;

import java.util.List;

import com.kh.onsoo.study.model.dto.StudyDto;

public interface StudyBiz {

	public List<StudyDto> selectList();
	public StudyDto selectOne(int class_no);
	public int insert(StudyDto dto);
	public int update(StudyDto dto);
	public int delete(int class_no);
}
