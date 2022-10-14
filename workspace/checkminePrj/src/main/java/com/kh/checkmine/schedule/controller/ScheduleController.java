package com.kh.checkmine.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	@GetMapping("main")
	public String main() {
		return "schedule/main";
	}
}
