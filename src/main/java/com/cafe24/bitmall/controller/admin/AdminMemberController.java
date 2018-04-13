package com.cafe24.bitmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.admin.AdminMemberService;
import com.cafe24.security.Auth;

@Controller
@RequestMapping("/ad")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;

	// 회원 관리 메인창
	@Auth
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Model model, @RequestParam(value = "page", required = true, defaultValue = "1") Long page) {
		adminMemberService.getUserList(model, page);
		return "admin/member";
	}

	// 회원 검색
	@Auth
	@RequestMapping(value = "/search_user", method = RequestMethod.GET)
	public String search(@RequestParam("sel1") Long tag, @RequestParam("search_text") String searchText,
			@RequestParam("page") Long page, Model model) {

		adminMemberService.search(tag, searchText, model, page);

		return "admin/member";
	}

	// 회원 삭제
	@Auth
	@RequestMapping(value = "/user_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("no") Long no, @RequestParam("page") Long page) {
		adminMemberService.deleteUser(no);

		return "redirect:/ad/member?page=" + page;
	}

}
