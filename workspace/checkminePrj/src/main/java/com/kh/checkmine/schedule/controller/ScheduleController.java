package com.kh.checkmine.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.checkmine.member.vo.MemberVo;
import com.kh.checkmine.schedule.service.ScheduleService;
import com.kh.checkmine.schedule.vo.FullcalendarVo;
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	private final ScheduleService service;
	
	public ScheduleController(ScheduleService service) {
		this.service = service;
	}
	
	//화면
	@GetMapping("")
	public String calendar(Model model) {
		return "schedule/main";
	}
	
	//ajax 요청 핸들러
	@GetMapping( value = "list" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String list() {
		
		List<TaskOrderVo> orderList = service.selcetOrderList();
		List<FullcalendarVo> calendarList = new ArrayList(); // 지시서 
		List<ScheduleVo> scheduleList = service.selectScheduleList(); // 일정
		
		for(int i = 0; i < orderList.size(); i++) {
			
			FullcalendarVo calendarVo = new FullcalendarVo();
			
			calendarVo.setId(orderList.get(i).getNo());
			calendarVo.setWriter(orderList.get(i).getOrderer());
			calendarVo.setTitle("[" + orderList.get(i).getDeptNo() + "]" + orderList.get(i).getTitle());
			calendarVo.setContent(orderList.get(i).getContent());
			calendarVo.setStart(orderList.get(i).getStartDate());
			calendarVo.setEnd(orderList.get(i).getEndDate());

			calendarList.add(calendarVo);
		}
		
		for(int j = 0; j < scheduleList.size(); j++) {
			
			FullcalendarVo calendarVo = new FullcalendarVo();
			
			calendarVo.setWriter(scheduleList.get(j).getEmpNo());
			calendarVo.setContent(scheduleList.get(j).getContent());
			calendarVo.setStart(scheduleList.get(j).getStartDate());
			calendarVo.setEnd(scheduleList.get(j).getEndDate());
		}
		
		
		Gson gson = new Gson();

		String jsonStr = gson.toJson(calendarList);
		
		return jsonStr;
		
	}
	
	@PostMapping("add")
	public String addSchedule(ScheduleVo vo, HttpSession session, Model model) {
//		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		
//		String empNo = loginMember.getNo();
		vo.setEmpNo("7");
		
		int addSchedule = service.insertSchedule(vo);
		
		if(addSchedule == 1) {
			session.setAttribute("alertMsg", "일정이 등록되었습니다.");
			return "schedule/main";
		}else {
			session.setAttribute("alertMsg", "일정 ");
			return "schedule/main";
		}
	}
	
	
}
