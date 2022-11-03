package com.kh.checkmine.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.alarm.service.AlarmService;

@Controller
@RequestMapping("alarm")
public class AlarmController {
	
	private final AlarmService service;
	
	@Autowired
	public AlarmController(AlarmService service) {
		super();
		this.service = service;
	}
	
	@GetMapping("delete")
	@ResponseBody
	public String delete(String no) {
		
		int result = service.deleteAlarmOne(no);
		
		if(result == 1) {
			return "delete";
		}else {
			return "fail";			
		}
	}
	
	@GetMapping("read")
	@ResponseBody
	public String read(String no) {
	
		int result = service.readAlarmOne(no);
		
		if(result == 1) {
			return "read";
		}else {
			return "fail";
		}
		
	}

}//class
