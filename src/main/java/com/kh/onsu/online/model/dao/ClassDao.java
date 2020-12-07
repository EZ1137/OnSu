package com.kh.onsu.online.model.dao;

import java.util.List;

import com.kh.onsu.online.model.dto.ClassDto;

public interface ClassDao {
	
	String NAMESPACE = "class.";
	
	public List<ClassDto> search(String search);
	public ClassDto selectOne(int class_no);

}
