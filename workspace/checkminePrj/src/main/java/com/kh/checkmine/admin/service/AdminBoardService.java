package com.kh.checkmine.admin.service;

import java.util.List;

import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;

public interface AdminBoardService {

	//게시물 리스트
	List<BoardVo> boardList(PageVo vo, String sort);

	//총 게시글 수
	int selectTotalCnt();


}
