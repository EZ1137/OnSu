package com.kh.onsoo.pay.model.dao;

import com.kh.onsoo.pay.model.dto.PayDto;

public interface PayDao {
	String NAMESPACE = "pay.";
	
	public PayDto selectPay(String pay_memberid, int pay_classno);
	public int insert(PayDto dto);
}
