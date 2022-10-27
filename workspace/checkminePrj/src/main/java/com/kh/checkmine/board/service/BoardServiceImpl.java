package com.kh.checkmine.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmine.board.dao.BoardDao;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

@Service
public class BoardServiceImpl implements BoardService{
	
	private final SqlSessionTemplate sst;
	private final BoardDao dao;
	
	@Autowired
	public BoardServiceImpl(SqlSessionTemplate sst, BoardDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	//게시물 리스트 - 공지사항
	@Override
	public int selectTotalCnt(String type) {
		int total = dao.selectTotalCnt(sst, type);
		return total;
	}

	@Override
	public List<BoardVo> selectBoardList(PageVo pv, Map<String, String> map) {
		List<BoardVo> boardList = dao.selectBoardList(sst, pv, map);
		return boardList;
	}

	//검색
	@Override
	public int selectKeywordCnt(String keyword) {
		int total = dao.selectTotalKeyword(sst, keyword);
		return total;
	}

	@Override
	public List<BoardVo> selectBoardKeyword(PageVo pv, String keyword) {
		List<BoardVo> boardList = dao.selectBoardKeyword(sst, pv, keyword);
		return boardList;
	}

	
}
