package com.kh.checkmine.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface AdminBoardDao {

	//게시글 조회
	List<BoardVo> selectBoardList(SqlSessionTemplate sst, PageVo pv, String sort);

	//게시글 수
	int selectBoardTotal(SqlSessionTemplate sst, String sort);

	//게시글 삭제
	int delete(SqlSessionTemplate sst, int boardNo);

	List<BoardVo> selectBoardKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	//게시글 수 + 검색
	int selectTotalKeyword(SqlSessionTemplate sst, Map<String, String> map);

	
	//공지사항 올리기
	int insertBoard(SqlSessionTemplate sst, BoardVo vo);

	int insertBoardAtt(SqlSessionTemplate sst, List<BoardAttVo> attVoList);
	
	

}
