package com.kh.checkmine.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.admin.service.AdminService;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {
	
	private final AdminService service;
	
	public AdminMemberController(AdminService service) {
		this.service = service;
		
	}
	
	//사원 관리 페이지
	@GetMapping("member")
	public String member() {
		
		//사원 목록 불러오기
		
		return "admin/adminMember";
	}
		
	//사원 관리 > 사원 등록 
	@GetMapping("member/add")
	public String memberAdd() {
		return "admin/adminMemberAdd";
	}

}
