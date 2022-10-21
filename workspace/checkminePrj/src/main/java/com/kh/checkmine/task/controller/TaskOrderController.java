package com.kh.checkmine.task.controller;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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
	
	//���ü� ���
	@GetMapping("list")
	public String orderList() {
		return "task/order-list";
	}
	
	//���ü� �ۼ�
	@GetMapping("write")
	public String orderWrite() {
		return "task/order-write";
	}
	
	@PostMapping("write")
	public String orderWrite(TaskOrderVo orderVo, TaskOrderAttVo orderAttVo , Model model, HttpSession session) {
		
		//���ü�
		String orderer = "1";
		String deptNo = "2";
		
		orderVo.setOrderer(orderer);
		orderVo.setDeptNo(deptNo);
		
		int orderRsult = orderService.write(orderVo);
		
		//����,���� ���
		//orderAttVo.setTaskNo((String)orderVo.getNo());
		orderAttVo.setTaskNo("1");
		Map<String, String> attNoA = orderAttVo.getAttNoA();
		String[] attNoR = orderAttVo.getAttNoR();

		System.out.println(attNoA.values());
		
//		int attNoAResult = 0;
//		for(int i = 0; i<attNoA.size(); ++i) {
////			orderAttVo.setEmpNo(attNoA.values());
//			orderAttVo.setType("A");
//			attNoAResult = orderService.addAttNoA(orderAttVo); 
//		}
//		
//		if(attNoR != null) {
//			int attNoRResult = 0;
//			for(int i = 0; i<attNoR.length; ++i) {
//				System.out.println(attNoR);
////				orderAttVo.setEmpNo(attNoR[i]);
////				orderAttVo.setType("R");
////				attNoRResult = orderService.addAttNoR(orderAttVo); 
//			}
//		}
		
		if(orderRsult == 1) {
			session.setAttribute("alertMsg", "���ü��� �ۼ��Ǿ����ϴ�.");
			return "redirect:/task/order/list";
		}else {
			session.setAttribute("alertMsg", "���ü��� �ۼ����� ���߽��ϴ�.");
			return "redirect:/task/order/list";
		}
	}
	
	//���ü� ����
	@GetMapping("detail")
	public String orderDetail() {
		return "task/order-detail";
	}
	
}
