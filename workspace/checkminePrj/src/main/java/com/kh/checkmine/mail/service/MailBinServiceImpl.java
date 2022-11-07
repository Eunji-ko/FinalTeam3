package com.kh.checkmine.mail.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.dao.MailBinDao;
import com.kh.checkmine.mail.vo.MailBinVo;

@Service
public class MailBinServiceImpl implements MailBinService{
	private final MailBinDao dao;
	private final SqlSessionTemplate sst;
	
	public MailBinServiceImpl(SqlSessionTemplate sst, MailBinDao dao) {
		this.dao = dao;
		this.sst = sst;
		
	}

	/**
	 * 휴지통 리스트 가져오기
	 */
	@Override
	public List<MailBinVo> getList(String memberNo, PageVo pageVo) {
		return dao.getList(sst,memberNo, pageVo);
	}

	/**
	 * 후지통 리스트 갯수 가져오기
	 */
	@Override
	public int getListCount(String memberNo) {
		return dao.getListCount(sst, memberNo);
	}
}
