package com.kh.onsoo.admin.model.dto;

import java.sql.Date;

public class AdminDto {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_gender;
	private String member_email;
	private String member_addr;
	private String member_phone;
	private String member_birth;
	private String member_role;
	private Date member_deletedate;
	private Date member_blockdate;
	
	public AdminDto() {
		
	}

	public AdminDto(int member_no, String member_id, String member_pw, String member_name, String member_gender,
			String member_email, String member_addr, String member_phone, String member_birth, String member_role,
			Date member_deletedate, Date member_blockdate) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_email = member_email;
		this.member_addr = member_addr;
		this.member_phone = member_phone;
		this.member_birth = member_birth;
		this.member_role = member_role;
		this.member_deletedate = member_deletedate;
		this.member_blockdate = member_blockdate;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
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

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
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

	public Date getMember_deletedate() {
		return member_deletedate;
	}

	public void setMember_deletedate(Date member_deletedate) {
		this.member_deletedate = member_deletedate;
	}

	public Date getMember_blockdate() {
		return member_blockdate;
	}

	public void setMember_blockdate(Date member_blockdate) {
		this.member_blockdate = member_blockdate;
	}

}
