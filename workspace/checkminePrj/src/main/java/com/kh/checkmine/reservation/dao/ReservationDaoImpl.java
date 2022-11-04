package com.kh.checkmine.reservation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	//내가 예약한 공유물
	@Override
	public List<GoodsBookVo> selectListGoods(String no, SqlSessionTemplate sst) {
		return sst.selectList("reservationGoodsMapper.selectListGoods", no);
	}

	//내가 예약한 장소
	@Override
	public List<PlaceBookVo> selectListPlace(String no, SqlSessionTemplate sst) {
		return sst.selectList("reservationPlaceMapper.selectListPlace", no);
	}

	//공유물 예약 취소
	@Override
	public int goodsDelbtn(GoodsBookVo vo, SqlSessionTemplate sst) {
		return sst.delete("reservationGoodsMapper.goodsDelbtn", vo);
	}

	//장소 예약 취소
	@Override
	public int placeDelbtn(PlaceBookVo vo, SqlSessionTemplate sst) {
		return sst.delete("reservationPlaceMapper.placeDelbtn", vo);
	}

}
