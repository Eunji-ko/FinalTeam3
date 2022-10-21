package com.kh.checkmine.mail.service;

public interface MailService {

	//멤버의 메일 리스트 갯수 가져오기
	int getListCount(String type, String loginMember);

}
