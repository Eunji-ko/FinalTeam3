package com.kh.checkmine.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

public interface ReservationDao {

	//내가 예약한 공유물
	List<GoodsBookVo> selectListGoods(String no, SqlSessionTemplate sst);

	//내가 예약한 장소
	List<PlaceBookVo> selectListPlace(String no, SqlSessionTemplate sst);

}
