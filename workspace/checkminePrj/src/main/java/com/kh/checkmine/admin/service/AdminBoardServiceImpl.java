package com.kh.checkmine.admin.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.checkmine.admin.dao.AdminBoardDao;
import com.kh.checkmine.board.vo.BoardAttVo;
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

	//게시글 + 첨부파일
	@Override
	@Transactional
	public int insertBoard(BoardVo vo, List<BoardAttVo> attVoList) {
		
		//게시글
		int result1 = dao.insertBoard(sst, vo);

		//첨부파일
		int result2 = 1;
		for(int i = 0; i < attVoList.size(); i++) {
			
			result2 *= dao.insertBoardAtt(sst, attVoList.get(i));
		}
	
		return result1 * result2;
	}

	//게시글 올리기
	@Override
	public int insertBoard(BoardVo vo) {
		int result = dao.insertBoard(sst, vo);
		return result;
	}

	

	

}
