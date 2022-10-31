package com.kh.checkmine.mail.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.mail.vo.MailAttVo;
import com.kh.checkmine.mail.vo.MailSendFormVo;

public interface MailSendDao {

	/**
	 * 메일 보내기
	 * @param sst
	 * @param formVo
	 * @return
	 */
	int insertMail(SqlSessionTemplate sst, MailSendFormVo formVo);

	/**
	 * 보낸 메일 번호 가져오기
	 * @param sst
	 * @return
	 */
	String getCurrentMailNum(SqlSessionTemplate sst);

	/**
	 * 메일 받는사람 추가
	 * @param sst
	 * @param formVo
	 * @return
	 */
	int insertMailRefA(SqlSessionTemplate sst, MailSendFormVo formVo);

	/**
	 * 메일 참조인 추가
	 * @param sst
	 * @param formVo
	 * @return
	 */
	int insertMailRefR(SqlSessionTemplate sst, MailSendFormVo formVo);

	/**
	 * 메일로 사원 번호 가져오기
	 * @param emp
	 * @return
	 */
	String getEmpNoToEmail(SqlSessionTemplate sst, String empEmail);

	/**
	 * 파일 이름 디비에 저장
	 * @param sst
	 * @param map
	 * @return
	 */
	int insertMailAtt(SqlSessionTemplate sst, MailAttVo vo);

	/**
	 * 임시저장 테이블에 저장
	 * @param sst
	 * @param formVo
	 * @return
	 */
	int insertMailSave(SqlSessionTemplate sst, MailSendFormVo formVo);

	/**
	 * 현재 임시저장 번호 가져오기
	 * @param sst
	 * @return
	 */
	String getCurrentMailSaveNum(SqlSessionTemplate sst);

	/**
	 * 임시저장 파일첨부 테이블에 데이터 추가
	 * @param sst
	 * @param vo
	 * @return
	 */
	int insertMailSaveAtt(SqlSessionTemplate sst, MailAttVo vo);

}
