package com.kh.onsu.online.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsu.online.model.dao.ClassDao;
import com.kh.onsu.online.model.dto.ClassDto;

@Service
public class ClassBizImpl implements ClassBiz {
	
	@Autowired
	private ClassDao classDao;

	@Override
	public List<ClassDto> search(String search) {
		return classDao.search(search);
	}
	
	public ClassDto selectOne(int class_no) {
		return classDao.selectOne(class_no);
	}

}
