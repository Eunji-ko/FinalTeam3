package com.kh.checkmine.admin.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminDao;
import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardVo;

@Service
public class AdminServiceImpl implements AdminService{
	
	private final AdminDao dao;
	private final SqlSessionTemplate sst;
	private final PasswordEncoder pwdEncoder;
	
	@Autowired
	public AdminServiceImpl(AdminDao dao, SqlSessionTemplate sst, PasswordEncoder pwdEncoder) {
		this.dao = dao;
		this.sst = sst;
		this.pwdEncoder = pwdEncoder;
	}


	//로그인
	@Override
	public AdminVo login(AdminVo vo) {
		
		AdminVo loginAdmin = dao.selectOneById(vo, sst);
		
		//암호화된 비밀번호와 비교
		if(loginAdmin != null && pwdEncoder.matches(vo.getPwd(), loginAdmin.getPwd())) {
			return loginAdmin;
		}
		
		return null;
		
	}


	//홈 > 요약 정보
	 @Override 
	 public HashMap<String, Integer> summary() { 
		HashMap<String, Integer> summary = dao.summary(sst);
	  
		return summary; 
	 }

	 //홈 > 게시글 리스트
	@Override
	public List<BoardVo> boardList() {
		List<BoardVo> boardList = dao.selectBoardList(sst);
		return boardList;
	}
	 
	 
	 
	
	

}
