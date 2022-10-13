package com.kh.checkmine.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("approval")
public class ApprovalController {
	
	@GetMapping
	public String approval() {
		return "approval/approval-outline";
	}
	

}
