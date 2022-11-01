package com.kh.checkmine.schedule.controller;

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
import com.kh.checkmine.schedule.vo.ScheduleVo;
import com.kh.checkmine.task.vo.TaskOrderVo;

@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	private final ScheduleService service;
	
	public ScheduleController(ScheduleService service) {
		this.service = service;
	}
	
//	@GetMapping("")
//	public String main() {
//		return "schedule/main";
//	}
	
	//화면
	@GetMapping("")
	public String calendar(Model model) {
		
		List<TaskOrderVo> orderList = service.selcetOrderList();
		//List<ScheduleVo> scheduleList = service.selectScheduleList();
		
		//json 형식으로 변환?
		Gson gson = new Gson();

		JsonArray orderArr= new JsonArray();
		
		Map<String, Object> map = new HashMap<>(); 
		
		for(int i = 0; i < orderList.size(); ++i) {
			map.put("orderer", orderList.get(i).getOrderer());
			map.put("title", orderList.get(i).getTitle());
			map.put("content", orderList.get(i).getContent());
			map.put("start", orderList.get(i).getStartDate());
			map.put("end", orderList.get(i).getEndDate());
			
			orderArr.add(gson.toJson(map));
		}
		System.out.println(orderArr); //백슬래시가 들어감.
		
		model.addAttribute("data", orderArr);
		return "schedule/main";
	}
	
	//ajax 요청 핸들러
	@GetMapping( value = "order" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String order() {
		
		List<TaskOrderVo> orderList = service.selcetOrderList();
		
		Gson gons = new Gson();
		
		String jsonStr = gons.toJson(orderList);
		
		return jsonStr;
		
	}
	
	@PostMapping("add")
	public String addSchedule(ScheduleVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		String empNo = loginMember.getNo();
		vo.setNo(empNo);
		
		//int addSchedule = service.insertSchedule(vo);
		
		
		
		return "schedule/main";
	}
	
	
}
