package com.kh.onsu.reply.model.dto;

import java.util.Date;

public class ReplyDto {
	
	private int reply_no;
	private String reply_id;
	private int reply_boardno;
	private String reply_title;
	private Date reply_regdate;
	
	
	public ReplyDto() {
		//default constructor;
	}

	public ReplyDto(int reply_no, String reply_id, int reply_boardno, String reply_title, Date reply_regdate) {
		super();
		this.reply_no = reply_no;
		this.reply_id = reply_id;
		this.reply_boardno = reply_boardno;
		this.reply_title = reply_title;
		this.reply_regdate = reply_regdate;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_id() {
		return reply_id;
	}

	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}

	public int getReply_boardno() {
		return reply_boardno;
	}

	public void setReply_boardno(int reply_boardno) {
		this.reply_boardno = reply_boardno;
	}

	public String getReply_title() {
		return reply_title;
	}

	public void setReply_title(String reply_title) {
		this.reply_title = reply_title;
	}

	public Date getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}


	
	
}
