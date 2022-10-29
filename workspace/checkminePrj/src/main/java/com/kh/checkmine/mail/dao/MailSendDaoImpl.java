package com.kh.checkmine.mail.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.mail.vo.MailSendFormVo;

@Repository
public class MailSendDaoImpl implements MailSendDao{

	/**
	 * 메일 보내기
	 */
	@Override
	public int insertMail(SqlSessionTemplate sst, MailSendFormVo formVo) {
		return sst.insert("mailSendMapper.insertMail", formVo);
	}

	/**
	 * 현재 메일 번호 가져오기
	 */
	@Override
	public String getCurrentMailNum(SqlSessionTemplate sst) {
		return sst.selectOne("mailSendMapper.selectCurrentMailNum");
	}

	/**
	 * 메일 받는사람 추가
	 */
	@Override
	public int insertMailRefA(SqlSessionTemplate sst, MailSendFormVo formVo) {
		return sst.insert("mailSendMapper.insertMailRefA", formVo);
	}

	/**
	 * 메일 참조인 추가
	 */
	@Override
	public int insertMailRefR(SqlSessionTemplate sst, MailSendFormVo formVo) {
		return sst.insert("mailSendMapper.insertMailRefR", formVo);
	}

	/**
	 * 메일로 사원번호 가져오기
	 */
	@Override
	public String getEmpNoToEmail(SqlSessionTemplate sst, String empEmail) {
		return sst.selectOne("mailSendMapper.selectEmpNoToEmail",empEmail);
	}
	
}
