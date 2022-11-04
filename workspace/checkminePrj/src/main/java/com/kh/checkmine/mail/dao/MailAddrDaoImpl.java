package com.kh.checkmine.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.mail.vo.MailAddrVo;

@Repository
public class MailAddrDaoImpl implements MailAddrDao{

	/**
	 * 사내 주소록 리스트 가져오기
	 */
	@Override
	public List<MailAddrVo> selectAddrListInner(SqlSessionTemplate sst, String memberNo) {
		
		return sst.selectList("mailAddrMapper.selectAddrListInner",memberNo);
	}
	/**
	 * 사내 주소록 리스트 갯수 가져오기
	 */
	@Override
	public int selectInnerAddrListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailAddrMapper.selectInnerAddrListCount", memberNo);
	}

	/**
	 * 사외 주소록 리스트 가져오기
	 */
	@Override
	public List<MailAddrVo> selectAddrListOuter(SqlSessionTemplate sst, String memberNo) {
		
		return sst.selectList("mailAddrMapper.selectAddrListOuter",memberNo);
	}
	/**
	 * 사외 주소록 리스트 갯수 가져오기
	 */
	@Override
	public int selectOuterAddrListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailAddrMapper.selectOuterAddrListCount", memberNo);
	}

	/**
	 * 거래처 주소록 리스트 가져오기
	 */
	@Override
	public List<MailAddrVo> selectAddrListAcc(SqlSessionTemplate sst, String memberNo) {
		
		return sst.selectList("mailAddrMapper.selectAddrListAcc",memberNo);
	}
	/**
	 * 거래처 주소록 리스트 갯수 가져오기
	 */
	@Override
	public int selectAccAddrListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailAddrMapper.selectAccAddrListCount", memberNo);
	}
	/**
	 * 주소록에 추가
	 */
	@Override
	public int insertAddr(SqlSessionTemplate sst, MailAddrVo mailAddrVo) {
		return sst.insert("mailAddrMapper.insertAddr", mailAddrVo);
	}
	

	
	
}
