package com.kh.checkmine.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmine.member.vo.MemberVo;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		//false로 하면 세션 없으면 그냥 null, true일 때는 세션이 없으면 세션 생성함
		HttpSession session = request.getSession(false);
		System.out.println("로그인했는지 체크하는 인터셉터의 포스트 핸들 들어옴");
		
		if(session != null) {
			//로그인 정보 가져오기
			System.out.println("로그인했는지 체크하는 인터셉터의 포스트 핸들 안인데 세션 있음");
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			System.out.println(loginMember);
			if(loginMember == null) {
				System.out.println("로그인했는지 체크하는 인터셉터의 포스트 핸들 안인데 세션안의 로그인 멤버는 널임");
				response.sendRedirect(request.getContextPath());
			}
		}
	}

}
