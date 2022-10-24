package com.kh.checkmine.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminGoodsDao;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService{
	
	private final AdminGoodsDao dao;
	private final SqlSessionTemplate sst;

	public AdminGoodsServiceImpl(AdminGoodsDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//공유물 수 
	@Override
	public int selectTotalCnt(String sort) {
		int total = dao.selectGoodsTotal(sst, sort);
		return total;
	}

	//게시물 리스트
	
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
	
	
}
