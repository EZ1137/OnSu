package com.kh.onsu.admin.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsu.admin.model.dao.AdminDao;
import com.kh.onsu.admin.model.dto.AdminDto;

@Service
public class AdminBizImpl implements AdminBiz {

	@Autowired
	private AdminDao dao;
	
	@Override
	public List<AdminDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public List<AdminDto> teacherList(){
		return dao.teacherList();
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
	public int delete(String member_id) {
		return dao.delete(member_id);
	}
	
	@Override
	public AdminDto selectOne2(String member_id) {
		return dao.selectOne2(member_id);
	}
	
	@Override
	public int idchk(String member_id) {
		return dao.idchk(member_id);
	}
	@Override
	public int emailchk(String member_email) {
		return dao.emailchk(member_email);
	}
	
	@Override
	public AdminDto idfind(AdminDto dto) {
		return dao.idfind(dto);
	}
	
	@Override
	public int pwfind(AdminDto dto) {
		return dao.pwfind(dto);
	}
	
	@Override
	public AdminDto updatechk(AdminDto dto) {
		return dao.updatechk(dto);
	}
	
	@Override
	public int registUpdate(AdminDto dto) {
		return dao.registUpdate(dto);
	}
	
	
	
}
