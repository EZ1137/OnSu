package com.kh.onsoo.admin.model.dao;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminDto;

public interface AdminDao {
	
	String NAMESPACE = "com.onsoo.admin.memberboard.";
	
	public List<AdminDto> selectList();
	public List<AdminDto> teacherList();
	public AdminDto selectOne(String member_id);
	public int insert (AdminDto dto);
	public int update (AdminDto dto);
	public int delete(String member_id);
	
	public int idchk(String member_id);
	public int emailchk(String member_email);
	
	
	public AdminDto selectOne2(String member_id);
	
	public AdminDto idfind(AdminDto dto);
	public int pwfind(AdminDto dto);
	public AdminDto updatechk(AdminDto dto);
	
	public int registUpdate(AdminDto dto);

}
