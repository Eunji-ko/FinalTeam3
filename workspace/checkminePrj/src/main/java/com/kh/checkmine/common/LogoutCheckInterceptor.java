package com.kh.checkmine.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmine.member.vo.MemberVo;

public class LogoutCheckInterceptor implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		//로그인 정보 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		System.out.println("로그아웃 상태인지 체크하는 인터셉터의 포스트 핸들 들어옴");
		
		if(loginMember != null) {
			System.out.println("로그아웃 상태인지 체크하는 인터셉터의 포스트 핸들 들어왔는데 로그인멤버 vo가 널이 아님");
			response.sendRedirect(request.getContextPath()+"/member/main");
		}
	}
	
}
