package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.repository.MainDao;
import com.cafe24.bitmall.service.MainService;
import com.cafe24.bitmall.vo.ProductVo;

@Controller
public class MainController {

	@Autowired
	private MainDao mainDao;

	@RequestMapping({ "/index", "", "/" })
	public String index(Model model) {

		return "main/index";
	}

	@ResponseBody
	@RequestMapping(value = "/getAllProductList", method = RequestMethod.GET)
	public List<ProductVo> getAllProductList() {
		List<ProductVo> list = mainDao.getAllProductList();
		return list;
	}

}
