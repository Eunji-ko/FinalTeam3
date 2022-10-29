package com.kh.checkmine.mail.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public int insertMail(MailSendFormVo formVo) {
		int result = 1;
		result = result * dao.insertMail(sst,formVo);
		
		String currentMailNum = dao.getCurrentMailNum(sst);
		formVo.setCurrentMailNum(currentMailNum);
		
		for(String receiver:formVo.getReceiverArr()) {
			//보낼사람 이메일로 번호 가져오기
			String receiverNum = dao.getEmpNoToEmail(sst, receiver);
			//결과가 없으면 -1로 저장
			if("".equals(receiverNum) || receiverNum == null) {
				receiverNum = "-1";
			}
			formVo.setReceiver(receiverNum);
			
			System.out.println("insertMailRefA:::"+formVo);
			
			//결과에 곱하기
			result = result * dao.insertMailRefA(sst, formVo);
		}
		for(String refer:formVo.getReferArr()) {
			String referNum = dao.getEmpNoToEmail(sst, refer);
			if("".equals(referNum) || referNum == null) {
				referNum = "-1";
			}
			formVo.setRefer(referNum);
			
			System.out.println("insertMailRefR:::"+formVo);
			
			result = result * dao.insertMailRefR(sst, formVo);
		}
		
		return result;
	}

}
