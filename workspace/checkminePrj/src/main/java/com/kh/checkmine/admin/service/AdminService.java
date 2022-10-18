package com.kh.checkmine.admin.service;

import java.util.HashMap;
import java.util.List;

import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardVo;

public interface AdminService {
	
	//로그인
	AdminVo login(AdminVo vo);

	
	//사원정보 변동 수, 총 사원 수, 등록된 게시물수, 오늘 예약건 
	HashMap<String, Integer> summary();

	//게시글 리스트
	List<BoardVo> boardList();
	 

}
