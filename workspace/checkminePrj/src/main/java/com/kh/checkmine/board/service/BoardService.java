package com.kh.checkmine.board.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface BoardService {

	//게시물 조회 - 공지사항
	int selectTotalCnt(String type);

	List<BoardVo> selectBoardList(PageVo pv, Map<String, String> map);

	//검색
	int selectKeywordCnt(String keyword);

	List<BoardVo> selectBoardKeyword(PageVo pv, String keyword);


	

}
