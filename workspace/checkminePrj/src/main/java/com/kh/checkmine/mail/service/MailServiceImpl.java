package com.kh.checkmine.mail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.dao.MailDao;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceveMailVo;

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
	 * 로그인한 멤버의 메일 갯수 가져오기
	 */
	@Override
	public int getListCount(String type, String loginMember) {
		String dbType = "";
		if("receve".equals(type)) {
			dbType = "A";
		}
		
		HashMap<String, String> infoMap = new HashMap<String, String>();
		infoMap.put("type", dbType);
		infoMap.put("loginMember", loginMember);
		
		return dao.getMailListCount(sst, infoMap);
	}

	/**
	 * 로그인한 멤버의 메일 리스트 가져오기
	 */
	@Override
	public List<ReceveMailVo> getList(HashMap<String, String> listInfo, PageVo pageVo) {
		return dao.getMailList(sst, listInfo, pageVo);
	}

	/**
	 * 로그인한 멤버의 보낸 메일 갯수 가져오기
	 */
	@Override
	public int getSendListCount(String loginMember) {
		return dao.getSendMailListCount(sst, loginMember);
	}

	@Override
	public List<MailVo> getSendList(String loginMember, PageVo pageVo) {
		return dao.getSendMailList(sst,loginMember, pageVo);
	}

}
