package com.kh.checkmine.admin.setting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.admin.board.service.AdminBoardService;
import com.kh.checkmine.admin.member.service.AdminMemberService;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;

/*
 * 관리자 > 설정
*/
@Controller
@RequestMapping("admin")
public class AdminSettingController {
	
	private final AdminMemberService memberService;
	private final AdminBoardService boardService;
	
	public AdminSettingController(AdminMemberService memberService, AdminBoardService boardService) {
		this.memberService = memberService;
		this.boardService = boardService;
		
	}
	
	 //설정 페이지
	 @GetMapping("setting/{type}")
	 public String setting(@PathVariable String type, @RequestParam(value = "p", defaultValue = "1") int pno, Model model) {
	    String sort = "y"; //삭제된 정보만 조회
	    
	    if("memberList".equals(type)) {
	    	int totalCount = memberService.selectTotalCnt(sort);
	    	PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
	    	
	    	List<MemberVo> memberList = memberService.selectMemberList(pv, sort);
	    	
	    	model.addAttribute("memberList", memberList);
	    	model.addAttribute("pv", pv);		    	
	    }else {
	    	int totalCount = boardService.selectDeleteTotalCnt(sort);
	    	PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 15);
			
			List<BoardVo> boardList = boardService.selectDeleteList(pv, sort);
			model.addAttribute("boardList", boardList);
			model.addAttribute("pv", pv);
	    }
		return "admin/setting/"+type;
	}
	  
  	//사원 정보 선택삭제 (영구 삭제)
	@PostMapping("setting/memberDelete")
	@ResponseBody
	public String memberDelete(@RequestParam(value="checkArr[]") ArrayList<String> checkArr, HttpSession session) {
	
		for(int i = 0; i < checkArr.size(); i++) { 
			 int result = memberService.delete(checkArr.get(i));
		 if(result == -1) { 
			 session.setAttribute("msg", "정보를 삭제하는데 문제가 발생하였습니다."); 
			 return "fail"; 
			 }
		 }
		return "ok";
	}
		
		
	//게시글 영구삭제
	@PostMapping("setting/deleteBoard")
	@ResponseBody
	public String deleteBoard(@RequestParam(value="checkArr[]") ArrayList<String> checkArr, HttpSession session) {
	
		for(int i = 0; i < checkArr.size(); i++) { 
			 int result = boardService.hardDelete(checkArr.get(i));
		 if(result == -1) { 
			 session.setAttribute("msg", "게시글을 삭제하는데 문제가 발생하였습니다."); 
			 return "fail"; 
			 }
		 } 
		return "ok";
	}
		
		
	//게시글 복원
	@PostMapping("setting/restoreBoard")
	@ResponseBody
	public String restoreBoard(@RequestParam(value="checkArr[]") ArrayList<String> checkArr, HttpSession session) {
	 
		for(int i = 0; i < checkArr.size(); i++) { 
			 int result = boardService.restoreBoard(checkArr.get(i));
		 if(result == -1) { 
			 session.setAttribute("msg", "게시글을 복원하는데 문제가 발생하였습니다."); 
			 return "fail"; 
			 }
		 }
		return "ok";
	}
}
