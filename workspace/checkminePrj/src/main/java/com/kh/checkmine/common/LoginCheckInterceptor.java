package com.kh.checkmine.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmine.member.vo.MemberVo;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//false로 하면 세션 없으면 그냥 null, true일 때는 세션이 없으면 세션 생성함
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			//로그인 정보 가져오기
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			if(loginMember == null) {
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}else {
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		
		return true;
	}

}
