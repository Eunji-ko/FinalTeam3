package com.kh.checkmine.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("task")
public class TaskController {
	
	//���� ���
	@GetMapping("report/list")
	public String reportList() {
		return "task/report-list";
	}
	
	//���� �ۼ�
	@GetMapping("report/write")
	public String reportWrite() {
		return "task/report-write";
	}
	
	//���� ����
	@GetMapping("report/detail")
	public String reportDetail() {
		return "task/report-detail";
	}
	
	//���ü� ���
	@GetMapping("order/list")
	public String orderList() {
		return "task/order-list";
	}
	
	//���ü� �ۼ�
	@GetMapping("order/write")
	public String orderWrite() {
		return "task/order-write";
	}
	
	//���ü� ����
	@GetMapping("order/detail")
	public String orderDetail() {
		return "task/order-detail";
	}
}
