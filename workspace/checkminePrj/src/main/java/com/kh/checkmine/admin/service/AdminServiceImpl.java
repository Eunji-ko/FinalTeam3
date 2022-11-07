package com.kh.checkmine.admin.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminDao;
import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

@Service
public class AdminServiceImpl implements AdminService{
	
	private final AdminDao dao;
	private final SqlSessionTemplate sst;
	private final BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	public AdminServiceImpl(AdminDao dao, SqlSessionTemplate sst, BCryptPasswordEncoder pwdEncoder) {
		this.dao = dao;
		this.sst = sst;
		this.pwdEncoder = pwdEncoder;
	}

	//로그인
	@Override
	public AdminVo login(AdminVo adminVo) {
		
		AdminVo loginAdmin = dao.selectOneById(adminVo, sst);
		
		//암호화된 비밀번호와 비교
		if(loginAdmin != null && pwdEncoder.matches(adminVo.getPwd(), loginAdmin.getPwd())) {
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

	//홈 > 사원 변동 리스트
	@Override
	public List<MemberVo> MemberList() {
		List<MemberVo> memberList = dao.selectMemberList(sst);
		return memberList;
	}

	//홈 > 예약 리스트
	@Override
	public List<PlaceBookVo> bookList() {
		List<PlaceBookVo> bookList = dao.selectBookList(sst);
		return bookList;
	}
}
