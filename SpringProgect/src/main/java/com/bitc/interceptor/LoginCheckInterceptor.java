package com.bitc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheckInterceptor implements HandlerInterceptor {

//	HandlerInterceptor : 인터셉터를 사용하기 위한 인터페이스
//	preHandle : 지정한 컨트롤러가 동작하기 직전에 먼저 수행
//	postHandle : 지정한 컨트롤러가 동작 후 view를 표시하기 전에 수행
//	afterCompletion : 모든 동작 완료된 후 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		if ((String)session.getAttribute("userId") == null) {
			
			response.sendRedirect("/board/boardList");
			return false;
		}
		else {
			return true;
		}
	}
}










