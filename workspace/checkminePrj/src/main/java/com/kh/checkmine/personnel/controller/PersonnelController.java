package com.kh.checkmine.personnel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("personnel")
public class PersonnelController {
	
	@GetMapping("main")
	public String person() {
		return "personnel/main";
	}
	
}
