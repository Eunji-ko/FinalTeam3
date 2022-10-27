package com.kh.checkmine.mail.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.mail.vo.MailSendFormVo;

public interface MailSendDao {

	/**
	 * 메일 보내기
	 * @param sst
	 * @param formVo
	 * @return
	 */
	int insertMail(SqlSessionTemplate sst, MailSendFormVo formVo);

}
