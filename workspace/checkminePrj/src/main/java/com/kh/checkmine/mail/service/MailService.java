package com.kh.checkmine.mail.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceveMailVo;

public interface MailService {

	//멤버의 메일 리스트 갯수 가져오기
	int getListCount(String type, String loginMember);

	//멤버의 메일 리스트 가져오기
	List<ReceveMailVo> getList(HashMap<String, String> listInfo, PageVo pageVo);

	//멤버의 보낸 메일 리스트 갯수 가져오기
	int getSendListCount(String type);

	//멤버의 보낸 메일 리스트 가져오기
	List<MailVo> getSendList(String loginMember, PageVo pageVo);

	//중요도 바꾸기
	int setImp(HashMap<String, String> impMap);

	//중요메일함 리스트 갯수 가져오기
	int getImpListCount(String type);

	//중요메일함 리스트 겟수
	List<ReceveMailVo> getImpList(String loginMember, PageVo pageVo);

	//임시저장 메일함 리스트 갯수
	int getSaveListCount(String loginMember);

	/**
	 * 임시저장 메일 리스트 
	 * @param loginMember
	 * @param pageVo
	 * @return
	 */
	List<MailVo> getSaveList(String loginMember, PageVo pageVo);

}
