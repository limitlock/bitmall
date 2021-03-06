package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.repository.ProductDao;
import com.cafe24.bitmall.vo.OptsVo;
import com.cafe24.bitmall.vo.ProductVo;

@Controller
public class ProductController {

	@Autowired
	private ProductDao productDao;

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(@RequestParam("categoryNo") Long categoryNo, Model model) {

		Long max = productDao.getMax(categoryNo);
		model.addAttribute("max", max);

		return "/product";
	}

	@ResponseBody
	@RequestMapping(value = "/product/getProductList", method = RequestMethod.GET)
	public List<ProductVo> getProductList(@RequestParam(value = "page", required = true, defaultValue = "1") Long page,
			@RequestParam("categoryNo") Long categoryNo) {
		List<ProductVo> list = productDao.getProductList(categoryNo, page);

		return list;
	}

	@RequestMapping(value = "/product_detail", method = RequestMethod.GET)
	public String productDetail(@RequestParam("no") Long no) {

		return "/product_detail";
	}

	@ResponseBody
	@RequestMapping(value = "/product_detail/getProduct", method = RequestMethod.GET)
	public List<ProductVo> getProduct(@RequestParam("no") Long no) {
		List<ProductVo> list = productDao.getProduct(no);

		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/product_detail/getOpts", method = RequestMethod.GET)
	public List<OptsVo> getOpst(@RequestParam("no") Long no,
			@RequestParam(value = "optNo1", required = true, defaultValue = "1") Long optNo1,
			@RequestParam(value = "optNo2", required = true, defaultValue = "1") Long optNo2) {
		List<OptsVo> list = productDao.getOpts(no, optNo1, optNo2);
		return list;
	}


}
