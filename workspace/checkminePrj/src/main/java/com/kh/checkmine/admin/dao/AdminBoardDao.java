package com.kh.checkmine.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface AdminBoardDao {

	//게시글 조회
	List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, String sort);

	//게시글 수
	int selectBoardTotal(SqlSessionTemplate sst, String sort);
	
	

}
