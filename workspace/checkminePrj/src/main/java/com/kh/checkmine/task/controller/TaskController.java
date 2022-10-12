package com.kh.checkmine.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("task")
public class TaskController {
	
	//���� ���
	@GetMapping("list")
	public String list() {
		return "task/report-list";
	}
	
	//���� �ۼ�
	@GetMapping("write")
	public String write() {
		return "task/report-write";
	}
	
}
