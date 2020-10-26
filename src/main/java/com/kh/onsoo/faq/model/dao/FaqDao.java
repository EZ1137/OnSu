package com.kh.onsoo.faq.model.dao;

import java.util.List;

import com.kh.onsoo.faq.model.dto.FaqDto;

public interface FaqDao {
	
	String NAMESPACE = "faq.";
	
	public List<FaqDto> selectList();

}
