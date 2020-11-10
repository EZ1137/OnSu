package com.kh.onsoo.study.image.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.kh.onsoo.study.image.model.dao.UploadDao;
import com.kh.onsoo.study.image.model.dto.UploadDto;

@Service
public class UploadBizImpl implements UploadBiz {

	@Autowired
	private UploadDao uploadDao;
	
	@Override
	public List<UploadDto> selectList(int class_no) {
		return uploadDao.selectList(class_no);
	}

	@Override
	public UploadDto selectOne(int class_no) {
		return uploadDao.selectOne(class_no);
	}

	@Override
	public int delete(int image_no) {
		return uploadDao.delete(image_no);
	}
	
	@Override
	public int insertList(List<UploadDto> list) {
		return uploadDao.insertList(list);
	}

}
