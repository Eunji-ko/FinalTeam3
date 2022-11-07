package com.kh.checkmine.mail.service;

import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailBinVo;

public interface MailBinService {

	/**
	 * 휴지통 리스트 가져오기
	 * @param memberNo
	 * @param pageVo 
	 * @return
	 */
	List<MailBinVo> getList(String memberNo, PageVo pageVo);

	/**
	 * 휴지통 리스트 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	int getListCount(String memberNo);
	
}
