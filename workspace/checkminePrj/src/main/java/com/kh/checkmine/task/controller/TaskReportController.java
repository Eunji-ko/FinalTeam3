package com.kh.checkmine.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("task/report")
public class TaskReportController {
	
	//보고서 목록
	@GetMapping("list")
	public String reportList() {
		return "task/report-list";
	}
	
	//보고서 작성
	@GetMapping("write")
	public String reportWrite() {
		return "task/report-write";
	}
	
	//보고서 보기
	@GetMapping("detail")
	public String reportDetail() {
		return "task/report-detail";
	}
	
	//보고서 수정
	@GetMapping("edit")
	public String reportEdit() {
		return "task/report-edit";
	}
	
	//보고서 삭제
	@GetMapping("delete")
	public String reportDelete() {
		return "redirect:/task/order/list";
	}

}
