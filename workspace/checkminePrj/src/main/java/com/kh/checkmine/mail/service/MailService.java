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

}
