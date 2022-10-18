package com.kh.checkmine.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.admin.service.AdminBoardService;
import com.kh.checkmine.board.vo.BoardVo;

@Controller
@RequestMapping("admin/board")
public class AdminBoardController {
	
	private final AdminBoardService service;
	
	@Autowired
	public AdminBoardController(AdminBoardService service) {
		this.service = service;	
	}
	
	//게시물 조회
	@GetMapping("list/{pno}")
	public String list(@PathVariable int pno, Model model) {
		
		List<BoardVo> boardList = service.boardList();
		model.addAttribute("boardList", boardList);
		
		
		return "admin/adminBoard";
		
	}

}
