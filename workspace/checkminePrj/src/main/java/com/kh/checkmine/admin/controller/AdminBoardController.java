package com.kh.checkmine.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.checkmine.admin.service.AdminBoardService;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;

@Controller
@RequestMapping("admin/board")
public class AdminBoardController {
	
	private final AdminBoardService service;
	
	@Autowired
	public AdminBoardController(AdminBoardService service) {
		this.service = service;	
	}
	
	//게시물 조회
	@GetMapping("list")
	public String list(@RequestParam("p") int pno, @RequestParam("sort") String sort, Model model) {
		
		
		int totalCount = service.selectTotalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		System.out.println(sort);
		List<BoardVo> boardList = service.boardList(pv, sort);
		model.addAttribute("boardList", boardList);
		
		
		return "admin/adminBoard";
		
	}

}
