package com.kh.checkmine.reservation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.dao.ReservationDao;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

@Service
public class ReservationServiceImpl implements ReservationService {

	private final ReservationDao dao;
	private final SqlSessionTemplate sst;

	@Autowired
	public ReservationServiceImpl(ReservationDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//내가 예약한 공유물
	@Override
	public List<GoodsBookVo> selectListGoods(String no, PageVo pv) {
		return dao.selectListGoods(no, pv, sst);
	}
	
	//내가 예약한 공유물 총갯수
	@Override
	public int goodsrsvTotalCount(String no) {
		return dao.goodsrsvTotalCount(no, sst);
	}

	//내가 예약한 장소
	@Override
	public List<PlaceBookVo> selectListPlace(String no, PageVo pv) {
		return dao.selectListPlace(no, pv, sst);
	}

	//내가 예약한 장소 총갯수
	@Override
	public int placersvTotalCount(String no) {
		return dao.placersvTotalCount(no, sst);
	}

	//공유물 예약 취소
	@Override
	public int goodsDelbtn(GoodsBookVo vo) {
		return dao.goodsDelbtn(vo, sst);
	}

	//장소 예약 취소
	@Override
	public int placeDelbtn(PlaceBookVo vo) {
		return dao.placeDelbtn(vo, sst);
	}

	//빔
	@Override
	public List<GoodsVo> selectBimList() {
		return dao.selectBimList(sst);
	}

	//빔 예약
	@Override
	public int insertRsvb(GoodsBookVo vo) {
		
		//검증
		int revCount = dao.selectRevCount(vo, sst);

		//예약
		if(revCount <= 1) {
			int revResult = dao.insertRsvb(vo, sst);
			return revResult; 
		} else {
			return 0;
		}
		
	}

	//빔 예약 목록
	@Override
	public List<GoodsBookVo> selectListBimRsv(PageVo pv) {
		return dao.selectListBimRsv(pv, sst);
	}

	//빔 예약 총갯수
	@Override
	public int bimrsvTotalCount() {
		return dao.bimrsvTotalCount(sst);
	}

	//차
	@Override
	public List<GoodsVo> selectCarList() {
		return dao.selectCarList(sst);
	}

	//차 예약
	@Override
	public int insertRsvc(GoodsBookVo vo) {
		int revCount = dao.selectRevCount(vo, sst);
		
		if(revCount <= 1) {
			int revResult = dao.insertRsvc(vo, sst);
			return revResult; 
		} else {
			return 0;
		}
	}

	//차 예약 목록
	@Override
	public List<GoodsBookVo> selectListCarRsv(PageVo pv) {
		return dao.selectListCarRsv(pv, sst);
	}

	//차 예약 총갯수
	@Override
	public int carrsvTotalCount() {
		return dao.carrsvTotalCount(sst);
	}

	//응접실
	@Override
	public List<PlaceVo> selectLiList() {
		return dao.selectLiList(sst);
	}

	//응접실 예약
	@Override
	public int insertRsvl(PlaceBookVo vo) {
		int revCount = dao.selectRsvp(vo, sst);
		
		if(revCount <= 1) {
			int revResult = dao.insertRsvl(vo, sst);
			return revResult; 
		} else {
			return 0;
		}
	}

	//응접실 예약 목록
	@Override
	public List<PlaceBookVo> selectListLiRsv(PageVo pv) {
		return dao.selectListLiRsv(pv, sst);
	}

	//응접실 예약 총갯수
	@Override
	public int lirsvTotalCount() {
		return dao.lirsvTotalCount(sst);
	}

	//회의실
	@Override
	public List<PlaceVo> selectMeList() {
		return dao.selectMeList(sst);
	}

	//회의실 예약
	@Override
	public int insertRsvm(PlaceBookVo vo) {
		int revCount = dao.selectRsvp(vo, sst);
		
		if(revCount <= 1) {
			int revResult = dao.insertRsvm(vo, sst);
			return revResult; 
		} else {
			return 0;
		}
	}

	//회의실 예약 목록
	@Override
	public List<PlaceBookVo> selectListMeRsv(PageVo pv) {
		return dao.selectListMeRsv(pv, sst);
	}

	//회의실 예약 총갯수
	@Override
	public int mersvTotalCount() {
		return dao.mersvTotalCount(sst);
	}

}
