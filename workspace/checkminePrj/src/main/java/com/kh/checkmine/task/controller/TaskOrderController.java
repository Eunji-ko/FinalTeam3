package com.kh.checkmine.task.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.task.service.TaskOrderService;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Controller
@RequestMapping("task/order")
public class TaskOrderController {
	
	private final TaskOrderService orderService;
	
	public TaskOrderController(TaskOrderService orderService) {
		this.orderService = orderService;
	}
	
	//지시서 목록
	@GetMapping("list")
	public String orderList() {
		return "task/order-list";
	}
	
	//지시서 작성
	@GetMapping("write")
	public String orderWrite() {
		return "task/order-write";
	}
	
	@PostMapping("write")
	public String orderWrite(TaskOrderVo vo, Model model, HttpSession session) {
		String no = "1";
		String deptNo = "2";
		
		vo.setOrderer(no);
		vo.setDeptNo(deptNo);
		
		int result = orderService.write(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "지시서가 작성되었습니다.");
			return "redirect:/task/order/list";
		}else {
			model.addAttribute("msg", "지시서가 제대로 작성되지 못했습니다.");
			return "error/errorPage";
		}
	}
	
	//지시서 보기
	@GetMapping("detail")
	public String orderDetail() {
		return "task/order-detail";
	}
	
}
