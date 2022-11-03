package com.kh.checkmine.reservation.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.reservation.dao.ReservationDao;
import com.kh.checkmine.reservation.vo.GoodsBookVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

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
	public List<GoodsBookVo> selectListGoods(String no) {
		return dao.selectListGoods(no, sst);
	}

	//내가 예약한 장소
	@Override
	public List<PlaceBookVo> selectListPlace(String no) {
		return dao.selectListPlace(no, sst);
	}
	
}
