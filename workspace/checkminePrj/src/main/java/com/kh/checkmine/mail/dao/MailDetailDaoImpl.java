package com.kh.checkmine.mail.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.mail.vo.MailAttVo;
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
	
}
