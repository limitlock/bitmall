package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class FAQController {

	@RequestMapping("/faq")
	public String main() {
		return "faq";
	}
}
