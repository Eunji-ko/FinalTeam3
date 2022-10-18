package com.kh.checkmine.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("commute")
public class CommuteController {

	@GetMapping("commute")
	public String commute() {
		return "commute/commute";
	}
	
}
