package com.kh.checkmine.mail.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.dao.MailSearchDao;
import com.kh.checkmine.mail.vo.MailSearchVo;

@Service
public class MailSearchServiceImpl implements mailSearchService{
	private final SqlSessionTemplate sst;
	private final MailSearchDao dao;
	
	@Autowired
	public MailSearchServiceImpl(SqlSessionTemplate sst, MailSearchDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	/**
	 * 메일 검색 결과 가져오기
	 */
	@Override
	public List<MailSearchVo> selectSearchList(String keyword, String memberNo, PageVo pageVo) {
		HashMap<String, String> searchData = new HashMap<String, String>();
		searchData.put("keyword", keyword);
		searchData.put("memberNo", memberNo);
		
		return dao.selectSearchList(sst, searchData, pageVo);
	}

	/**
	 * 리스트 갯수 가져오기
	 */
	@Override
	public int mailSearchCount(String keyword, String memberNo) {
		HashMap<String, String> searchData = new HashMap<String, String>();
		searchData.put("keyword", keyword);
		searchData.put("memberNo", memberNo);
		
		return dao.selectListCount(sst, searchData);
	}
}
