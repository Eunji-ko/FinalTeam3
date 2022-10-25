package com.kh.checkmine.admin.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	//로그인
	@Override
	public AdminVo selectOneById(AdminVo vo, SqlSessionTemplate sst) {
		return sst.selectOne("adminMapper.selectOneById", vo);
	}

	//요약
	 @Override 
	 public HashMap<String, Integer> summary(SqlSessionTemplate sst) { 
		return sst.selectOne("adminMapper.summary"); 
		 }

	 //게시글 리스트
	@Override
	public List<BoardVo> selectBoardList(SqlSessionTemplate sst) {
		return sst.selectList("boardMapper.selectBoardList"); 
	}

	//사원 리스트
	@Override
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst) {
		return sst.selectList("adminMemberMapper.selectMemberByDate"); 
	}

	//예약 리스트
	@Override
	public List<PlaceBookVo> selectBookList(SqlSessionTemplate sst) {
		return sst.selectList("adminGoodsMapper.selectBookListByDate"); 
	}
	 
	 

	
	

}
