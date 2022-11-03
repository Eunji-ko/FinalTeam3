package com.kh.checkmine.mail.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.checkmine.mail.dao.MailDetailDao;
import com.kh.checkmine.mail.vo.MailAttVo;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
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
		List<MailAttVo> mailAttVo = dao.selectFileNameList(sst, vo.getMailNo());
		vo.setMailAttVo(mailAttVo);
		return vo;
	}

	/**
	 * 보낸 메일 객체 가져오기
	 */
	@Override
	@Transactional
	public MailVo getSendMailVo(String mailNo) {
		MailVo vo = dao.selectSendMailVo(sst, mailNo);
				
		List<MailAttVo> mailAttVo = dao.selectFileNameList(sst, mailNo);
		
		List<String> receiverList = dao.selectReceiverList(sst, mailNo);
		List<String> referList = dao.selectReferList(sst, mailNo);
		
		String receiverListString = String.join(", ", receiverList);
		String referListString = String.join(", ", referList);
		
		vo.setReceiverListString(receiverListString);
		vo.setRefersListString(referListString);
		vo.setMailAttVo(mailAttVo);
		
		return vo;
	}

	/**
	 * 임시저장 메일 객체 가져오기
	 */
	@Override
	public MailSendFormVo getSaveMailVo(String mailNo) {
		MailSendFormVo vo = dao.selectSaveMailVo(sst, mailNo);
		
		vo.setMailAttVoList(dao.selectSaveMailFileList(sst,mailNo));
		
		return vo;
	}

}
