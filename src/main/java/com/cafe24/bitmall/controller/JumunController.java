package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.repository.JumunDao;
import com.cafe24.bitmall.vo.JumunVo;
import com.cafe24.security.Auth;

@Controller
public class JumunController {

	@Autowired
	private JumunDao jumunDao;

	@Auth
	@RequestMapping("/jumun")
	public String main(@RequestParam("userNo") Long no, Model model) {

		List<JumunVo> list = jumunDao.getJumunList(no);
		model.addAttribute("list", list);

		return "/jumun";
	}

	@RequestMapping("/jumun_info")
	public String jumunInfo() {
		return "/jumun_info";
	}

}
