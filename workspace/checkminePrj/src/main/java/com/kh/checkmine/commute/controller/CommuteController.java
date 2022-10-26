package com.kh.checkmine.commute.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.commute.service.CommuteService;
import com.kh.checkmine.commute.vo.CommuteVo;
import com.kh.checkmine.member.vo.MemberVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("commute")
public class CommuteController {

	private final CommuteService cs;
	
	public CommuteController(CommuteService cs) {
		this.cs = cs;
	}

	//나의 근태기록
	@GetMapping("mycommute")
	public String mycommute(HttpSession session) {
		
		List<CommuteVo> voList = cs.selectList();
		
		session.setAttribute("voList", voList);
		
		return "commute/mycommute";
		
	}
	
	//전체 근태기록
	@GetMapping("commute")
	public String commute() {
		return "commute/commute";
	}
	
	//연차신청
	@GetMapping("leave")
	public String leave() {
		return "commute/leave";
	}
	
	//출근 버튼
	@ResponseBody
	@PostMapping("arrived")
	public String arrived(CommuteVo vo, HttpSession session) {
		
		MemberVo memberVo = new MemberVo();
		memberVo.setNo("1");
		session.setAttribute("loginMember", memberVo);
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		vo.setEmpNo(no);
		
		int result = cs.arrived(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "출근성공");
			return "redirect:/member/main";
		}else {
			session.setAttribute("alertMsg", "출근실패");
			return "redirect:/member/main";
		}
		
	}
	
	//퇴근 버튼
	@ResponseBody
	@PostMapping("leave")
	public String leave(CommuteVo vo, HttpSession session) {
		
		MemberVo memberVo = new MemberVo();
		memberVo.setNo("1");
		session.setAttribute("loginMember", memberVo);
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		vo.setEmpNo(no);
		
		int result = cs.leave(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "퇴근성공");
			return "redirect:/member/main";
		}else {
			session.setAttribute("alertMsg", "퇴근실패");
			return "redirect:/member/main";
		}
		
	}
	
}
