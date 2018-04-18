package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.repository.JumunDao;
import com.cafe24.bitmall.vo.JumunVo;
import com.cafe24.bitmall.vo.OrderProductVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.UserVo;
import com.cafe24.security.Auth;

@Controller
public class JumunController {

	@Autowired
	private JumunDao jumunDao;

	@Auth(role = Auth.Role.USER)
	@RequestMapping("/jumun")
	public String main(@RequestParam("userNo") Long no, Model model) {

		List<JumunVo> list = jumunDao.getJumunList(no);
		model.addAttribute("list", list);

		return "/jumun";
	}

	@RequestMapping("/jumun_info")
	public String jumunInfo(@RequestParam("orderNo") Long orderNo, Model model) {

		// 주문번호 ,결제방식, 받는사람 정보
		List<OrderVo> list = jumunDao.getOrderInfo(orderNo);
		for (OrderVo orderVo : list) {
			System.out.println(orderVo);
		}

		// 주문자 정보
		Long userNo = list.get(0).getUserNo();
		List<UserVo> user = jumunDao.getSender(userNo);
		
		// 최종 결제 금액
		Long orderInfoNo = jumunDao.getNo(orderNo);
		Long price = jumunDao.getPrice(orderInfoNo);
		
		model.addAttribute("price", price);
		model.addAttribute("orderinfo", list);
		model.addAttribute("sender", user);

		return "/jumun_info";
	}

	@ResponseBody
	@RequestMapping(value = "/jumun_info/getOrderProduct")
	public List<OrderProductVo> getOrderProduct(@RequestParam("orderNo") Long orderNo) {
		System.out.println("getOrderProduct");
		Long orderInfoNo = jumunDao.getNo(orderNo);

		List<OrderProductVo> list = jumunDao.getOrderProductList(orderInfoNo);
		for (OrderProductVo orderProductVo : list) {
			System.out.println(orderProductVo);
		}

		return list;

	}

}
