package com.kh.checkmine.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
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

	//예약 리스트
	@Override
	public List<PlaceBookVo> selectPlaceBook(SqlSessionTemplate sst, String no) {
		return sst.selectList("adminGoodsMapper.selectPlaceBook", no);
	}

	@Override
	public List<GoodsBookVo> selectGoodsBook(SqlSessionTemplate sst, String no) {
		return sst.selectList("adminGoodsMapper.selectGoodsBook", no);
	}

	//항목 삭제
	@Override
	public int deletePlace(SqlSessionTemplate sst, String placeNo) {
		return sst.update("adminGoodsMapper.deletePlace", placeNo);
	}

	@Override
	public int deleteGoods(SqlSessionTemplate sst, String goodsNo) {
		return sst.update("adminGoodsMapper.deleteGoods", goodsNo);
	}

	//공유물 등록
	@Override
	public int addList(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.insert("adminGoodsMapper.addList", map);
	}

	//검색결과 수
	@Override
	public int selectGoodsTotalKeyword(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.selectOne("adminGoodsMapper.selectGoodsTotalKeyword", map);
	}

	@Override
	public List<GoodsVo> selectSearchGoodsList(SqlSessionTemplate sst, PageVo pv, HashMap<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("adminGoodsMapper.selectSearchGoodsList", map, rb);
	}

	@Override
	public int selectPlaceTotalKeyword(SqlSessionTemplate sst, HashMap<String, String> map) {
		return sst.selectOne("adminGoodsMapper.selectPlaceTotalKeyword", map);
	}

	@Override
	public List<PlaceVo> selectSearchPlaceList(SqlSessionTemplate sst, PageVo pv, HashMap<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("adminGoodsMapper.selectSearchPlaceList", map, rb);
	}

}
