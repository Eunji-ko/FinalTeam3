package com.kh.checkmine.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminDao;
import com.kh.checkmine.admin.vo.AdminVo;

@Service
public class AdminServiceImpl implements AdminService{
	
	private final AdminDao dao;
	private final SqlSessionTemplate sst;
	
	
	public AdminServiceImpl(AdminDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}



	//로그인
	@Override
	public AdminVo login(AdminVo vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
