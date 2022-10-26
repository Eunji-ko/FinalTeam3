package com.kh.checkmine.commute.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.commute.dao.CommuteDao;
import com.kh.checkmine.commute.vo.CommuteVo;

@Service
public class CommuteServiceImpl implements CommuteService {

	private final CommuteDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public CommuteServiceImpl(CommuteDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//나의근태조회
	@Override
	public List<CommuteVo> selectList() {
		return dao.selectList(sst);
	}

	//출근 확인
	@Override
	public int arrived(CommuteVo vo) {
		return dao.insertArrived(vo, sst);
	}

	//퇴근 확인
	@Override
	public int leave(CommuteVo vo) {
		return dao.updateLeave(vo, sst);
	}

}
