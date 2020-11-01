package com.kh.onsoo.calendar.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.calendar.model.dao.CalendarDao;
import com.kh.onsoo.calendar.model.dto.CalendarDto;

@Service
public class CalendarBizImpl implements CalendarBiz {

	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public List<CalendarDto> selectList(String yyyyMMdd) {
		return calendarDao.selectList(yyyyMMdd);
	}

	@Override
	public CalendarDto selectOne(int calendar_no) {
		return calendarDao.selectOne(calendar_no);
	}

	@Override
	public int insert(CalendarDto dto) {
		return calendarDao.insert(dto);
	}

	@Override
	public int update(CalendarDto dto) {
		return calendarDao.update(dto);
	}

	@Override
	public int delete(int calendar_no) {
		return calendarDao.delete(calendar_no);
	}

	public List<CalendarDto> calendarList(String yyyyMMdd) {
		return calendarDao.calendarList(yyyyMMdd);
	}
}
