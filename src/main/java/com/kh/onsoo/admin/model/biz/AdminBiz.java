package com.kh.onsoo.admin.model.biz;

import java.util.List;

import com.kh.onsoo.admin.model.dto.AdminDto;

public interface AdminBiz {
	
	public List<AdminDto> selectList();
	public AdminDto selectOne(String member_id);
	public int insert (AdminDto dto);
	public int update (AdminDto dto);
	public int delete(int member_no);
	public AdminDto selectOne2(String member_id);

	public int idchk(AdminDto dto);
}
