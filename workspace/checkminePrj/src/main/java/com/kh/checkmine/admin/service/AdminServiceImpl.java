package com.kh.checkmine.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminDao;
import com.kh.checkmine.admin.vo.AdminVo;

@Service
public class AdminServiceImpl implements AdminService{
	
	private final AdminDao dao;
	private final SqlSessionTemplate sst;
	private final PasswordEncoder pwdEncoder;
	
	
	public AdminServiceImpl(AdminDao dao, SqlSessionTemplate sst, PasswordEncoder pwdEncoder) {
		this.dao = dao;
		this.sst = sst;
		this.pwdEncoder = pwdEncoder;
	}



	//로그인
	@Override
	public AdminVo login(AdminVo vo) {
		
		AdminVo loginAdmin = dao.selectOneById(vo, sst);
		
		System.out.println(loginAdmin);
		
		//암호화된 비밀번호와 비교
		if(pwdEncoder.matches(vo.getPwd(), loginAdmin.getPwd())) {
			return loginAdmin;
		}else {
			return null;
		}
		
	}


	//홈 > 요약 정보
	@Override
	public int[] summary() {
		
		return null;
	}
	
	

}
