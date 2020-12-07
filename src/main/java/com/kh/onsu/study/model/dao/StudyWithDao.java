package com.kh.onsu.study.model.dao;

import java.util.List;

import com.kh.onsu.study.model.dto.StudyDto;
import com.kh.onsu.study.model.dto.StudyImageDto;

public interface StudyWithDao {

	String NAMESPACE_WITH = "studyWith.";
	
	public List<StudyDto> selectListTeacher();
	public List<StudyImageDto> selectList();
	public int selectNum();
	public StudyDto selectOne(int class_no);
	public int insert(StudyDto dto);
	public int update(StudyDto dto);
	public int delete(int class_no);
}
