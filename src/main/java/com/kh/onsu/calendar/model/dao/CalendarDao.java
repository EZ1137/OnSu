package com.kh.onsu.calendar.model.dao;

import java.util.List;

import com.kh.onsu.calendar.model.dto.CalendarDto;

public interface CalendarDao {
	
	String NAMESPACE="calendar.";
	
	public List<CalendarDto> selectList();
	public CalendarDto selectOne(int calendar_no);
	public int insert(CalendarDto dto);
	public int update(CalendarDto dto);
	public int delete(int calendar_no);
	public List<CalendarDto> calendarList(String yyyyMMdd);
	public List<CalendarDto> schedule(String member_id);

}
