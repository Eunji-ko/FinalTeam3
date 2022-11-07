package com.kh.checkmine.mail.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailSearchVo;

public interface MailSearchDao {

	/**
	 * 검색 결과 가져오기
	 * @param sst
	 * @param searchData
	 * @param pageVo 
	 * @return
	 */
	List<MailSearchVo> selectSearchList(SqlSessionTemplate sst, HashMap<String, String> searchData, PageVo pageVo);

	/**
	 * 리스트 갯수 가져오기
	 * @param sst
	 * @param searchData
	 * @return
	 */
	int selectListCount(SqlSessionTemplate sst, HashMap<String, String> searchData);

}
