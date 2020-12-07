package com.kh.onsu.admin.model.dao;


public interface AuthDao {
	
	String NAMESPACE = "auth.";
	
	public int insert(String member_id);
	

	public int updateb(String member_id);
	

}
