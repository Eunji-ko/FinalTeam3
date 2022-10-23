package com.kh.checkmine.commute.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.commute.vo.CommuteVo;

public interface CommuteDao {

	//나의근태조회
	List<CommuteVo> selectList(SqlSessionTemplate sst);

}
