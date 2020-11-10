package com.kh.onsoo.study.model.biz;

import java.util.List;

import com.kh.onsoo.study.model.dto.StudyDto;
import com.kh.onsoo.study.model.dto.StudyImageDto;

public interface StudyWithBiz {

	public List<StudyDto> selectListTeacher();
	public List<StudyImageDto> selectList();
	public int selectNum();
	public StudyDto selectOne(int class_no);
	public int insert(StudyDto dto);
	public int update(StudyDto dto);
	public int delete(int class_no);
}
