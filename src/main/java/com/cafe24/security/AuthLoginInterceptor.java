package com.cafe24.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.UserService;
import com.cafe24.bitmall.vo.UserVo;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	//
	// @Autowired
	// private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		UserVo vo = new UserVo();
		vo.setId(id);
		vo.setPassword(password);

		// Web Application Servlet에 접근
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		UserService userService = ac.getBean(UserService.class);

		UserVo authUser = userService.getUser(vo); //세션에다가 다른 회원정보를 넣을려면 user.getByIdAndPassword를 고치자!

		// request.getContextPath() => bitmall
		if (authUser == null) {
			response.sendRedirect(request.getContextPath() + "/user/member_login");
			return false;
		}

		HttpSession session = request.getSession(true);
		session.setAttribute("authUser", authUser);
		response.sendRedirect(request.getContextPath() + "/");

		return false;
	}

}
