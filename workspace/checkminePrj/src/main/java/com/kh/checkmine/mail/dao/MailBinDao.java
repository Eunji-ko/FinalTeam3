package com.kh.checkmine.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailBinVo;

public interface MailBinDao {

	/**
	 * 휴지통 리스트 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	List<MailBinVo> getList(SqlSessionTemplate sst, String memberNo, PageVo pageVo);

	/**
	 * 휴지통 리스트 갯수 가져오기
	 * @param sst
	 * @param memberNo
	 * @return
	 */
	int getListCount(SqlSessionTemplate sst, String memberNo);

	/**
	 * 받은메일 휴지통에서 삭제
	 * @param sst
	 * @param recNo
	 * @return
	 */
	int deleteReceiveMailBin(SqlSessionTemplate sst, String recNo);

	/**
	 * 보낸메일 휴지통에서 삭제
	 * @param sst
	 * @param sendNo
	 * @return
	 */
	int deleteSendMailBin(SqlSessionTemplate sst, String sendNo);

}
