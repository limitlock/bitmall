package com.cafe24.bitmall.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.admin.AdminService;
import com.cafe24.bitmall.vo.AdminVo;
import com.cafe24.security.Auth;

@Controller
@RequestMapping("/ad")
public class AdminController {

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String admin() {
		return "admin/login";
	}

	// 관리자 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String admin(HttpSession session, @ModelAttribute AdminVo vo, Model model) {
		System.out.println("0: " + vo);
		AdminVo authAdmin = adminService.login(vo);
		System.out.println("1: " + authAdmin);
		if (authAdmin == null) {
			System.out.println("2");
			return "admin/login";
		}
		// 인증
		System.out.println("3");
		session.setAttribute("authAdmin", authAdmin);
		return "redirect:/ad/product?page=1";
	}

	
	
	
	@Auth
	@RequestMapping(value = "/jumun", method = RequestMethod.GET)
	public String jumun() {
		return "admin/jumun";
	}
	@Auth
	@RequestMapping(value = "/opt", method = RequestMethod.GET)
	public String opt() {
		return "admin/opt";
	}
	@Auth
	@RequestMapping(value = "/opt_new", method = RequestMethod.GET)
	public String optNew() {
		return "admin/opt_new";
	}
	
	@Auth
	@RequestMapping(value = "/opts", method = RequestMethod.GET)
	public String opts() {
		return "admin/opts";
	}
	

}
