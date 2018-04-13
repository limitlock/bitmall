package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cafe24.bitmall.service.UserService;
import com.cafe24.bitmall.vo.UserVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller
@SessionAttributes("authUser")
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/member_agree")
	public String agree() {
		return "user/member_agree";
	}

	// 회원가입
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String join() {
		return "user/member_join";
	}

	// 회원가입
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String join(@ModelAttribute UserVo vo) {

		userService.join(vo);

		return "redirect:/user/member_joinend";
	}

	// 회원가입 성공
	@RequestMapping(value = "/member_joinend")
	public String joinsuccess() {

		return "user/member_joinend";
	}

	// 로그인
	@RequestMapping(value = "/member_login", method = RequestMethod.GET)
	public String login() {
		return "user/member_login";
	}

	// 아이디 중복값 검증
	@ResponseBody
	@RequestMapping("/checkid")
	public String checkid(@RequestParam(value = "id") String id) {
		UserVo vo = userService.checkId(id);

		String result = (vo == null ? "notexist" : "exist");
		System.out.println(result);
		return result;
	}

	// 회원정보수정
	@RequestMapping(value = "/member_modify/{no}", method = RequestMethod.GET)
	public String modify(@PathVariable("no") Long no) {
		return "user/member_modify";
	}
	
	@RequestMapping(value = "/member_modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute UserVo vo) {
		userService.modify(vo);
		
		return "redirect:/user/member_modifying";
	}
	
	// 수정 완료 
	@RequestMapping(value="/member_modifying")
	public String modifying(SessionStatus sessionStatus) {
		sessionStatus.setComplete(); 
		return "user/member_modifying";
	}

}
