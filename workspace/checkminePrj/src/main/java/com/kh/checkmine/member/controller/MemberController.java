package com.kh.checkmine.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@GetMapping("common/sample")
	public String sample() {
		return "common/sample";
	}
	
	@GetMapping("personnel/main")
	public String person() {
		return "personnel/main";
	}

}
