package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.repository.CartDao;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.security.Auth;

@Controller
public class CartController {

	@Autowired
	private CartDao cartDao;

	@Auth(role = Auth.Role.USER)
	@RequestMapping("/cart")
	public String cart() {
		return "/cart";
	}

	@ResponseBody
	@RequestMapping(value = "/cart/plus")
	public void plus(@ModelAttribute CartVo vo) {
		cartDao.insert(vo);
	}

	@ResponseBody
	@RequestMapping(value = "/cart/getOrder")
	public List<CartVo> getOrder(@RequestParam("userNo") Long userNo) {
		System.out.println(userNo);
		List<CartVo> list = cartDao.getCartProductList(userNo);
		return list;
	}

	@RequestMapping(value = "/cart/delete")
	public String delete(@RequestParam("productNo") Long productNo) {

		cartDao.delete(productNo);
		return "redirect:/cart";

	}

	@RequestMapping(value = "/cart/deleteAll")
	public String deleteAll(@RequestParam("userNo") Long no) {

		cartDao.deleteAll(no);
		return "redirect:/cart";

	}

}
