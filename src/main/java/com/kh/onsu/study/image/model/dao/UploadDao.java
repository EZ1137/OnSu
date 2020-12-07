package com.kh.onsu.study.image.model.dao;

import java.util.List;

import com.kh.onsu.study.image.model.dto.UploadDto;

public interface UploadDao {

	String NAMESPACE = "com.onsu.study.upload.";
	
	public List<UploadDto> selectList(int class_no);
	public UploadDto selectOne(int class_no);
	public int insertList(List<UploadDto> list);
	public int delete(int image_no);
}
