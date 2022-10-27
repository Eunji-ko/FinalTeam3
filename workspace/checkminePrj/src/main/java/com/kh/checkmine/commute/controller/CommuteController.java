package com.kh.checkmine.commute.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
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
	@GetMapping("mycommute/{pno}")
	public String mycommute(Model model, HttpSession session, @PathVariable int pno) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		int totalCount = cs.selectTotalCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<CommuteVo> voList = cs.selectListOne(no, pv);
		
		session.setAttribute("voList", voList);
		model.addAttribute("pv", pv);
		model.addAttribute("loginMember", loginMember);
		
		return "commute/mycommute";
		
	}
	
	//전체 근태기록
	@GetMapping("commute/{pno}")
	public String commute(Model model, @PathVariable int pno) {
		
		int totalCount = cs.selectTotalCnt();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<CommuteVo> voList = cs.selectList(pv);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		return "commute/commute";
		
	}
	
	//연차신청
	@GetMapping("leave")
	public String leave() {
		return "commute/leave";
	}
	
	//출근 버튼
	@PostMapping("arrived")
	public String arrived(CommuteVo vo, HttpSession session) {
		
		//MemberVo memberVo = new MemberVo();
		//memberVo.setNo("1");
		//session.setAttribute("loginMember", memberVo);
		
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
	@PostMapping("leave")
	public String leave(CommuteVo vo, HttpSession session) {
		
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
