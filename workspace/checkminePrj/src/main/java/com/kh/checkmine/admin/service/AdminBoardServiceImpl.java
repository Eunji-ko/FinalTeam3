package com.kh.checkmine.admin.service;

import java.util.List;
import java.util.Map;

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
	public List<BoardVo> selectBoardList(PageVo pv, String sort) {
		List<BoardVo> boardList = dao.selectBoardList(sst, pv, sort);
		return boardList;
	}

	//게시글 수
	@Override
	public int selectTotalCnt(String sort) {
		int total = dao.selectBoardTotal(sst, sort);
		
		return total;
	}

	//게시글 삭제
	@Override
	public int delete(int boardNo) {
		int result = dao.delete(sst, boardNo);
		return result;
	}

	//게시글 검색
	@Override
	public List<BoardVo> selectBoardKeyword(PageVo pv, Map<String, String> map) {
		
		List<BoardVo> boardList = dao.selectBoardKeyword(sst, pv, map);
		
		return boardList;
	}

	//검색 결과 게시글 수
	@Override
	public int selectKeywordCnt(Map<String, String> map) {
		int total = dao.selectTotalKeyword(sst, map);
		return total;
	}

	

	

}
