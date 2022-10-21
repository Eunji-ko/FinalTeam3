package com.kh.checkmine.mail.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MailDaoImpl implements MailDao{

	@Override
	public int getMailListCount(SqlSessionTemplate sst, HashMap<String, String> infoMap) {
		return sst.selectOne("mailMapper.selectListCount", infoMap);
	}

}
