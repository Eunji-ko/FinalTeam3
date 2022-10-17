package com.kh.checkmine.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@GetMapping("main")
	public String mainHome() {
		return "member/main";
	}
	
	@GetMapping("mypage")
	public String myPage() {
		return "member/mypage";
	}

}
