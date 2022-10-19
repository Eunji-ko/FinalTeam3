package com.kh.checkmine.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.approval.vo.ApprovalDocVo;
import com.kh.checkmine.approval.vo.ApprovalDraftVo;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	@GetMapping
	public String approval() {
		return "approval/approval-outline";
	}
	
	@PostMapping("/draft")
	public String draft(ApprovalDocVo docVo, ApprovalDraftVo draftVo) {
		
		
		
		return "redirect:/approval";
	}

}
