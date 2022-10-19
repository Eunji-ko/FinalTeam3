package com.kh.checkmine.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.member.service.MemberService;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private final MemberService ms;
	
	@Autowired
	public MemberController(MemberService ms) {
		this.ms = ms;
	}
	
	@GetMapping("main")
	public String mainHome() {
		return "member/main";
	}
	
	@GetMapping("mypage")
	public String myPage() {
		return "member/mypage";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session, Model model) {
		
		MemberVo loginMember = ms.login(vo);
		//TODO ServiceImpl 만들기 부터 쭉 채워나가야 함
		
		return "member/main";
	}

}
