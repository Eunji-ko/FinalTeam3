package com.kh.checkmine.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmine.alarm.service.AlarmService;
import com.kh.checkmine.alarm.vo.AlarmVo;
import com.kh.checkmine.member.vo.MemberVo;

@Controller
@RequestMapping("alarm")
public class AlarmController {
	
	private final AlarmService service;
	
	public AlarmController(AlarmService service) {
		super();
		this.service = service;
	}

	@PostMapping("load")
	@ResponseBody
	public String alarm(HttpSession session) {
		
		//로그인한 사람 가져오기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember != null) {
			
			//TODO : 확인 후 지울 것
			service.insertTotalAlarm(loginMember.getNo());
			
			//알람 리스트 받아오기
			List<AlarmVo> alarmList = service.selectAlarmListByNo(loginMember.getNo());
			
			//알람 수 계산
			int alarmSum = 0;
			if(alarmList != null) {
				alarmSum = alarmList.size();
			}
			
			session.setAttribute("alarmSum", alarmSum);
			session.setAttribute("alarmList", alarmList);
		}
		
		return "";
	}
	
	@PostMapping("delete")
	@ResponseBody
	public String delete(String no) {
		
		int result = service.deleteAlarmOne(no);
		
		if(result == 1) {
			return "delete";
		}else {
			return "fail";			
		}
	}

}//class
