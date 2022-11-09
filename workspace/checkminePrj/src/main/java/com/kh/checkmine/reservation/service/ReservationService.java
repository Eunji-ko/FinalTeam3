package com.kh.checkmine.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;
import com.kh.checkmine.reservation.vo.PlaceVo;

public interface ReservationService {

	//내가 예약한 공유물
	List<GoodsBookVo> selectListGoods(String no, PageVo pv);
	
	//내가 예약한 공유물 총갯수
	int goodsrsvTotalCount(String no);

	//내가 예약한 장소
	List<PlaceBookVo> selectListPlace(String no, PageVo pv);

	//내가 예약한 장소 총갯수
	int placersvTotalCount(String no);
	
	//공유물 예약 취소
	int goodsDelbtn(GoodsBookVo vo);

	//장소 예약 취소
	int placeDelbtn(PlaceBookVo vo);

	//빔
	List<GoodsVo> selectBimList();

	//빔 예약
	int insertRsvb(GoodsBookVo vo);

	//빔 예약 목록
	List<GoodsBookVo> selectListBimRsv(PageVo pv);

	//빔 예약 총갯수
	int bimrsvTotalCount();

	//차
	List<GoodsVo> selectCarList();

	//차 예약
	int insertRsvc(GoodsBookVo vo);

	//차 예약 목록
	List<GoodsBookVo> selectListCarRsv(PageVo pv);

	//차 예약 총갯수
	int carrsvTotalCount();

	//회의실
	List<PlaceVo> selectLiList();

	//회의실 예약
	int insertRsvl(PlaceBookVo vo);

	//회의실 예약 목록
	List<PlaceBookVo> selectListLiRsv(PageVo pv);

	//회의실 예약 총갯수
	int lirsvTotalCount();

}
