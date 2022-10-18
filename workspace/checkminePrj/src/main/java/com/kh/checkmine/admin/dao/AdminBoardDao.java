package com.kh.checkmine.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.BoardVo;

public interface AdminBoardDao {

	//게시글 조회
	List<BoardVo> selectBoardList(SqlSessionTemplate sst);
	
	

}
