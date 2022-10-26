package com.kh.checkmine.commute.service;

import java.util.List;

import com.kh.checkmine.commute.vo.CommuteVo;

public interface CommuteService {

	//나의근태조회
	List<CommuteVo> selectList();

	//출근 확인
	int arrived(CommuteVo vo);

	//퇴근 확인
	int leave(CommuteVo vo);

}
