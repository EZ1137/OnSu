package com.kh.onsoo.faq.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsoo.faq.model.dao.FaqDao;
import com.kh.onsoo.faq.model.dto.FaqDto;

@Service
public class FaqBizImpl implements FaqBiz {

	@Autowired
	private FaqDao faqDao;

	@Override
	public List<FaqDto> selectList() {

		return faqDao.selectList();
	}

}
