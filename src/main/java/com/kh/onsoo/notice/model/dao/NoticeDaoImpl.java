package com.kh.onsoo.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.notice.model.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);
	
	@Override
	public List<NoticeDto> selectList() {
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			list =sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return list;
	}

	
	
	@Override
	public NoticeDto selectOne(int notice_no) {
		NoticeDto dto =null;
		
		try {
			dto =sqlSession.selectOne(NAMESPACE+"selectOne",notice_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(NoticeDto dto) {
		
		int res = 0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	
	@Override
	public int update(NoticeDto dto) {
		int res = 0; 
		
		try {
			res= sqlSession.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int notice_no) {
		int res= 0;
		
		try {
			res=sqlSession.delete(NAMESPACE+"delete",notice_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

}
