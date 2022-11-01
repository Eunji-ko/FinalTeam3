package com.kh.checkmine.mail.service;

import com.kh.checkmine.mail.vo.ReceiveMailVo;

public interface MailDetailService {

	/**
	 * 받은 메일 객체 가져오기
	 * @param mailNo
	 * @return
	 */
	ReceiveMailVo getReceiveMailVo(String mailNo);

}
