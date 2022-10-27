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
		int result = 1;
		result = result*sst.insert("mailSendMapper.insertMail", formVo);
		String curruntMailNum = sst.selectOne("mailSendMapper.selectCurruntMailNum");
		return result;
	}
	
}
