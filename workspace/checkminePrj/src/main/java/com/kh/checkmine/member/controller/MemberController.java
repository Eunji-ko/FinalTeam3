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
			session.setAttribute("loginPwd", vo.getPwd());
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
	
	@PostMapping("changePwd")
	public String changePwd(MemberVo vo, String newPwd, HttpSession session) {
		
		vo.setPwd(newPwd);
		
		int result = ms.changePwd(vo);
		
		if(result == 1) {
			session.invalidate();
			return "redirect:/";
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다 !");
			return "redirect:/member/mypage";
		}
		
	}
	
	@PostMapping("changeInfo")
	public String changeInfo(MemberVo vo, HttpSession session) {
		
		int result = ms.changeInfo(vo);
		
		if(result == 1) {
			MemberVo loginMember = ms.selectOneByNo(vo.getNo());
			if(loginMember != null) {
				session.setAttribute("loginMember", loginMember);
				session.setAttribute("alertMsg", "개인정보를 성공적으로 변경하였습니다 !");
				return "redirect:/member/mypage";
			}else {
				session.setAttribute("alertMsg", "개인정보를 다시 불러오는 데에 실패하였습니다 !");
				return "redirect:/member/mypage";
			}
		}else {
			session.setAttribute("alertMsg", "개인정보 변경에 실패하였습니다 !");
			return "redirect:/member/mypage";
		}
		
	}

}
