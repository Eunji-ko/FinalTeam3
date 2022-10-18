package com.kh.checkmine.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmine.board.vo.BoardVo;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao{
	
	//게시글 조회
	@Override
	public List<BoardVo> selectBoardList(SqlSessionTemplate sst) {
		return sst.selectList("boardMapper.selectBoardList"); 
	}

}
