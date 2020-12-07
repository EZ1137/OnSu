package com.kh.onsu.pay.model.biz;

import com.kh.onsu.pay.model.dto.PayDto;

public interface PayBiz {
	public PayDto selectPay(String pay_memberid, int pay_classno);
	public int insert(PayDto dto);
	public int delete(PayDto dto);
}
