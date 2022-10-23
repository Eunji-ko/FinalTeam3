package com.kh.checkmine.commute.service;

import java.util.List;

import com.kh.checkmine.commute.vo.CommuteVo;

public interface CommuteService {

	//나의근태조회
	List<CommuteVo> selectList();

}
