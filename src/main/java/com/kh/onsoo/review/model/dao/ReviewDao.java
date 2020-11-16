package com.kh.onsoo.review.model.dao;

import java.util.List;

import com.kh.onsoo.review.model.dto.ReviewDto;

public interface ReviewDao {
	
	String NAMESPACE="review.";
	
	public List<ReviewDto> selectList(int review_classno);
	public ReviewDto selectReview(String review_id, int review_classno);
	public ReviewDto selectOne(int review_no);
	public int insert(ReviewDto dto);
	public int update(ReviewDto dto);
	public int delete (int review_no);

}
