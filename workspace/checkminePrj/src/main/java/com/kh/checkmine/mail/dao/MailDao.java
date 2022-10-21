package com.kh.checkmine.mail.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

public interface MailDao {

	/**
	 * 로그인한 멤버의 메일리스트 갯수 가져오기
	 * @param sst
	 * @param infoMap
	 * @return
	 */
	int getMailListCount(SqlSessionTemplate sst, HashMap<String, String> infoMap);

}
