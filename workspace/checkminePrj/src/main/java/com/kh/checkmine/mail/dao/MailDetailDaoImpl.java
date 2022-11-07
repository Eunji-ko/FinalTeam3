package com.kh.checkmine.mail.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.mail.vo.MailAttVo;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

@Repository
public class MailDetailDaoImpl implements MailDetailDao{

	/**
	 * 보낸 메일 상세조회 객체 가져오기
	 */
	@Override
	public ReceiveMailVo selectReceiveMailVo(SqlSessionTemplate sst, String mailNo) {
		return sst.selectOne("mailDetailMapper.selectReceiveMailVo", mailNo);
	}

	/**
	 * 받은 메일 상세조외 파일 리스트 가져오기
	 */
	@Override
	public List<MailAttVo> selectFileNameList(SqlSessionTemplate sst, String mailNo) {
		return sst.selectList("mailDetailMapper.selectFileNameList", mailNo);
	}

	/**
	 * 보낸 메일 상세조회 객체 가져오기
	 */
	@Override
	public MailVo selectSendMailVo(SqlSessionTemplate sst, String mailNo) {
		return sst.selectOne("mailDetailMapper.selectSendMailVo",mailNo);
	}

	/**
	 * 메일번호로 받는사람 리스트 가져오기
	 */
	@Override
	public List<String> selectReceiverList(SqlSessionTemplate sst, String mailNo) {
		return sst.selectList("mailDetailMapper.selectReceiverList" ,mailNo);
		//TODO
	}

	/**
	 * 메일번호로 참조인 리승트 가져오기
	 */
	@Override
	public List<String> selectReferList(SqlSessionTemplate sst, String mailNo) {
		return sst.selectList("mailDetailMapper.selectReferList" ,mailNo);
		//TODO
	}

	/**
	 * 임시저장 메일 객체 가져오기
	 */
	@Override
	public MailSendFormVo selectSaveMailVo(SqlSessionTemplate sst, String mailNo) {
		return sst.selectOne("mailDetailMapper.selectSaveMailVo", mailNo);
	}

	/**
	 * 임시저장 메일 펌부파일 객체 리스트 가져오기
	 */
	@Override
	public List<MailAttVo> selectSaveMailFileList(SqlSessionTemplate sst, String mailNo) {
		return sst.selectList("mailDetailMapper.selectSaveMailFileList", mailNo);
	}

	/**
	 * 읽음으로 표시
	 */
	@Override
	public int updateReadStatus(SqlSessionTemplate sst, String mailNo) {
		return sst.update("mailDetailMapper.updateReadStatus",mailNo);
	}
	
}
