package com.kh.onsoo.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onsoo.calendar.model.dto.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(CalendarDaoImpl.class);
	
	@Override
	public List<CalendarDto> selectList(String yyyyMMdd) {
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		list = sqlSession.selectList(NAMESPACE+"selectList", yyyyMMdd);
		
		return list;
	}

	@Override
	public CalendarDto selectOne(int calendar_no) {
		CalendarDto dto = new CalendarDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", calendar_no);
		} catch (Exception e) {
			logger.info("[ERROR] selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(CalendarDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			logger.info("[ERROR] insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(CalendarDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			logger.info("[ERROR] update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int calendar_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", calendar_no);
		} catch (Exception e) {
			logger.info("[ERROR] delete");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<CalendarDto> calendarList(String yyyyMMdd) {
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		list = sqlSession.selectList(NAMESPACE+"calendarList", yyyyMMdd);
		
		return list;
	}

}
