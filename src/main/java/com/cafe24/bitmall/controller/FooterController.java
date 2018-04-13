package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FooterController {
	@RequestMapping("/useinfo")
	public String useinfo() {
		return "/useinfo";
	}
	
	@RequestMapping("/company")
	public String company() {
		return "/company";
	}
	
	@RequestMapping("/policy")
	public String policy() {
		return "/policy";
	}
	

}
