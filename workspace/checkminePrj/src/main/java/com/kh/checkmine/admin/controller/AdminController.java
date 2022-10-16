package com.kh.checkmine.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.admin.service.AdminService;
import com.kh.checkmine.admin.vo.AdminVo;

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
		return "admin/adminLogin";
	}
	
	//관리자 로그인 동작
	@PostMapping("login")
	public String login(AdminVo vo, HttpSession session) {
		//서비스
		AdminVo loginAdmin = service.login(vo);
		
		
		//세션 저장
		if(loginAdmin != null) {
			session.setAttribute("loginAdmin", loginAdmin);
			return "redirect:/admin/adminMain";
		}else {
			session.setAttribute("msg", "로그인에 실패하였습니다.");
			return "redirect:/admin/login";
		}
		
		
		
	}
	
	

}
