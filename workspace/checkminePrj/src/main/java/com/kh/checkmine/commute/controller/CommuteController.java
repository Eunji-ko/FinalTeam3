package com.kh.checkmine.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("commute")
public class CommuteController {

	//나의 근태기록
	@GetMapping("mycommute")
	public String mycommute() {
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
	
}
