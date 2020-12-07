package com.kh.onsu.admin.model.dto;

import java.util.Date;

public class AdminDto {
	

	private int seq;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_gender;
	private String member_phone;
	private String member_email;
	private String member_addr;
	private String member_birth;
	private String member_role;
	private Date member_regdate;
	private Date member_ddate;
	private Date member_bdate;
	private String member_document;
	private int enabled;
	
	public AdminDto() {
		
	}
	
	public AdminDto(int seq, String member_id, String member_pw, String member_name, String member_gender,
			String member_phone, String member_email, String member_addr, String member_birth, String member_role,
			Date member_regdate, Date member_ddate, Date member_bdate, String member_document, int enabled) {
		super();
		this.seq = seq;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_addr = member_addr;
		this.member_birth = member_birth;
		this.member_role = member_role;
		this.member_regdate = member_regdate;
		this.member_ddate = member_ddate;
		this.member_bdate = member_bdate;
		this.member_document = member_document;
		this.enabled = enabled;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	public Date getMember_ddate() {
		return member_ddate;
	}
	public void setMember_ddate(Date member_ddate) {
		this.member_ddate = member_ddate;
	}
	public Date getMember_bdate() {
		return member_bdate;
	}
	public void setMember_bdate(Date member_bdate) {
		this.member_bdate = member_bdate;
	}
	public String getMember_document() {
		return member_document;
	}
	public void setMember_document(String member_document) {
		this.member_document = member_document;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	
}
