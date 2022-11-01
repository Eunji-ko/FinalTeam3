package com.kh.checkmine.mail.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.mail.vo.MailAttVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

public interface MailDetailDao {

	/**
	 * 받은 메일 상세조회 객체 가져오기
	 * @param sst
	 * @param mailNo
	 * @return
	 */
	ReceiveMailVo selectReceiveMailVo(SqlSessionTemplate sst, String mailNo);

	/**
	 * 받은 메일 상세조외 파일 리스트 가져오기
	 * @param sst
	 * @param mailNo
	 * @return
	 */
	List<MailAttVo> selectFileNameList(SqlSessionTemplate sst, String mailNo);

}
