package com.kh.checkmine.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("task")
public class TaskController {
	
	//보고서 목록
	@GetMapping("report/list")
	public String reportList() {
		return "task/report-list";
	}
	
	//보고서 작성
	@GetMapping("report/write")
	public String reportWrite() {
		return "task/report-write";
	}
	
	//보고서 보기
	@GetMapping("report/detail")
	public String reportDetail() {
		return "task/report-detail";
	}
	
	//지시서 목록
	@GetMapping("order/list")
	public String orderList() {
		return "task/order-list";
	}
	
	//지시서 작성
	@GetMapping("order/write")
	public String orderWrite() {
		return "task/order-write";
	}
	
	//지시서 보기
	@GetMapping("order/detail")
	public String orderDetail() {
		return "task/order-detail";
	}
}
