package com.kh.checkmine.commute.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.checkmine.approval.vo.ApprovalLeaveVo;
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
		
		int mycommuteTotalCount = cs.selectMycommuteTotalCnt(no);
		PageVo pv = Pagination.getPageVo(mycommuteTotalCount, pno, 5, 10);
		
		List<CommuteVo> voList = cs.selectListOne(no, pv);
		
		session.setAttribute("voList", voList);
		model.addAttribute("pv", pv);
		model.addAttribute("loginMember", loginMember);
		
		return "commute/mycommute";
		
	}
	
	//전체 근태기록
	@GetMapping("commute/{pno}")
	public String commute(Model model, HttpServletRequest req, @PathVariable int pno) {
		
		int commuteTotalCount = cs.selectcommuteTotalCount();
		PageVo pv = Pagination.getPageVo(commuteTotalCount, pno, 5, 10);
		
		String deptName = (String) req.getParameter("부서명");
		String posName = (String) req.getParameter("직급");
		
		CommuteVo vo = new CommuteVo();
		vo.setDeptName(deptName);
		vo.setPosName(posName);
		
		List<CommuteVo> voList = cs.selectList(vo, pv);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		model.addAttribute("vo", vo);
		
		return "commute/commute";
		
	}
	
	//연차조회
	@GetMapping("annualleave")
	public String annualleave(Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); 
		String no = loginMember.getNo();
		
		LocalDate now = LocalDate.now();
		String year = Integer.toString(now.getYear());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberNo", no);
		map.put("year", year);
		
		List<ApprovalLeaveVo> voList = cs.selectLeaveList(map);
		
		double x = 0;
		
		if(voList != null) {
			for(int i = 0; i < voList.size(); i++) {
				String apply = voList.get(i).getApply();
				x = x + Double.parseDouble(apply);
			}
		}
		
		model.addAttribute("voList", voList);
		model.addAttribute("x", x);
		
		return "commute/annualleave";
		
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
