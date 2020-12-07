package com.kh.onsu.review.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsu.review.model.dao.ReviewDao;
import com.kh.onsu.review.model.dto.ReviewDto;

@Service
public class ReviewBizImpl implements ReviewBiz {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<ReviewDto> selectList(int review_classno) {
		return reviewDao.selectList(review_classno);
	}
	
	@Override
	public ReviewDto selectReview(String review_id, int review_classno) {
		return reviewDao.selectReview(review_id, review_classno);
	}

	@Override
	public ReviewDto selectOne(int review_no) {
		return reviewDao.selectOne(review_no);
	}

	@Override
	public int insert(ReviewDto dto) {
		return reviewDao.insert(dto);
	}

	@Override
	public int update(ReviewDto dto) {
		return reviewDao.update(dto);
	}

	@Override
	public int delete(int review_no) {
		return reviewDao.delete(review_no);
	}

}
