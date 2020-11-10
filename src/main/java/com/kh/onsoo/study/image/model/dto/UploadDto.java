package com.kh.onsoo.study.image.model.dto;

public class UploadDto {

	private int image_no;
	private String image_directory;
	private int class_no;
	
	public UploadDto() {
		
	}

	public UploadDto(int image_no, String image_directory, int class_no) {
		super();
		this.image_no = image_no;
		this.image_directory = image_directory;
		this.class_no = class_no;
	}

	public int getImage_no() {
		return image_no;
	}

	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}

	public String getImage_directory() {
		return image_directory;
	}

	public void setImage_directory(String image_directory) {
		this.image_directory = image_directory;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	
}
