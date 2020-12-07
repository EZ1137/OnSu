package com.kh.onsu.study.image.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onsu.study.image.model.dto.UploadDto;

@Repository
public class UploadDaoImpl implements UploadDao {

	private Logger logger = LoggerFactory.getLogger(UploadDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<UploadDto> selectList(int class_no) {
		
		List<UploadDto> list = new ArrayList<UploadDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", class_no);
		} catch (Exception e) {
			logger.info("[ERROR image selectList]");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public UploadDto selectOne(int class_no) {
		
		UploadDto uploadDto = null;
		
		try {
			uploadDto = sqlSession.selectOne(NAMESPACE + "thumbnail", class_no);
		} catch (Exception e) {
			logger.info("[ERROR image selectOne]");
			e.printStackTrace();
		}
		return uploadDto;
	}

	@Override
	public int insertList(List<UploadDto> list) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", list);
		} catch (Exception e) {
			logger.info("[ERROR insert_Image]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int image_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", image_no);
		} catch (Exception e) {
			logger.info("[ERROR DELETE IMAGE]");
			e.printStackTrace();
		}
		
		return res;
	}

}
