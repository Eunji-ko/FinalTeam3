package com.kh.checkmine.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao{
	
	//게시글 조회
	@Override
	public List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, String sort) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("boardMapper.selectBoardList", sort, rb); 
	}

	//게시글 수
	@Override
	public int selectBoardTotal(SqlSessionTemplate sst, String sort) {
		return sst.selectOne("boardMapper.selectBoardTotal", sort);
	}

	//게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, int boardNo) {
		return sst.update("boardMapper.deleteBoard", boardNo);
	}

	//게시물 검색
	@Override
	public List<BoardVo> selectBoardKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("boardMapper.selectBoardKeyword", map, rb);
	}

	//게시글 수 + 검색
	@Override
	public int selectTotalKeyword(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("boardMapper.selectTotalKeyword", map);
	}

	//공지사항 올리기
	@Override
	public int insertBoard(SqlSessionTemplate sst, BoardVo vo) {
		return sst.insert("boardMapper.insertBoard", vo);
	}

	@Override
	public int insertBoardAtt(SqlSessionTemplate sst, BoardAttVo attVo) {
		return sst.insert("boardMapper.insertBoardAtt", attVo);
	}

}
