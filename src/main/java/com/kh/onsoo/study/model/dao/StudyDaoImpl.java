package com.kh.onsoo.study.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.onsoo.study.model.dto.StudyDto;

@Repository
public class StudyDaoImpl implements StudyDao {

	@Override
	public List<StudyDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyDto selectOne(int class_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(StudyDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(StudyDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int class_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
