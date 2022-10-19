package com.kh.checkmine.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.checkmine.admin.service.AdminBoardService;
import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardAttVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.FileUploader;
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
		
		int totalCount = service.selectTotalCnt(sort);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<BoardVo> boardList = service.selectBoardList(pv, sort);
		model.addAttribute("boardList", boardList);
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);
		return "admin/adminBoard";
		
	}
	
	//게시물 선택삭제
	@PostMapping("delete")
	@ResponseBody
	public String delete(@RequestParam(value="checkArr[]") ArrayList<Integer> checkArr, HttpSession session) {
	
		 
		 for(int i = 0; i < checkArr.size(); i++) { 
			 int result = service.delete(checkArr.get(i));
		 if(result == -1) { 
			 session.setAttribute("msg", "게시글 삭제 실패"); 
			 return "fail"; 
			 }
		 }
		 
		return "ok";
		
	}
	
	//게시물 검색
	@GetMapping("search")
	public String search(@RequestParam(name = "p") int pno, @RequestParam String option, @RequestParam String keyword, Model model) {
		Map<String, String> map = new HashMap<>(2);
		map.put("option", option);
		map.put("keyword", keyword);
		int totalCount = service.selectKeywordCnt(map);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<BoardVo> boardList = service.selectBoardKeyword(pv, map);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pv", pv);
		model.addAttribute("option", option);
		model.addAttribute("keyword", keyword);
		
		return "admin/adminBoardSearch";
	}
	
	//공지사항 작성 페이지
	@GetMapping("write")
	public String write() {
		return "admin/adminNoticeWrite";
	}
	
	//공지사항 작성
	@PostMapping("write")
	public String write(BoardVo vo,  MultipartFile[] file, HttpServletRequest req, HttpSession session) {
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
		
		
		//파일 업로드 후 attVo에 담기
//		if(!) {
//			String savePath = req.getServletContext().getRealPath("/resources/upload/board/");
//			String changeName = FileUploader.fileUpload(attVo.getAttach(), savePath);
//			attVo.setName(changeName);
//			
			System.out.println(file.length);
		
		
		
		
		
		
		
		
			
			return "";
			
			
			
			
		
	
		
	}
	
	
	//상세보기
	
	
	
	//댓글
	
	

}
