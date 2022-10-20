package com.kh.checkmine.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("task/report")
public class TaskReportController {
	
	//���� ���
	@GetMapping("list")
	public String reportList() {
		return "task/report-list";
	}
	
	//���� �ۼ�
	@GetMapping("write")
	public String reportWrite() {
		return "task/report-write";
	}
	
	//���� ����
	@GetMapping("detail")
	public String reportDetail() {
		return "task/report-detail";
	}
	
	//���� ����
	@GetMapping("edit")
	public String reportEdit() {
		return "task/report-edit";
	}
	
	//���� ����
	@GetMapping("delete")
	public String reportDelete() {
		return "redirect:/task/order/list";
	}

}
