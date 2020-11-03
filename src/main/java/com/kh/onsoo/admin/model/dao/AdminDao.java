package com.kh.onsoo.admin.model.dao;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminDto;

public interface AdminDao {
	
	String NAMESPACE = "com.onsoo.admin.memberboard.";
	
	public List<AdminDto> selectList();
	public AdminDto selectOne(int member_no);
	public int insert (AdminDto dto);
	public int update (AdminDto dto);
	public int delete(int member_no);
	
	public int idchk(String member_id);
	public AdminDto selectOne2(String member_id);

}
