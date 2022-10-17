package com.kh.checkmine.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardVo;

public interface AdminDao {
	
	//selectOne(로그인)
	AdminVo selectOneById(AdminVo vo, SqlSessionTemplate sst);

	
	
	//요약 
	HashMap<String, Integer> summary(SqlSessionTemplate sst);


	//게시글 리스트
	List<BoardVo> selectBoardList(SqlSessionTemplate sst);
	 

}
