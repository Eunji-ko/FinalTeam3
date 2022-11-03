package com.kh.checkmine.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.member.service.MemCheckService;

@Controller
public class MemCheckContoller {
	
	@Autowired
	private MemCheckService ms;
	
	//이메일 인증
	@GetMapping("mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return ms.joinEmail(email);
	}

}
