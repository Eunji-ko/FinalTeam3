package com.kh.checkmine.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

import oracle.jdbc.proxy.annotation.Post;

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
			calendarVo.setImportance(orderList.get(i).getImportance());
			
			if("N".equals(orderList.get(i).getImportance())) {//보통			
				calendarVo.setBackgroundColor("#5D736F");
				calendarVo.setBorderColor("#5D736F");
				calendarVo.setColor("#5D736F");
			}else if("I".equals(orderList.get(i).getImportance())) {//중요				
				calendarVo.setBackgroundColor("#e66200");
				calendarVo.setBorderColor("#e66200");
				calendarVo.setColor("#e66200");
			}else {//긴급
				calendarVo.setBackgroundColor("#e61919");
				calendarVo.setBorderColor("#e61919");
				calendarVo.setColor("#e61919");
			}
			calendarVo.setTextColor("white");

			calendarList.add(calendarVo);
		}
		
		for(int j = 0; j < scheduleList.size(); j++) {
			
			FullcalendarVo calendarVo = new FullcalendarVo();

			calendarVo.setId('S' + scheduleList.get(j).getNo());
			calendarVo.setTitle(scheduleList.get(j).getTitle());
			calendarVo.setWriter(scheduleList.get(j).getEmpNo());
			calendarVo.setContent(scheduleList.get(j).getContent());
			calendarVo.setStart(scheduleList.get(j).getStartDate());
			calendarVo.setEnd(scheduleList.get(j).getEndDate());
			calendarVo.setBackgroundColor("#b0d9d1");
			calendarVo.setBorderColor("#b0d9d1");
			calendarVo.setColor("#b0d9d1");
			calendarVo.setTextColor("#5D736F");

			calendarList.add(calendarVo);
		}
		
		
		Gson gson = new Gson();

		String jsonStr = gson.toJson(calendarList);
		
		return jsonStr;
		
	}
	
	@PostMapping("add")
	public String addSchedule(ScheduleVo vo, HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		vo.setEmpNo(loginMember.getNo());
		vo.setStartDate(vo.getStartDate()+vo.getStartTime());
		vo.setEndDate(vo.getEndDate()+vo.getEndTime());
		
		int result = service.insertSchedule(vo);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "일정이 등록되었습니다.");
			return "schedule/main";
		}else {
			session.setAttribute("alertMsg", "일정을 등록하지 못했습니다. ");
			return "schedule/main";
		}
	}
	
	@GetMapping("del/{no}")
	public String delSchedule(@PathVariable String no, FullcalendarVo vo, HttpSession session, Model model) {
		
		//String no = vo.getId().replace("S", "");
		
		int result = service.updateSchedule(no);
		
		if(result == 1) {
			session.setAttribute("alertMsg", "일정이 삭제되었습니다.");
			return "schedule/main";
		}else {
			session.setAttribute("alertMsg", "일정을 삭제하지 못했습니다. ");
			return "schedule/main";
		}
	}
	
}
