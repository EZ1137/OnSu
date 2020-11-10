package com.kh.onsoo.study.image.model.biz;

import java.util.List;

import com.kh.onsoo.study.image.model.dto.UploadDto;

public interface UploadBiz {

	public List<UploadDto> selectList(int class_no);
	public UploadDto selectOne(int class_no);
	public int insertList(List<UploadDto> list);
	public int delete(int image_no);
}
