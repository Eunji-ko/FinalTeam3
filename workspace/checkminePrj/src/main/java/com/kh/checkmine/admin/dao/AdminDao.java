package com.kh.checkmine.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

public interface AdminDao {
	
	//selectOne(로그인)
	AdminVo selectOneById(AdminVo adminVo, SqlSessionTemplate sst);

	//요약 
	HashMap<String, Integer> summary(SqlSessionTemplate sst);

	//게시글 리스트
	List<BoardVo> selectBoardList(SqlSessionTemplate sst);

	//사원변동 리스트
	List<MemberVo> selectMemberList(SqlSessionTemplate sst);

	//예약 리스트
	List<PlaceBookVo> selectBookList(SqlSessionTemplate sst);
}
