package com.kh.onsoo.admin.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.admin.model.dao.AdminDao;
import com.kh.onsoo.admin.model.dto.AdminDto;

@Service
public class AdminBizImpl implements AdminBiz {

	@Autowired
	private AdminDao dao;
	
	@Override
	public List<AdminDto> selectList() {
		return dao.selectList();
	}

	@Override
	public AdminDto selectOne(String member_id) {
		return dao.selectOne(member_id);
	}

	@Override
	public int insert(AdminDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(AdminDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int member_no) {
		return dao.delete(member_no);
	}
	
	public AdminDto selectOne2(String member_id) {
		return dao.selectOne2(member_id);
	}
	
	@Override
	public int idchk(String member_id) {
		return dao.idchk(member_id);
	}
}
