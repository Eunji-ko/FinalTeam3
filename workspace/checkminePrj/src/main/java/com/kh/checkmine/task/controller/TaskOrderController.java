package com.kh.checkmine.task.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.checkmine.common.FileUploader;
import com.kh.checkmine.task.service.TaskOrderService;
import com.kh.checkmine.task.vo.TaskOrderAttVo;
import com.kh.checkmine.task.vo.TaskOrderFileVo;
import com.kh.checkmine.task.vo.TaskOrderVo;
import com.kh.checkmine.task.vo.TestVo;

@Controller
@RequestMapping("task/order")
public class TaskOrderController {
	
	private final TaskOrderService orderService;
	
	public TaskOrderController(TaskOrderService orderService) {
		this.orderService = orderService;
	}
	
	//지시서 목록
	@GetMapping("list")
	public String orderList(Model model) {
		
		
		return "task/order-list";
	}
	
	//지시서 작성
	@GetMapping("write")
	public String orderWrite() {
		return "task/order-write";
	}
	
	@PostMapping("write")
	public String orderWrite(TaskOrderVo orderVo, TaskOrderAttVo orderAttVo, TaskOrderFileVo orderFileVo, Model model, HttpServletRequest req, HttpSession session) {
		
		//지시서 입력
		String orderer = "1";
		String deptNo = "2";
		
		orderVo.setOrderer(orderer);
		orderVo.setDeptNo(deptNo);
		
		int orderRsult = orderService.write(orderVo);
		
		//수신 참조 등록
		orderAttVo.setTaskNo((String)orderVo.getNo());
		orderAttVo.setTaskNo("1");
		
		System.out.println(orderAttVo);
		
		String attNoA = orderAttVo.getAttNoA();
		String attNoR = orderAttVo.getAttNoR();
		System.out.println("attNoA : " + attNoA);
		Gson gson = new Gson();
		List<Map> listAttNoA = gson.fromJson(attNoA, ArrayList.class);
		List<Map> listAttNoR = gson.fromJson(attNoR, ArrayList.class);
		System.out.println("listAttNoA : " + listAttNoA);
		int attNoAResult = 0;
		if(listAttNoA != null) {
			for(Map m : listAttNoA) {
				String value = (String)m.get("value");
				orderAttVo.setEmpNo(value);
				orderAttVo.setType("A");
				attNoAResult = orderService.insertAttNoA(orderAttVo); 
			}			
		}
		
		int attNoRResult = 0;
		if(listAttNoR != null){
			for(Map m : listAttNoR) {
				String value = (String)m.get("value");
				orderAttVo.setEmpNo(value);
				orderAttVo.setType("R");
				attNoAResult = orderService.insertAttNoR(orderAttVo); 
			}			
		}
		
		//파일 등록
		MultipartFile[] fArr = orderFileVo.getFile();
		List<TaskOrderFileVo> orderFileVoList = new LinkedList<TaskOrderFileVo>();
		if(!fArr[0].isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/upload/task/order/");
			for(int i = 0; i < fArr.length; i++) {
				MultipartFile f = fArr[i];
				TaskOrderFileVo fileVo = new TaskOrderFileVo();
				
				String changeName = FileUploader.fileUpload(f, savePath);
				fileVo.setName(changeName);
				fileVo.setPath(savePath);
				fileVo.setTaskNo(orderVo.getNo());
				orderFileVoList.add(fileVo);
				
				int fileResult = orderService.insertFile(fileVo); 				
			}
		}
		
		if(orderRsult == 1 && attNoAResult == 1) {
			session.setAttribute("alertMsg", "지시서가 작성되었습니다.");
			return "redirect:/task/order/list";
		}else {
			session.setAttribute("alertMsg", "지시서가 작성되지 못했습니다.");
			return "redirect:/task/order/list";
		}
	}
	
	//���ü� ����
	@GetMapping("detail")
	public String orderDetail() {
		return "task/order-detail";
	}
	
}
