package com.kh.checkmine.mail.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailSendFormVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

public interface MailDao {

	/**
	 * 받은 메일 리스트 갯수 가져오기
	 * @param sst
	 * @param no
	 * @return
	 */
	int getReceiveListCount(SqlSessionTemplate sst, String no);

	/**
	 * 받은 메일 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<ReceiveMailVo> getReceiveList(SqlSessionTemplate sst, String memberNo, PageVo pageVo);

	/**
	 * 중요도 설정
	 * @param sst
	 * @param impVo
	 * @return
	 */
	int setImportance(SqlSessionTemplate sst, HashMap<String, String> impVo);

	/**
	 * 받은메일함 휴지통으로보내기
	 * @param sst
	 * @param targetMails
	 * @return
	 */
	int moveRecycleBinReceive(SqlSessionTemplate sst, String targetMail);

	/**
	 * 안읽은 메일 갯수 가져오기
	 * @param sst
	 * @param vo
	 * @return
	 */
	int getNotReadCount(SqlSessionTemplate sst, HashMap<String, String> vo);

	/**
	 * 참조메일 갯수 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	int getRefListCount(SqlSessionTemplate sst, String memberNo);

	/**
	 * 참조 메일 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<ReceiveMailVo> getRefList(SqlSessionTemplate sst, String memberNo, PageVo pageVo);

	/**
	 * 보낸 메일 리스트 갯수 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	int getSendListCount(SqlSessionTemplate sst, String memberNo);

	/**
	 * 보낸 메일 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<MailVo> getSendList(SqlSessionTemplate sst, String memberNo, PageVo pageVo);

	/**
	 * 보낸 메일함 휴지통으로 보내기
	 * @param sst
	 * @param targetMail
	 * @return
	 */
	int moveRecycleBinSend(SqlSessionTemplate sst, String targetMail);

	/**
	 * 중요 메일함 갯수 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	int getImpListCount(SqlSessionTemplate sst, String memberNo);

	/**
	 * 중요 메일함 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<ReceiveMailVo> getImpList(SqlSessionTemplate sst, String memberNo, PageVo pageVo);

	/**
	 * 임시보관함 갯수 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	int getSaveListCount(SqlSessionTemplate sst, String memberNo);

	/**
	 * 임시보관 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<MailSendFormVo> getSaveList(SqlSessionTemplate sst, String memberNo, PageVo pageVo);

	/**
	 * 임시보관 메일 삭제
	 * @param sst
	 * @param targetMail
	 * @return
	 */
	int deleteMailSend(SqlSessionTemplate sst, String targetMail);

}
