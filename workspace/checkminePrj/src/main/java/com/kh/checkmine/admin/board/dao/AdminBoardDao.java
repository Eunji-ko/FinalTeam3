package com.kh.checkmine.admin.board.dao;

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
	int delete(SqlSessionTemplate sst, String boardNo);

	List<BoardVo> selectBoardKeyword(SqlSessionTemplate sst, PageVo pv, Map<String, String> map);

	
	//게시글 수 + 검색
	int selectTotalKeyword(SqlSessionTemplate sst, Map<String, String> map);

	
	//공지사항 올리기
	int insertBoard(SqlSessionTemplate sst, BoardVo boardVo);

	int insertBoardAtt(SqlSessionTemplate sst, List<BoardAttVo> attVoList);

	
	//상세보기
	BoardVo selectOne(SqlSessionTemplate sst, String no);

	List<BoardAttVo> selectAtt(SqlSessionTemplate sst, String no);

	int increaseHit(SqlSessionTemplate sst, String no);

	
	//수정
	int edit(SqlSessionTemplate sst, BoardVo boardVo);

	int edit(SqlSessionTemplate sst, List<BoardAttVo> attVoList);

	int deleteAtt(SqlSessionTemplate sst, BoardVo boardVo);

	//영구삭제
	int hardDelete(SqlSessionTemplate sst, String boardNo);

	//게시글 복원
	int restoreBoard(SqlSessionTemplate sst, String boardNo);

	//삭제된 게시글 관리
	int selectDeleteTotalCnt(SqlSessionTemplate sst, String sort);

	List<BoardVo> selectDeleteList(SqlSessionTemplate sst, PageVo pv, String sort);
	
	

}
