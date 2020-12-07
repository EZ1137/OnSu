package com.kh.onsu.pay.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onsu.pay.model.dao.PayDao;
import com.kh.onsu.pay.model.dto.PayDto;

@Service
public class PayBizImpl implements PayBiz {

	@Autowired
	private PayDao payDao;
	
	public PayDto selectPay(String pay_memberid, int pay_classno) {
		return payDao.selectPay(pay_memberid, pay_classno);
	}
	
	public int insert(PayDto dto) {
		return payDao.insert(dto);
	}
	
	public int delete(PayDto dto) {
		return payDao.delete(dto);
	}

}
