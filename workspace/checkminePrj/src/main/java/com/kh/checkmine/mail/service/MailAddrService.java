package com.kh.checkmine.mail.service;

import java.util.List;

import com.kh.checkmine.mail.vo.MailAddrVo;

public interface MailAddrService {

	/**
	 * 사내 주소록 리스트 가져오기
	 * @param memberNo
	 * @return
	 */
	List<MailAddrVo> getAddrListInner(String memberNo);
	/**
	 * 사내 주소록 리스트 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	int getInnerAddrListCount(String memberNo);

	/**
	 * 사외 주소록 리스트 가져오기
	 * @param memberNo
	 * @return
	 */
	List<MailAddrVo> getAddrListOuter(String memberNo);
	/**
	 * 사외 주소록 리스트 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	int getOuterAddrListCount(String memberNo);

	/**
	 * 거래처 주소록 리스트 가져오기
	 * @param memberNo
	 * @return
	 */
	List<MailAddrVo> getAddrListAcc(String memberNo);
	/**
	 * 거래처 주소록 리스트 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	int getAccAddrListCount(String memberNo);
	
	/**
	 * 주소록에 추가
	 * @param mailAddrVo
	 * @return
	 */
	int insertAddr(MailAddrVo mailAddrVo);
	
	/**
	 * 주소록 삭제
	 * @param targetNo
	 * @return
	 */
	int deleteAddr(String targetNo);

}
