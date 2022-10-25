package com.kh.checkmine.mail.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.dao.MailDao;
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
	 * 보낸 메일 리스트 갯수 가져오기
	 */
	@Override
	public int getReceiveListCount(String no) {
		return dao.getReceiveListCount(sst, no);
	}

	/**
	 * 보낸 메일 리스트 가져오기
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


}
