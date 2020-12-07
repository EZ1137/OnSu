package com.kh.onsu.review.model.biz;

import java.util.List;

import com.kh.onsu.review.model.dto.ReviewDto;

public interface ReviewBiz {
	
	public List<ReviewDto> selectList(int review_classno);
	public ReviewDto selectReview(String review_id, int review_classno);
	public ReviewDto selectOne(int review_no);
	public int insert(ReviewDto dto);
	public int update(ReviewDto dto);
	public int delete (int review_no);

}
