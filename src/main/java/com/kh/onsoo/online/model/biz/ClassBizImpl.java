package com.kh.onsoo.online.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.online.model.dao.ClassDao;
import com.kh.onsoo.online.model.dto.ClassDto;

@Service
public class ClassBizImpl implements ClassBiz {
	
	@Autowired
	private ClassDao classDao;

	@Override
	public List<ClassDto> search(String search) {
		return classDao.search(search);
	}

}
