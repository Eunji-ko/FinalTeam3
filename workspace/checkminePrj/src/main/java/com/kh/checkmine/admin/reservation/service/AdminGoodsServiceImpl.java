package com.kh.checkmine.admin.reservation.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.reservation.dao.AdminGoodsDao;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService{
	
	private final AdminGoodsDao dao;
	private final SqlSessionTemplate sst;

	public AdminGoodsServiceImpl(AdminGoodsDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//총 공유물 수 
	@Override
	public int selectTotalCnt(String sort) {
		int total = dao.selectGoodsTotal(sst, sort);
		return total;
	}

	//공유물 리스트
	@Override
	public List<GoodsVo> selectGoodsList(PageVo pv, String sort) {
		List<GoodsVo> goodsList = dao.selectGoodsList(sst, pv, sort);
		return goodsList;
	}

	@Override
	public List<PlaceVo> selectPlaceList(PageVo pv, String sort) {
		List<PlaceVo> goodsList = dao.selectPlaceList(sst, pv, sort);
		return goodsList;
	}

	//예약 리스트
	@Override
	public List<PlaceBookVo> selectPlaceBook(String no) {
		List<PlaceBookVo> bookList = dao.selectPlaceBook(sst, no);
		return bookList;
	}

	@Override
	public List<GoodsBookVo> selectGoodsBook(String no) {
		List<GoodsBookVo> bookList = dao.selectGoodsBook(sst, no);
		return bookList;
	}

	//항목 삭제
	@Override
	public int deletePlace(String placeNo) {
		int result = dao.deletePlace(sst, placeNo);
		return result;
	}

	@Override
	public int deleteGoods(String GoodsNo) {
		int result = dao.deleteGoods(sst, GoodsNo);
		return result;
	}

	//공유물 등록
	@Override
	public int addList(HashMap<String, String> map) {
		int result = dao.addList(sst, map);
		return result;
	}

	//검색 결과 수 goods
	@Override
	public int selectKeywordGoodsCnt(HashMap<String, String> map) {
		int total = dao.selectGoodsTotalKeyword(sst, map);
		return total;
	}

	//검색 결과 - goods
	@Override
	public List<GoodsVo> selectGoodsKeyword(PageVo pv, HashMap<String, String> map) {
		List<GoodsVo> goodsList = dao.selectSearchGoodsList(sst, pv, map);
		return goodsList;
	}

	
	//검색 결과 수 place
	@Override
	public int selectKeywordPlaceCnt(HashMap<String, String> map) {
		int total = dao.selectPlaceTotalKeyword(sst, map);
		return total;
	}
	
	//검색 결과 - place
	@Override
	public List<PlaceVo> selectPlaceKeyword(PageVo pv, HashMap<String, String> map) {
		List<PlaceVo> goodsList = dao.selectSearchPlaceList(sst, pv, map);
		return goodsList;
	}
	
	
}
