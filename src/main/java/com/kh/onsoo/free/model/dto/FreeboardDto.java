package com.kh.onsoo.free.model.dto;

import java.util.Date;

public class FreeboardDto {
	
	
	private int free_no;
	private String free_title;
	private String free_writer;
	private String free_content;
	private Date free_date;
	
	public FreeboardDto() {
		//defqult constructor;
	}

	public FreeboardDto(int free_no, String free_title, String free_writer, String free_content, Date free_date) {
		super();
		this.free_no = free_no;
		this.free_title = free_title;
		this.free_writer = free_writer;
		this.free_content = free_content;
		this.free_date = free_date;
	}

	public int getFree_no() {
		return free_no;
	}

	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}

	public String getFree_title() {
		return free_title;
	}

	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}

	public String getFree_writer() {
		return free_writer;
	}

	public void setFree_writer(String free_writer) {
		this.free_writer = free_writer;
	}

	public String getFree_content() {
		return free_content;
	}

	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}

	public Date getFree_date() {
		return free_date;
	}

	public void setFree_date(Date free_date) {
		this.free_date = free_date;
	}

	

}
