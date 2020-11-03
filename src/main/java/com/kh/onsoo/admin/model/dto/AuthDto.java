package com.kh.onsoo.admin.model.dto;

public class AuthDto {
	private String member_id;
	private String author;
	
	public AuthDto() {
		
	}
	
	
	
	public AuthDto(String member_id, String author) {
		super();
		this.member_id = member_id;
		this.author = author;
	}
	
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

}
