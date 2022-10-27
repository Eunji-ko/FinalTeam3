package com.kh.checkmine.mail.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.mail.dao.MailSendDao;
import com.kh.checkmine.mail.vo.MailSendFormVo;

@Service
public class MailSendServiceImpl implements MailSendService{

	private final MailSendDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MailSendServiceImpl(MailSendDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	/**
	 * 메일 보내기
	 */
	@Override
	public int insertMail(MailSendFormVo formVo) {
		return dao.insertMail(sst,formVo);
	}

}
