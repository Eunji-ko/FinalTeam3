package com.kh.checkmine.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.schedule.dao.ScheduleService;

@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	private final ScheduleService service;
	
	public ScheduleController(ScheduleService service) {
		this.service = service;
	}
	
	@GetMapping("")
	public String main() {
		return "schedule/main";
	}
	
	
}
