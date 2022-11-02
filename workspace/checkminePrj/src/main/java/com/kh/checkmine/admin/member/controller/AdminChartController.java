package com.kh.checkmine.admin.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.checkmine.admin.member.service.AdminMemberService;

@Controller
public class AdminChartController {

	private final AdminMemberService service;

	public AdminChartController(AdminMemberService service) {
		this.service = service;
	}
	
	@GetMapping("admin/chart")
	public String chart(Model model) {
		
		List<Map<String, String>> chart = service.memberChart();
		
		model.addAttribute("chart", chart);
		return "admin/chart/chart";
	}
	
	
}
