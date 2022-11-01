package com.kh.checkmine.mail.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.checkmine.mail.dao.MailDetailDao;
import com.kh.checkmine.mail.vo.MailAttVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

@Service
public class MailDetailServiceImpl implements MailDetailService{

	private final MailDetailDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MailDetailServiceImpl(MailDetailDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	/**
	 * 받은 메일 객체 가져오기
	 */
	@Override
	@Transactional
	public ReceiveMailVo getReceiveMailVo(String mailNo) {
		//받은 메일 상세조회 객체 가져오기
		ReceiveMailVo vo = dao.selectReceiveMailVo(sst, mailNo);
		
		//받은 메일 상세조회 객체 가져오기
		List<MailAttVo> mailAttVo = dao.selectFileNameList(sst, mailNo);
		vo.setMailAttVo(mailAttVo);
		return vo;
	}

}
