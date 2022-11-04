package com.kh.checkmine.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.mail.vo.MailAddrVo;

public interface MailAddrDao {

	/**
	 * 사내 주소록 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	List<MailAddrVo> selectAddrListInner(SqlSessionTemplate sst, String memberNo);
	/**
	 * 사내 주소록 리스트 갯수 가져오기
	 * @param memberNo
	 * @return
	 */
	int selectInnerAddrListCount(SqlSessionTemplate sst, String memberNo);

	/**
	 * 사외 주소록 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	List<MailAddrVo> selectAddrListOuter(SqlSessionTemplate sst, String memberNo);
	/**
	 * 사외 주소록 리스트 갯수 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	int selectOuterAddrListCount(SqlSessionTemplate sst, String memberNo);

	/**
	 * 거래처 주소록 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	List<MailAddrVo> selectAddrListAcc(SqlSessionTemplate sst, String memberNo);
	/**
	 * 거래처 주소록 리스트 갯수 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	int selectAccAddrListCount(SqlSessionTemplate sst, String memberNo);
	
	/**
	 * 주소록에 추가
	 * @param sst
	 * @param mailAddrVo
	 * @return
	 */
	int insertAddr(SqlSessionTemplate sst, MailAddrVo mailAddrVo);
	
	
	

	

}
