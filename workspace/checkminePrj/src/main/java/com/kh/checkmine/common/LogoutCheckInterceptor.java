package com.kh.checkmine.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmine.member.vo.MemberVo;

public class LogoutCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		//로그인 정보 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath()+"/member/main");
			return false;
		}
		
		return true;
	}
	
}
