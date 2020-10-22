package com.kh.onsoo.admin.model.dao;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminDto;

public interface AdminDao {
	
	String NAMESPACE = "";
	
	public List<AdminDto> selectList();
	public AdminDto selectOne(int member_no);
	public int insert(AdminDto dto);
	public int update(AdminDto dto);
	public int delete(int member_no);

}
