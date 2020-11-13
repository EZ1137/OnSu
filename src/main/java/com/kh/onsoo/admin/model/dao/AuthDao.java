package com.kh.onsoo.admin.model.dao;


public interface AuthDao {
	
	String NAMESPACE = "com.onsoo.admin.auth.";
	
	public int insert(String member_id);
	

	public int updateb(String member_id);
	

}
