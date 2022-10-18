package com.kh.checkmine.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.admin.dao.AdminBoardDao;
import com.kh.checkmine.board.vo.BoardVo;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{
	
	private final SqlSessionTemplate sst;
	private final AdminBoardDao dao;

	@Autowired
	public AdminBoardServiceImpl(SqlSessionTemplate sst, AdminBoardDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	@Override
	public List<BoardVo> boardList() {
		List<BoardVo> boardList = dao.selectBoardList(sst);
		return boardList;
	}
	

}
