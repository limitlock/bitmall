package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {
	
	@RequestMapping("/qa")
	public String main() {
		return "qa";
	}

}
