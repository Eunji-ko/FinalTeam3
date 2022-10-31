package com.kh.checkmine.mail.service;

import com.kh.checkmine.mail.vo.MailSendFormVo;

public interface MailSendService {

	/**
	 * 메일 보내기
	 * @param formVo
	 * @return
	 */
	int insertMail(MailSendFormVo formVo);

	/**
	 * 메일 임시저장
	 * @param formVo
	 * @return
	 */
	int insertMailSave(MailSendFormVo formVo);

}
