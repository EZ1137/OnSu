package com.kh.onsoo.message.model.dto;

import java.util.Date;

public class MessageDto {
	
	private int msg_no;
	private String msg_fromid;
	private String msg_toid;
	private String msg_content;
	private String msg_read;
	private Date msg_date;
	
	public MessageDto() {}

	public MessageDto(int msg_no, String msg_fromid, String msg_toid, String msg_content, String msg_read,
			Date msg_date) {
		super();
		this.msg_no = msg_no;
		this.msg_fromid = msg_fromid;
		this.msg_toid = msg_toid;
		this.msg_content = msg_content;
		this.msg_read = msg_read;
		this.msg_date = msg_date;
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getMsg_fromid() {
		return msg_fromid;
	}

	public void setMsg_fromid(String msg_fromid) {
		this.msg_fromid = msg_fromid;
	}

	public String getMsg_toid() {
		return msg_toid;
	}

	public void setMsg_toid(String msg_toid) {
		this.msg_toid = msg_toid;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_read() {
		return msg_read;
	}

	public void setMsg_read(String msg_read) {
		this.msg_read = msg_read;
	}

	public Date getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}

}
