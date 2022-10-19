package com.kh.checkmine.approval.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.approval.service.ApprovalService;
import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;
import com.kh.checkmine.approval.vo.ApprovalFileVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	private final ApprovalService as;
	
	@Autowired
	public ApprovalController(ApprovalService as) {
		super();
		this.as = as;
	}

	@GetMapping
	public String approval() {
		return "approval/approval-outline";
	}
	
	@PostMapping("/draft")
	public String draft(ApprovalDocVo docVo, ApprovalDraftVo draftVo, ApprovalFileVo fileVo, HttpSession session) {
		
		//회원 정보 가져오기
		
		//문서번호 존재 여부 확인
		
		return "redirect:/approval";
	}

}
