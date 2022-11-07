package com.kh.checkmine.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.GoodsVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

public interface ReservationService {

	//내가 예약한 공유물
	List<GoodsBookVo> selectListGoods(String no);

	//내가 예약한 장소
	List<PlaceBookVo> selectListPlace(String no);

	//공유물 예약 취소
	int goodsDelbtn(GoodsBookVo vo);

	//장소 예약 취소
	int placeDelbtn(PlaceBookVo vo);

	//빔
	List<GoodsVo> selectList();

}
