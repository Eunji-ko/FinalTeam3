package com.kh.checkmine.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.checkmine.board.service.BoardService;
import com.kh.checkmine.board.service.ReplyService;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;

@Controller
@RequestMapping("board")
public class BoardController {
	
	private final BoardService service;
	private final ReplyService rs;
	
	@Autowired
	public BoardController(BoardService service, ReplyService rs) {
		this.service = service;
		this.rs = rs;	
	}
	
	//게시물 조회
	@GetMapping("list/{type}")
	public String notice(@PathVariable String type, @RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "l") String sort, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("sort", sort);
		
		int totalCount = service.selectTotalCnt(type);

		PageVo pv = null;
		if("gallery".equals(type)) {
			pv = Pagination.getPageVo(totalCount, pno, 5, 8);
		}else {
			pv = Pagination.getPageVo(totalCount, pno, 5, 14);
		}
		

		List<BoardVo> boardList = service.selectBoardList(pv, map);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("type", type);
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);

		
		return "board/"+type+"List";
	}
	
	//게시물 검색
	@GetMapping("search")
	public String search(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam String keyword, Model model) {

		int totalCount = service.selectKeywordCnt(keyword);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 14);
		
		List<BoardVo> boardList = service.selectBoardKeyword(pv, keyword);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pv", pv);
		model.addAttribute("keyword", keyword);
		
		return "board/boardSearch";
	}
	
	//글 작성
	@GetMapping("write")
	public String write() {

		return "board/boardWrite";
	}

}
