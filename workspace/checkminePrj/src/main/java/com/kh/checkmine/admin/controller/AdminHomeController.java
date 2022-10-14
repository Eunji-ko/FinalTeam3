package com.kh.checkmine.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.admin.vo.AdminVo;

@Controller
@RequestMapping("admin")
public class AdminHomeController {
	
	//관리자 로그인 화면
	@GetMapping("login")
	public String login() {
		return "admin/login";
	}
	
	//관리자 로그인 동작
	@PostMapping("login")
	public String login(AdminVo vo) {
		//서비스
		
		//세션 저장
		return "redirect:/admin/adminMain";
		
		
		
	}
	
	

}
