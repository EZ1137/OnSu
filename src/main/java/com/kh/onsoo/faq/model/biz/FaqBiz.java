package com.kh.onsoo.faq.model.biz;

import java.util.List;

import com.kh.onsoo.faq.model.dto.FaqDto;

public interface FaqBiz {
	
	public List<FaqDto> selectList();

}
