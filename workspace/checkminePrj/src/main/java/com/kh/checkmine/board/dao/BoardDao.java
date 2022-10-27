package com.kh.checkmine.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface BoardDao {

	//게시물 리스트 - 공지사항
	int selectTotalCnt(SqlSessionTemplate sst, String type);

	List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	//검색
	int selectTotalKeyword(SqlSessionTemplate sst, String keyword);

	List<BoardVo> selectBoardKeyword(SqlSessionTemplate sst, PageVo pv, String keyword);

}
