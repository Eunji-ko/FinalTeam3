package com.kh.checkmine.mail.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailVo;
import com.kh.checkmine.mail.vo.ReceiveMailVo;

@Repository
public class MailDaoImpl implements MailDao{

	/**
	 * 받은 메일 리스트 갯수 가져오기
	 */
	@Override
	public int getReceiveListCount(SqlSessionTemplate sst, String no) {
		return sst.selectOne("mailMapper.selectReceveListCount", no);
	}

	/**
	 * 받은 메일 리스트 가져오기
	 */
	@Override
	public List<ReceiveMailVo> getReceiveList(SqlSessionTemplate sst, String memberNo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		
		return sst.selectList("mailMapper.selectReceiveList",memberNo, rb);
	}

	/**
	 * 중요도 설정
	 */
	@Override
	public int setImportance(SqlSessionTemplate sst, HashMap<String, String> impVo) {
		return sst.update("mailMapper.upadteImportance", impVo);
	}

	/**
	 * 받은메일함 휴지통으로 보내기
	 */
	@Override
	public int moveRecycleBinReceive(SqlSessionTemplate sst, String targetMail) {
		return sst.update("mailMapper.upadteMailRefStatus",targetMail);
	}
	
	/**
	 * 보낸메일함 휴지통으로 보내기
	 */
	@Override
	public int moveRecycleBinSend(SqlSessionTemplate sst, String targetMail) {
		return sst.update("mailMapper.upadteMailStatus",targetMail);
	}

	/**
	 * 안읽은 메일 갯수 가져오기
	 */
	@Override
	public int getNotReadCount(SqlSessionTemplate sst, HashMap<String, String> vo) {
		return sst.selectOne("mailMapper.selectNotReadCount", vo);
	}

	/**
	 * 참조 메일 갯수 가져오기
	 */
	@Override
	public int getRefListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailMapper.selectRefListCount",memberNo);
	}

	/**
	 * 참조 메일 리스트 가져오기
	 */
	@Override
	public List<ReceiveMailVo> getRefList(SqlSessionTemplate sst, String memberNo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());

		return sst.selectList("mailMapper.selectRefList",memberNo, rb);
	}

	/**
	 * 보낸 메일 리스트 갯수 가져오기
	 */
	@Override
	public int getSendListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailMapper.selectSendListCount",memberNo);
	}

	/**
	 * 보낸 메일 리스트 가져오기
	 */
	@Override
	public List<MailVo> getSendList(SqlSessionTemplate sst, String memberNo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		
		return sst.selectList("mailMapper.selectSendList", memberNo, rb);
	}

	/**
	 * 중요 메일함 갯수 가져오기
	 */
	@Override
	public int getImpListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailMapper.selectImpListCount",memberNo);
	}

	/**
	 * 중요 메일함 리스트 가져오기
	 */
	@Override
	public List<ReceiveMailVo> getImpList(SqlSessionTemplate sst, String memberNo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		
		return sst.selectList("mailMapper.selecImpList", memberNo, rb);
	}

	/**
	 * 임시보관함 갯수 가져오기
	 */
	@Override
	public int getSaveListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailMapper.selectSaveListCount",memberNo);
	}

	/**
	 * 임시보관 리스트 가져오기
	 */
	@Override
	public List<MailVo> getSaveList(SqlSessionTemplate sst, String memberNo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		
		return sst.selectList("mailMapper.selectSaveList", memberNo, rb);
	}

	

}
