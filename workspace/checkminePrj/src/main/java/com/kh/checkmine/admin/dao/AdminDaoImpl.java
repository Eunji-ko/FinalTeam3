package com.kh.checkmine.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.admin.vo.AdminVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	//로그인
	@Override
	public AdminVo selectOneById(AdminVo vo, SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.selectOneById", vo);
	}

	/*
	 * @Override public int[] summary(SqlSessionTemplate sst) { return
	 * sst.selectOne("adminMapper.summary"); }
	 */

	
	

}
