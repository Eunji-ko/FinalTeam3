package com.kh.checkmine.commute.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.commute.vo.CommuteVo;

public interface CommuteDao {

	//나의근태조회
	List<CommuteVo> selectListOne(String no, PageVo pv, SqlSessionTemplate sst);

	//출근 확인
	int insertArrived(CommuteVo vo, SqlSessionTemplate sst);

	//퇴근 확인
	int updateLeave(CommuteVo vo, SqlSessionTemplate sst);

	//전체 근태기록
	List<CommuteVo> selectList(SqlSessionTemplate sst, PageVo pv);

	//전체 근태 갯수 조회
	int selectCountAll(SqlSessionTemplate sst);

}
