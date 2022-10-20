package com.kh.checkmine.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@GetMapping("findIdPwd")
	public String findIdPwd() {
		return "member/findIdPwd";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, HttpSession session) {
		
		MemberVo loginMember = ms.login(vo);
		
		if(loginMember != null) {
			//로그인 성공
			session.setAttribute("loginMember", loginMember);
			return "member/main";
		}else {
			//로그인 실패
			session.setAttribute("alertMsg", "로그인 실패 !");
			return "redirect:/";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("mypage")
	public String myPage() {
		return "member/mypage";
	}

}
