package com.kh.checkmine.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.admin.vo.AdminVo;

public interface AdminDao {
	
	//selectOne(로그인)
	AdminVo selectOneById(AdminVo vo, SqlSessionTemplate sst);

	
	/*
	 * //요약 int[] summary(SqlSessionTemplate sst);
	 */

}
