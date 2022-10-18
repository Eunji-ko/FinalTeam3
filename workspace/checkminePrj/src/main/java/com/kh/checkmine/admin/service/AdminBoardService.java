package com.kh.checkmine.admin.service;

import java.util.List;

import com.kh.checkmine.board.vo.BoardVo;

public interface AdminBoardService {

	//게시물 리스트
	List<BoardVo> boardList();

}
