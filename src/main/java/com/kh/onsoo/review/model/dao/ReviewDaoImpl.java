package com.kh.onsoo.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.review.model.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(ReviewDaoImpl.class);
	
	@Override
	public List<ReviewDto> selectList() {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			logger.info("[ERROR] selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ReviewDto selectOne(int review_no) {
		ReviewDto dto = new ReviewDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", review_no);
		} catch (Exception e) {
			logger.info("[ERROR] selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(ReviewDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(ReviewDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			logger.info("[ERROR] update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int review_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", review_no);
		} catch (Exception e) {
			logger.info("[ERROR] delete");
			e.printStackTrace();
		}
		return res;
	}

}
