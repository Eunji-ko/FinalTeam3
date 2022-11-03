package com.kh.checkmine.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmine.alarm.service.AlarmService;
import com.kh.checkmine.alarm.vo.AlarmVo;
import com.kh.checkmine.member.vo.MemberVo;

public class AlarmAdviser implements HandlerInterceptor{
	
	private final AlarmService service;
	
	@Autowired
	public AlarmAdviser(AlarmService service) {
		super();
		this.service = service;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//세션 설정
		HttpSession session = request.getSession();
		
		//로그인한 사람 가져오기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember != null) {
			
			//알람 리스트 받아오기
			List<AlarmVo> alarmList = service.selectAlarmListByNo(loginMember.getNo());
			
			//알람 수 계산
			int alarmSum = 0;
			if(alarmList != null) {
				alarmSum = alarmList.size();
			}
			
			request.setAttribute("alarmSum", alarmSum);
			request.setAttribute("alarmList", alarmList);
		}
	}

}//class
