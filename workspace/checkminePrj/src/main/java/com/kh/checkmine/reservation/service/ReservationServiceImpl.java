package com.kh.checkmine.reservation.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.reservation.dao.ReservationDao;

@Service
public class ReservationServiceImpl implements ReservationService {

	private final ReservationDao rd;
	private final SqlSessionTemplate sst;

	@Autowired
	public ReservationServiceImpl(ReservationDao rd, SqlSessionTemplate sst) {
		this.rd = rd;
		this.sst = sst;
	}
	
}
