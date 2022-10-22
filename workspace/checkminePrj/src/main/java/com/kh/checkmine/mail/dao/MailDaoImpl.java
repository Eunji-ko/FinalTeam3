package com.kh.checkmine.mail.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceveMailVo;

@Repository
public class MailDaoImpl implements MailDao{

	/**
	 * 리스트 갯수 가져오기
	 */
	@Override
	public int getMailListCount(SqlSessionTemplate sst, HashMap<String, String> infoMap) {
		return sst.selectOne("mailMapper.selectListCount", infoMap);
	}
	
	/**
	 * 리스트 가져오기
	 */
	@Override
	public List<ReceveMailVo> getMailList(SqlSessionTemplate sst, HashMap<String, String> listInfo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		return sst.selectList("mailMapper.selectList", listInfo, rb);
	}

	/**
	 * 보낸메일 리스트 개수 가져오기
	 */
	@Override
	public int getSendMailListCount(SqlSessionTemplate sst, String loginMember) {
		return sst.selectOne("mailMapper.selectSendListCount", loginMember);
	}

	
	/**
	 * 보낸메일 가져오기
	 */
	@Override
	public List<MailVo> getSendMailList(SqlSessionTemplate sst, String loginMember, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		return sst.selectList("mailMapper.selectSendList", loginMember, rb);
	}

}
