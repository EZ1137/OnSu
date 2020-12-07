package com.kh.onsu.listen.model.dto;

import java.util.Date;
import com.kh.onsu.online.model.dto.ClassDto;

public class ListenWithDto {
	
	private int listen_wno;
	private String listen_wmemberid;
	private int listen_wclassno;
	private int listen_wcount;
	private String listen_wclasstitle;
	
	public ListenWithDto() {}
	
	public ListenWithDto(int listen_wno, String listen_wmemberid, int listen_wclassno,
			int listen_wcount, String listen_wclasstitle) {
		this.listen_wno = listen_wno;
		this.listen_wmemberid = listen_wmemberid;
		this.listen_wclassno = listen_wclassno;
		this.listen_wcount = listen_wcount;
		this.listen_wclasstitle = listen_wclasstitle;
	}

	public int getListen_wno() {
		return listen_wno;
	}

	public void setListen_wno(int listen_wno) {
		this.listen_wno = listen_wno;
	}

	public String getListen_wmemberid() {
		return listen_wmemberid;
	}

	public void setListen_wmemberid(String listen_wmemberid) {
		this.listen_wmemberid = listen_wmemberid;
	}

	public int getListen_wclassno() {
		return listen_wclassno;
	}

	public void setListen_wclassno(int listen_wclassno) {
		this.listen_wclassno = listen_wclassno;
	}

	public int getListen_wcount() {
		return listen_wcount;
	}

	public void setListen_wcount(int listen_wcount) {
		this.listen_wcount = listen_wcount;
	}
	
	public String getListen_wclasstitle() {
		return listen_wclasstitle;
	}

	public void setListen_wclasstitle(String listen_wclasstitle) {
		this.listen_wclasstitle = listen_wclasstitle;
	}
}
