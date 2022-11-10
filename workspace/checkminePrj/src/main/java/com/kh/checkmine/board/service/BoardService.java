package com.kh.checkmine.board.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface BoardService {

	//게시물 리스트
	int selectTotalCnt(String type);

	List<BoardVo> selectBoardList(PageVo pv, Map<String, String> map);

	//검색
	int selectKeywordCnt(String keyword);

	List<BoardVo> selectBoardKeyword(PageVo pv, String keyword);

	//글 작성
	int insertBoard(BoardVo vo, List<BoardAttVo> attVoList);

	int insertBoard(BoardVo boardVo);

	//게시글 상세보기
	BoardVo selectOne(String no);

	List<BoardAttVo> selectAttList(String no);

	//추천
	int recommend(Map<String, String> map);

	//추천수만 가져오기
	String selectBoardRecommend(String bNo);

	//추천 기록
	int selectRecommend(Map<String, String> map);

	//추천 삭제
	int recommendDelete(Map<String, String> map);

	//게시글 삭제
	int delete(String boardNo);

	//게시글 수정
	int edit(BoardVo boardVo, List<BoardAttVo> attVoList, List<BoardAttVo> existFileList);

	int edit(BoardVo boardVo);
}
