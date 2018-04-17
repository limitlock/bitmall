package com.cafe24.bitmall.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.repository.OrderDao;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.OrderProductVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.UserVo;

@Controller
public class OrderController {

	@Autowired
	private OrderDao orderDao;

	CartVo list;

	@RequestMapping("/order")
	public String main(@RequestParam("userNo") Long userNo, Model model) {

		List<UserVo> list = orderDao.getUser(userNo);
		model.addAttribute("list", list);
		return "/order";
	}

	@ResponseBody
	@RequestMapping(value = "/order/getCartOrder")
	public List<CartVo> getCartOrder(@RequestParam("userNo") Long userNo) {
		List<CartVo> list = orderDao.getCartProductList(userNo);
		return list;

	}

	@ResponseBody
	@RequestMapping(value = "/order/tempOrder")
	public JSONResult tempOrder(@ModelAttribute CartVo vo) {
		list = vo;
		System.out.println(list);
		return JSONResult.success(list);

	}

	@ResponseBody
	@RequestMapping(value = "/order/getOrder")
	public CartVo getOrder() {
		return list;
	}

	@RequestMapping(value = "/order_pay", method = RequestMethod.POST)
	public String orderPay(@ModelAttribute OrderVo vo, Model model,
			@RequestParam(value = "flag", required = true, defaultValue = "0") Long flag) {
		model.addAttribute("vo", vo);
		model.addAttribute("flag", flag);
		return "order_pay";
	}

	@RequestMapping(value = "/order_ok", method = RequestMethod.POST)
	public String orderOk(@ModelAttribute OrderVo vo, Model model, @RequestParam("userNo") Long userNo,
			@RequestParam(value = "flag", required = true, defaultValue = "0") Long flag) {
		String orderNo = genSaveFilename();

		vo.setOrderNo(orderNo);
		// 주문서 저장
		orderDao.insertOrder(vo);

		// 주문번호로 주문 테이블의 no 값을 가져온다.
		Long orderByNo = orderDao.getNo(orderNo);

		if (flag == 1) { // 바로구매
			//파라미터 값을 어떻게?
			//orderDao.insertOrderProductList( );
			
			
			
		} else {
			// 주문된 장바구니
			List<CartVo> list = orderDao.getCartProductList(userNo);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setOrderNo(orderByNo);
				System.out.println(list.get(i));
				orderDao.insertOrderProductList(list.get(i));
			}

		}

		// 임시 장바구니 비우기
		orderDao.deleteAll(userNo);

		return "order_ok";
	}

	private String genSaveFilename() {

		String filename = "";

		Calendar cl = Calendar.getInstance();
		filename += cl.get(Calendar.YEAR);
		filename += cl.get(Calendar.MONTH);
		filename += cl.get(Calendar.DATE);
		filename += cl.get(Calendar.HOUR);
		filename += cl.get(Calendar.MINUTE);
		filename += cl.get(Calendar.SECOND);
		filename += cl.get(Calendar.MILLISECOND);

		return filename;
	}

}
