package com.kh.checkmine.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminBoardDao;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{
	
	private final SqlSessionTemplate sst;
	private final AdminBoardDao dao;
	
	@Autowired
	public AdminBoardServiceImpl(SqlSessionTemplate sst, AdminBoardDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	//게시물 리스트
	@Override
	public List<BoardVo> boardList(PageVo pv, String sort) {
		List<BoardVo> boardList = dao.selectBoardList(sst, pv, sort);
		return boardList;
	}

	//게시글 수
	@Override
	public int selectTotalCnt(String sort) {
		int total = dao.selectBoardTotal(sst, sort);
		
		return total;
	}

	

}
