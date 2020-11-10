package com.kh.onsoo.review.model.dto;

import java.util.Date;

public class ReviewDto {
	
	private int review_no;
	private String review_id;
	private String review_content;
	private int review_classno;
	private int review_star;
	private Date review_date;
	private Date review_update;
	
	
	public ReviewDto() {}
	
	public ReviewDto(int review_no, String review_id, String review_content, int review_classno, int review_star,
			Date review_date, Date review_update) {
		super();
		this.review_no = review_no;
		this.review_id = review_id;
		this.review_content = review_content;
		this.review_classno = review_classno;
		this.review_star = review_star;
		this.review_date = review_date;
		this.review_update = review_update;
	}
	
	public ReviewDto(String review_id, String review_content, int review_classno, int review_star) {
		this.review_id = review_id;
		this.review_content = review_content;
		this.review_classno = review_classno;
		this.review_star = review_star;
	}
	

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_classno() {
		return review_classno;
	}

	public void setReview_classno(int review_classno) {
		this.review_classno = review_classno;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	
	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	public Date getReview_update() {
		return review_update;
	}

	public void setReview_update(Date review_update) {
		this.review_update = review_update;
	}

}
