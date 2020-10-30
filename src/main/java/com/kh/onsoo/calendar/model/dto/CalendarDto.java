package com.kh.onsoo.calendar.model.dto;

import java.util.Date;

public class CalendarDto {
	
	private int calendar_no;
	private String calendar_title;
	private String calendar_content;
	private String calendar_mdate;
	private Date calendar_regdate;
	private String member_id;
	
	public CalendarDto() {}
	
	public CalendarDto(int calendar_no, String calendar_title, String calendar_content, String calendar_mdate,
			Date calendar_regdate, String member_id) {
		super();
		this.calendar_no = calendar_no;
		this.calendar_title = calendar_title;
		this.calendar_content = calendar_content;
		this.calendar_mdate = calendar_mdate;
		this.calendar_regdate = calendar_regdate;
		this.member_id = member_id;
	}
	
	public CalendarDto(String calendar_title, String calendar_content, String calendar_mdate) {
		this.calendar_title = calendar_title;
		this.calendar_content = calendar_content;
		this.calendar_mdate = calendar_mdate;
	}

	public int getCalendar_no() {
		return calendar_no;
	}

	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public String getCalendar_content() {
		return calendar_content;
	}

	public void setCalendar_content(String calendar_content) {
		this.calendar_content = calendar_content;
	}

	public String getCalendar_mdate() {
		return calendar_mdate;
	}

	public void setCalendar_mdate(String calendar_mdate) {
		this.calendar_mdate = calendar_mdate;
	}

	public Date getCalendar_regdate() {
		return calendar_regdate;
	}

	public void setCalendar_regdate(Date calendar_regdate) {
		this.calendar_regdate = calendar_regdate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
