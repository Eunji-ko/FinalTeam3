package com.kh.checkmine.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.approval.service.ApprovalService;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalFileVo;
import com.kh.checkmine.common.PageVo;
import com.kh.checkmine.common.Pagination;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	private final ApprovalService service;
	
	@Autowired
	public ApprovalController(ApprovalService service) {
		super();
		this.service = service;
	}

	@GetMapping
	public String approval() {
		return "approval/approval-outline";
	}
	
	@GetMapping(value={"list/{pno}","list"})
	public String list(@PathVariable(required = false) String pno, Model model, HttpSession session) {
		
		//현재 로그인한 사원 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String employeeNo = loginMember.getNo();
		////////////////////////임시
		if(employeeNo == null) {
			employeeNo = "2";
		}
		///////////////////////////
		
		//페이지번호 파싱
		if(pno == null) {
			pno = "1";
		}
		int pnoInt = Integer.parseInt(pno);
		
		int totalCount = service.selectTotalCnt(employeeNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pnoInt, 5, 15);
		
		//디비 데이터 조회
		List<ApprovalDocVo> voList = service.selectList(employeeNo, pv);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		return "approval/list";
	}
	
	@PostMapping("/draft")
	public String draft(ApprovalDocVo docVo, ApprovalDraftVo draftVo, ApprovalFileVo fileVo, HttpSession session) {
		
		//회원 정보 가져오기
		
		//문서번호 존재 여부 확인
		
		return "redirect:/approval";
	}

}
