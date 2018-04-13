package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.vo.AdminVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		
		// 1. handler 종류 확인 (크게 두 가지)
		if (handler instanceof HandlerMethod == false) { // Handler가 HandlerMethod가 아니라면,
			return true;
		}

		// 2. casting
		HandlerMethod handlerMethod = (HandlerMethod) handler;

		// 3. @Auth 받아오기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

		// 4. Method에 @Auth가 없는 경우
		if (auth == null) {
			return true;
		}
		
		// 5. @Auth가 붙어있는 경우, 인증여부 체크
		HttpSession session = request.getSession();
		if (session == null) {
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		
		// 현재 세션이 관리자인가 일반 회원인가 확인
		AdminVo authAdmin = (AdminVo) session.getAttribute("authAdmin");
		if (authAdmin == null) {
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}

		// 6. 접근 허가
		return true;
	}
}
