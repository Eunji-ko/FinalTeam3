package com.kh.checkmine.mail.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailSearchVo;

@Repository
public class MailSearchDaoImpl implements MailSearchDao{

	/**
	 * 검색 결과 가져오기
	 */
	@Override
	public List<MailSearchVo> selectSearchList(SqlSessionTemplate sst, HashMap<String, String> searchData, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		
		return sst.selectList("mailSearchMapper.selectSearchList", searchData, rb);
	}

	/**
	 * 리스트 갯수 가져오기
	 */
	@Override
	public int selectListCount(SqlSessionTemplate sst, HashMap<String, String> searchData) {
		return sst.selectOne("mailSearchMapper.selectListCount", searchData);
	}

}
