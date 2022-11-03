package com.kh.checkmine.mail.service;

import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

public interface MailDetailService {

	/**
	 * 받은 메일 객체 가져오기
	 * @param mailNo
	 * @return
	 */
	ReceiveMailVo getReceiveMailVo(String mailNo);

	/**
	 * 보낸 메일 객체 가져오기
	 * @param mailNo
	 * @return
	 */
	MailVo getSendMailVo(String mailNo);

	/**
	 * 임시저장 메일 객체 가져오기
	 * @param mailNo
	 * @return
	 */
	MailSendFormVo getSaveMailVo(String mailNo);

}
