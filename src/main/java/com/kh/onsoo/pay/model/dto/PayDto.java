package com.kh.onsoo.pay.model.dto;

import java.util.Date;

import com.kh.onsoo.admin.model.dto.AdminDto;
import com.kh.onsoo.online.model.dto.ClassDto;

public class PayDto {
	
	private int pay_no;
	private String pay_memberid;
	private int pay_classno;
	private Date pay_date;
	private AdminDto AdminDto;
	private ClassDto ClassDto;
	
	public PayDto() {}
	
	public PayDto(int pay_no, String pay_memberid, int pay_classno, Date pay_date) {
		this.pay_no = pay_no;
		this.pay_memberid = pay_memberid;
		this.pay_classno = pay_classno;
		this.pay_date = pay_date;
	}
	
	public PayDto(int pay_no, String pay_memberid, int pay_classno, Date pay_date,
			com.kh.onsoo.admin.model.dto.AdminDto adminDto, com.kh.onsoo.online.model.dto.ClassDto classDto) {
		super();
		this.pay_no = pay_no;
		this.pay_memberid = pay_memberid;
		this.pay_classno = pay_classno;
		this.pay_date = pay_date;
		AdminDto = adminDto;
		ClassDto = classDto;
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_memberid() {
		return pay_memberid;
	}

	public void setPay_memberid(String pay_memberid) {
		this.pay_memberid = pay_memberid;
	}

	public int getPay_classno() {
		return pay_classno;
	}

	public void setPay_classno(int pay_classno) {
		this.pay_classno = pay_classno;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public AdminDto getAdminDto() {
		return AdminDto;
	}

	public void setAdminDto(AdminDto adminDto) {
		AdminDto = adminDto;
	}

	public ClassDto getClassDto() {
		return ClassDto;
	}

	public void setClassDto(ClassDto classDto) {
		ClassDto = classDto;
	}
	
}
