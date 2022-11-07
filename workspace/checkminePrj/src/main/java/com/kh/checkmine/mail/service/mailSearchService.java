package com.kh.checkmine.mail.service;

import java.util.List;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailSearchVo;

public interface mailSearchService {
	
	/**
	 * 메일 검색 결과 가져오기
	 * @param keyword
	 * @param memberNo
	 * @param pageVo 
	 * @return
	 */
	List<MailSearchVo> selectSearchList(String keyword, String memberNo, PageVo pageVo);

	/**
	 * 리스트 갯수 가졍호기
	 * @param keyword
	 * @param memberNo
	 * @return
	 */
	int mailSearchCount(String keyword, String memberNo);

}
