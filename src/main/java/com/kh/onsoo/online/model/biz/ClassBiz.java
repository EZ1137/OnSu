package com.kh.onsoo.online.model.biz;

import java.util.List;

import com.kh.onsoo.online.model.dto.ClassDto;

public interface ClassBiz {
	
	public List<ClassDto> search(String search);
	public ClassDto selectOne(int class_no);

}
