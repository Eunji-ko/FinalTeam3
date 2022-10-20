package com.kh.checkmine.task.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmine.task.service.TaskOrderService;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
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
	public String orderWrite(TaskOrderVo orderVo, TaskOrderAttVo orderAttVo , Model model, HttpSession session) {
		
		//지시서
		String orderer = "1";
		String deptNo = "2";
		
		orderVo.setOrderer(orderer);
		orderVo.setDeptNo(deptNo);
		
		System.out.println("컨트롤러 ::: " + orderVo);
		
		int orderRsult = orderService.write(orderVo);
		
		//수신,참조 등록
		orderAttVo.setTaskNo(orderVo.getNo());
		String[] empNo = orderAttVo.getEmpNo();
		int attResult = 0;
		
		for(int i = 0; i<empNo.length; ++i) {
		}
		
		if(orderRsult == 1 && attResult == 1) {
			session.setAttribute("alertMsg", "지시서가 작성되었습니다.");
			return "redirect:/task/order/list";
		}else {
			session.setAttribute("alertMsg", "지시서가 작성되지 못했습니다.");
			return "redirect:/task/order/list";
		}
	}
	
	//지시서 보기
	@GetMapping("detail")
	public String orderDetail() {
		return "task/order-detail";
	}
	
}
