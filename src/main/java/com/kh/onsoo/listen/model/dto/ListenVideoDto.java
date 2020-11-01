package com.kh.onsoo.listen.model.dto;

import java.util.Date;

public class ListenVideoDto {
	
	private int listen_vno;
	private String listen_vmemberid;
	private int listen_vclassno;
	private Date listen_vdate;
	private String listen_vclasstitle;
	
	public ListenVideoDto() {}
	
	public ListenVideoDto(int listen_vno, String listen_vmemberid, int listen_vclassno,
			Date listen_vdate, String listen_vclasstitle) {
		this.listen_vno = listen_vno;
		this.listen_vmemberid = listen_vmemberid;
		this.listen_vclassno = listen_vclassno;
		this.listen_vdate = listen_vdate;
		this.listen_vclasstitle = listen_vclasstitle;
	}

	public int getListen_vno() {
		return listen_vno;
	}

	public void setListen_vno(int listen_vno) {
		this.listen_vno = listen_vno;
	}

	public String getListen_vmemberid() {
		return listen_vmemberid;
	}

	public void setListen_vmemberid(String listen_vmemberid) {
		this.listen_vmemberid = listen_vmemberid;
	}

	public int getListen_vclassno() {
		return listen_vclassno;
	}

	public void setListen_vclassno(int listen_vclassno) {
		this.listen_vclassno = listen_vclassno;
	}

	public Date getListen_vdate() {
		return listen_vdate;
	}

	public void setListen_vdate(Date listen_vdate) {
		this.listen_vdate = listen_vdate;
	}
	
	public String getListen_vclasstitle() {
		return listen_vclasstitle;
	}

	public void setListen_vclasstitle(String listen_vclasstitle) {
		this.listen_vclasstitle = listen_vclasstitle;
	}

}
