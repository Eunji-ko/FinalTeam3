package com.kh.checkmine.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.admin.service.AdminService;
import com.kh.checkmine.admin.vo.AdminVo;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.reservation.vo.PlaceBookVo;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	private final AdminService service;
	
	public AdminController(AdminService service) {
		this.service = service;
		
	}
	
	//관리자 로그인 화면
	@GetMapping("login")
	public String login() {
		return "admin/main/login";
	}
	
	//관리자 로그인 동작
	@PostMapping("login")
	public String login(AdminVo vo, HttpSession session) {
		
		AdminVo loginAdmin = service.login(vo);
		
		//세션 저장
		if(loginAdmin != null) {
			session.setAttribute("loginAdmin", loginAdmin);
			session.setAttribute("msg", "관리자로 로그인하였습니다.");
			return "redirect:/admin/main";
		}else {
			session.setAttribute("msg", "로그인에 실패하였습니다.");
			return "redirect:/admin/login";
		}

	}
	
	//관리자 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletRequest req) {
		session.invalidate();
		return "redirect:/admin/login";
	}
	
	//홈화면으로 이동 
	
	  @GetMapping("main") 
	  public String main(Model model) {
	  
		  HashMap<String, Integer> summary = service.summary();
		  //게시판
		  List<BoardVo> boardList = service.boardList();
		  //사원
		  List<MemberVo> memberList = service.MemberList();
		  //예약
		  List<PlaceBookVo> bookList = service.bookList();
		  
		  model.addAttribute("summary", summary);
		  model.addAttribute("boardList", boardList);
		  model.addAttribute("memberList", memberList);
		  model.addAttribute("bookList", bookList);
		  return "admin/main/main"; 
	}
	

}
