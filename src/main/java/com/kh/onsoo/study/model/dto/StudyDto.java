package com.kh.onsoo.study.model.dto;

public class StudyDto {

	private int class_no;
	private String class_title;
	private String class_teacherid;
	private String class_teachername;
	private String class_type;
	private String class_bigcategory;
	private String class_smallcategory;
	private String class_info;
	private int class_price;
	
	public StudyDto() {
		
	}

	public StudyDto(int class_no, String class_title, String class_teacherid, String class_teachername,
			String class_type, String class_bigcategory, String class_smallcategory, String class_info,
			int class_price) {
		super();
		this.class_no = class_no;
		this.class_title = class_title;
		this.class_teacherid = class_teacherid;
		this.class_teachername = class_teachername;
		this.class_type = class_type;
		this.class_bigcategory = class_bigcategory;
		this.class_smallcategory = class_smallcategory;
		this.class_info = class_info;
		this.class_price = class_price;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	public String getClass_teacherid() {
		return class_teacherid;
	}

	public void setClass_teacherid(String class_teacherid) {
		this.class_teacherid = class_teacherid;
	}

	public String getClass_teachername() {
		return class_teachername;
	}

	public void setClass_teachername(String class_teachername) {
		this.class_teachername = class_teachername;
	}

	public String getClass_type() {
		return class_type;
	}

	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}

	public String getClass_bigcategory() {
		return class_bigcategory;
	}

	public void setClass_bigcategory(String class_bigcategory) {
		this.class_bigcategory = class_bigcategory;
	}

	public String getClass_smallcategory() {
		return class_smallcategory;
	}

	public void setClass_smallcategory(String class_smallcategory) {
		this.class_smallcategory = class_smallcategory;
	}

	public String getClass_info() {
		return class_info;
	}

	public void setClass_info(String class_info) {
		this.class_info = class_info;
	}

	public int getClass_price() {
		return class_price;
	}

	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	
	
}
