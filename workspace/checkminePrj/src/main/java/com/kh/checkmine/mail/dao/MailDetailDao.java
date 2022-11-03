package com.kh.checkmine.mail.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.mail.vo.MailAttVo;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
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

	/**
	 * 보낸 메일 객체 가져오기
	 * @param sst
	 * @param mailNo
	 * @return
	 */
	MailVo selectSendMailVo(SqlSessionTemplate sst, String mailNo);

	/**
	 * 메일 번호로 받는사람 리스트 가져오기
	 * @param sst
	 * @param mailNo
	 * @return
	 */
	List<String> selectReceiverList(SqlSessionTemplate sst, String mailNo);

	/**
	 * 메일 번호로 참조인 리스트 가져오기
	 * @param sst
	 * @param mailNo
	 * @return
	 */
	List<String> selectReferList(SqlSessionTemplate sst, String mailNo);

	/**
	 * 임시저장 메일 객체 가져오기
	 * @param sst
	 * @param mailNo
	 * @return
	 */
	MailSendFormVo selectSaveMailVo(SqlSessionTemplate sst, String mailNo);

	/**
	 * 임시저장 메일 첨부파일 객체 리스트 가져오기
	 * @param sst
	 * @param mailNo
	 * @return
	 */
	List<MailAttVo> selectSaveMailFileList(SqlSessionTemplate sst, String mailNo);

}
