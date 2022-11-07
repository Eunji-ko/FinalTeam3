package com.kh.checkmine.mail.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.mail.vo.MailBinVo;

@Repository
public class MailBinDaoImpl implements MailBinDao{

	/**
	 * 휴지통 리스트 가져오기
	 */
	@Override
	public List<MailBinVo> getList(SqlSessionTemplate sst, String memberNo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pageVo.getBoardLimit());
		
		return sst.selectList("mailBinMapper.selectMailBinList",memberNo, rb);
	}

	/**
	 * 휴지통 리스트 갯수 가져오기
	 */
	@Override
	public int getListCount(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("mailBinMapper.selectListCount", memberNo);
	}
	
}
