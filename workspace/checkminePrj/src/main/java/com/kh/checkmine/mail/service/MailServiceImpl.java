package com.kh.checkmine.mail.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.dao.MailDao;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

@Service
public class MailServiceImpl implements MailService{
	
	private final MailDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MailServiceImpl(MailDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	/**
	 * 받은 메일 리스트 갯수 가져오기
	 */
	@Override
	public int getReceiveListCount(String no) {
		return dao.getReceiveListCount(sst, no);
	}

	/**
	 * 받은 메일 리스트 가져오기
	 */
	@Override
	public List<ReceiveMailVo> getReceiveList(String memberNo, PageVo pageVo) {
		return dao.getReceiveList(sst, memberNo, pageVo);
	}

	/**
	 * 중요도 설정
	 */
	@Override
	public int setImportance(HashMap<String, String> impVo) {
		return dao.setImportance(sst, impVo);
	}

	/**
	 * 받은메일함 휴지통으로 보내기
	 */
	@Override
	public int moveRecycleBinReceive(String[] targetMails) {
		int result = 1;
		for(String targetMail:targetMails) {			
			result = result*dao.moveRecycleBinReceive(sst, targetMail);
		}
		return result;
	}
	
	/**
	 * 보낸메일함 휴지통으로 보내기
	 */
	@Override
	public int moveRecycleBinSend(String[] targetMails) {
		int result = 1;
		for(String targetMail:targetMails) {			
			result = result*dao.moveRecycleBinSend(sst, targetMail);
		}
		return result;
	}

	/**
	 * 안읽은 메일 갯수 가져오기
	 */
	@Override
	public int getNotReadCount(String memberNo, String type) {
		HashMap<String, String> vo = new HashMap<String, String>();
		vo.put("memberNo", memberNo);
		vo.put("type", type);
		
		return dao.getNotReadCount(sst, vo);
	}

	/**
	 * 참조 메일 갯수 가져오기
	 */
	@Override
	public int getRefListCount(String memberNo) {
		return dao.getRefListCount(sst,memberNo);
	}

	/**
	 * 참조 메일 리스트 가져오기
	 */
	@Override
	public List<ReceiveMailVo> getRefList(String memberNo, PageVo pageVo) {
		return dao.getRefList(sst, memberNo, pageVo);
	}

	/**
	 * 보낸 메일함 리스트 갯수 가져오기
	 */
	@Override
	public int getSendListCount(String memberNo) {
		return dao.getSendListCount(sst, memberNo);
	}

	/**
	 * 보낸 메일함 리스트 가져오기
	 */
	@Override
	public List<MailVo> getSendList(String memberNo, PageVo pageVo) {
		return dao.getSendList(sst,memberNo, pageVo);
	}

	/**
	 * 중요 메일함 갯수 가져오기
	 */
	@Override
	public int getImpListCount(String memberNo) {
		return dao.getImpListCount(sst, memberNo);
	}

	/**
	 * 중요 메일함 리스트 가져오기
	 */
	@Override
	public List<ReceiveMailVo> getImpList(String memberNo, PageVo pageVo) {
		return dao.getImpList(sst, memberNo, pageVo);
	}

	/**
	 * 임시보관함 갯수 가져오기
	 */
	@Override
	public int getSaveListCount(String memberNo) {
		return dao.getSaveListCount(sst, memberNo);
	}

	/**
	 * 임시저장 리스트 가져오기
	 */
	@Override
	public List<MailSendFormVo> getSaveList(String memberNo, PageVo pageVo) {
		return dao.getSaveList(sst, memberNo, pageVo);
	}

	/**
	 * 임시저장 메일 삭제
	 */
	@Override
	public int moveRecycleBinSave(String[] targetMails) {
		int result = 1;
		for(String targetMail:targetMails) {			
			result = result*dao.deleteMailSend(sst, targetMail);
		}
		return result;
	}

	


}
