package com.kh.onsoo.live.model.dto;

public class LiveDto {


	private int live_no;
	private String live_id;
	
	public LiveDto() {
		//default constructor
	}
	
	public LiveDto(int live_no, String live_id) {
		super();
		this.live_no = live_no;
		this.live_id = live_id;
	}
	public int getLive_no() {
		return live_no;
	}
	public void setLive_no(int live_no) {
		this.live_no = live_no;
	}
	public String getLive_id() {
		return live_id;
	}
	public void setLive_id(String live_id) {
		this.live_id = live_id;
	}
	
	
	
}
