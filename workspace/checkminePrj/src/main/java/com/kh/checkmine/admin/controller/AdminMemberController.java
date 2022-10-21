package com.kh.checkmine.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.checkmine.admin.service.AdminMemberService;
import com.kh.checkmine.admin.service.AdminService;
import com.kh.checkmine.board.vo.BoardVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {
	
	private final AdminMemberService service;
	
	public AdminMemberController(AdminMemberService service) {
		this.service = service;
		
	}
	
	//사원 관리 페이지
	@GetMapping("list")
	public String member(@RequestParam(value = "p", defaultValue = "1") int pno, @RequestParam(value = "sort", defaultValue = "a") String sort, Model model) {
		
		int totalCount = service.selectTotalCnt(sort);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 14);
		
		//사원 목록 불러오기
		List<MemberVo> memberList = service.selectMemberList(pv, sort);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("sort", sort);
		model.addAttribute("pv", pv);
		
		return "admin/adminMember";
	}
		
	//사원 관리 > 사원 등록 
	@GetMapping("member/add")
	public String memberAdd() {
		return "admin/adminMemberAdd";
	}

}
