package com.kh.checkmine.mail.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceveMailVo;

public interface MailDao {

	/**
	 * 로그인한 멤버의 메일리스트 갯수 가져오기
	 * @param sst
	 * @param infoMap
	 * @return
	 */
	int getMailListCount(SqlSessionTemplate sst, HashMap<String, String> infoMap);

	/**
	 * 로그인한 멤버의 메일 리스트 가져오기
	 * @param sst
	 * @param listInfo
	 * @param pageVo
	 * @return
	 */
	List<ReceveMailVo> getMailList(SqlSessionTemplate sst, HashMap<String, String> listInfo, PageVo pageVo);

	/**
	 * 로그인한 멤버의 보낸 메일 리스트 갯수 가져오기
	 * @param sst
	 * @param loginMember
	 * @return
	 */
	int getSendMailListCount(SqlSessionTemplate sst, String loginMember);

	/**
	 * 로그인한 멤버의 보낸 메일 리스트 가져오기
	 * @param sst
	 * @param loginMember
	 * @param pageVo
	 * @return
	 */
	List<MailVo> getSendMailList(SqlSessionTemplate sst, String loginMember, PageVo pageVo);

}
