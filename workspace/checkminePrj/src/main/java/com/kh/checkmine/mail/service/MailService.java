package com.kh.checkmine.mail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.common.PageVo;
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
	 * 받은메일함 휴지통으로 보내기
	 * @param targetMails
	 * @return
	 */
	int moveRecycleBinReceive(String[] targetMails);

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

}
