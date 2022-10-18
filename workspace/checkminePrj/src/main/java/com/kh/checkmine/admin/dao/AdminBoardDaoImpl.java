package com.kh.checkmine.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao{
	
	//게시글 조회
	@Override
	public List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, String sort) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		System.out.println();
		return sst.selectList("boardMapper.selectBoardList", sort, rb); 
	}

	//게시글 수
	@Override
	public int selectBoardTotal(SqlSessionTemplate sst, String sort) {
		return sst.selectOne("boardMapper.selectBoardTotal", sort);
	}

}
