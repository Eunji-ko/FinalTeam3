package com.kh.checkmine.mail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

public interface MailService {

	/**
	 * 받은 메일 리스트 갯수 가져오기
	 * @param no
	 * @return
	 */
	int getReceiveListCount(String no);

	/**
	 * 받은 메일 리스트 가져오기
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<ReceiveMailVo> getReceiveList(String memberNo, PageVo pageVo);

	/**
	 * 중요도 설정
	 * @param impVo
	 * @return
	 */
	int setImportance(HashMap<String, String> impVo);

	/**
	 * 안읽은 메일 갯수
	 * @param memberNo
	 * @param c
	 * @return
	 */
	int getNotReadCount(String memberNo, String type);

	/**
	 * 참조 메일 리스트 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	int getRefListCount(String memberNo);

	/**
	 * 참조 메일 리스트 가져오기
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<ReceiveMailVo> getRefList(String memberNo, PageVo pageVo);

	/**
	 * 보낸 메일함 겟수 가져오기
	 * @param memberNo
	 * @return
	 */
	int getSendListCount(String memberNo);

	/**
	 * 보낸 메일함 리스트 가져오기
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<MailVo> getSendList(String memberNo, PageVo pageVo);
	
	/**
	 * 받은메일함 휴지통으로 보내기
	 * @param targetMails
	 * @return
	 */
	int moveRecycleBinReceive(String[] targetMails);
	
	/**
	 * 보낸메일함 휴지통으로 보내기
	 * @param targetMails
	 * @return
	 */
	int moveRecycleBinSend(String[] targetMails);

	/**
	 * 중요 메일함 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	int getImpListCount(String memberNo);

	/**
	 * 중요 메일함 리스트 가져오기
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<ReceiveMailVo> getImpList(String memberNo, PageVo pageVo);

	/**
	 * 임시저장 갯수 사져오기
	 * @param memberNo
	 * @return
	 */
	int getSaveListCount(String memberNo);

	/**
	 * 임시저장 리스트 가져오기
	 * @param memberNo
	 * @param pageVo
	 * @return
	 */
	List<MailVo> getSaveList(String memberNo, PageVo pageVo);

}
