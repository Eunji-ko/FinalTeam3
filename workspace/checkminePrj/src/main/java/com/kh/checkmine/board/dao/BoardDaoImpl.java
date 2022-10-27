package com.kh.checkmine.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{

	//게시물 리스트
	@Override
	public int selectTotalCnt(SqlSessionTemplate sst, String type) {
		return sst.selectOne("boardMapper.selectTotalCnt", type);
	}

	@Override
	public List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("boardMapper.selectBoardListByType", map, rb); 
	}

	//검색
	@Override
	public int selectTotalKeyword(SqlSessionTemplate sst, String keyword) {
		return sst.selectOne("boardMapper.selectTotalCntByKeyword", keyword);
	}

	@Override
	public List<BoardVo> selectBoardKeyword(SqlSessionTemplate sst, PageVo pv, String keyword) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("boardMapper.selectBoardListByKeyword", keyword, rb);
	}

}
