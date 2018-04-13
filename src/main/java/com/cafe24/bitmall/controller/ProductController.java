package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

	@RequestMapping(value="/product", method=RequestMethod.GET)
	public String product(@RequestParam("menu") Long menu) {
		return "/product";
	}
	
	@RequestMapping(value="/product_detail", method=RequestMethod.GET)
	public String productDetail(@RequestParam("no") Long no) {
		return "/product_detail";
	}
	
	
	
	
	
	
	
}
