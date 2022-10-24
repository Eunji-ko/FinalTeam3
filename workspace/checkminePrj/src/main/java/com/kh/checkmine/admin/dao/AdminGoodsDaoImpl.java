package com.kh.checkmine.admin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

@Repository
public class AdminGoodsDaoImpl implements AdminGoodsDao{

	//총 공유물 수
	@Override
	public int selectGoodsTotal(SqlSessionTemplate sst, String sort) {
		return sst.selectOne("adminGoodsMapper.selectGoodsTotal", sort);
	}

	//게시물 리스트
	@Override
	public List<GoodsVo> selectGoodsList(SqlSessionTemplate sst, PageVo pv, String sort) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("adminGoodsMapper.selectGoodsList", sort, rb);
	}

	@Override
	public List<PlaceVo> selectPlaceList(SqlSessionTemplate sst, PageVo pv, String sort) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("adminGoodsMapper.selectPlaceList", sort, rb);
	}

}
