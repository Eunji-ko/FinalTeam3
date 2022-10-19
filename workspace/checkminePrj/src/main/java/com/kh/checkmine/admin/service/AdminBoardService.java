package com.kh.checkmine.admin.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface AdminBoardService {

	//게시물 리스트
	List<BoardVo> selectBoardList(PageVo pv, String sort);

	//총 게시글 수
	int selectTotalCnt(String sort);

	//게시글 삭제
	int delete(int boardNo);

	//게시글 검색
	List<BoardVo> selectBoardKeyword(PageVo pv, Map<String, String> map);

	//검색결과 게시글 수
	int selectKeywordCnt(Map<String, String> map);



}
