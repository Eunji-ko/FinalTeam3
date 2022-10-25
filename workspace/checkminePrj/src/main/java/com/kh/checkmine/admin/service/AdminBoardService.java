package com.kh.checkmine.admin.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface AdminBoardService {

	//게시물 리스트
	List<BoardVo> selectBoardList(PageVo pv, String sort);

	//총 게시글 수
	int selectTotalCnt(String sort);

	//게시글 삭제
	int delete(String boardNo);

	//게시글 검색
	List<BoardVo> selectBoardKeyword(PageVo pv, Map<String, String> map);

	//검색결과 게시글 수
	int selectKeywordCnt(Map<String, String> map);

	//게시글 올리기+첨부파일
	int insertBoard(BoardVo vo, List<BoardAttVo> attVoList);

	//게시글 올리기
	int insertBoard(BoardVo vo);

	//상세보기
	BoardVo selectOne(String no);

	List<BoardAttVo> selectAttList(String no);

	
	//게시물 수정
	int edit(BoardVo vo, List<BoardAttVo> attVoList);

	int edit(BoardVo vo);





}
