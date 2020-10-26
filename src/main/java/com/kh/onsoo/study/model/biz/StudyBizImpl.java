package com.kh.onsoo.study.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.study.model.dao.StudyDao;
import com.kh.onsoo.study.model.dto.StudyDto;

@Service
public class StudyBizImpl implements StudyBiz {

	@Autowired
	private StudyDao studyDao;
	
	@Override
	public List<StudyDto> selectList() {
		return studyDao.selectList();
	}

	@Override
	public StudyDto selectOne(int class_no) {
		return studyDao.selectOne(class_no);
	}

	@Override
	public int insert(StudyDto dto) {
		return studyDao.insert(dto);
	}

	@Override
	public int update(StudyDto dto) {
		return studyDao.update(dto);
	}

	@Override
	public int delete(int class_no) {
		return studyDao.delete(class_no);
	}

}
