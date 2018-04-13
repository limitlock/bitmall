package com.cafe24.bitmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.service.admin.AdminProductService;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.security.Auth;

@Controller
@RequestMapping("/ad")
public class AdminProductController {

	@Autowired
	private AdminProductService adminProductService;

	// 상품관리 메인창
	@Auth
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model, @RequestParam(value = "page", required = true, defaultValue = "1") Long page) {
		adminProductService.getProductList(model, page);

		return "admin/product";
	}

	// 상품 수정창
	@Auth
	@RequestMapping(value = "product_edit", method = RequestMethod.GET)
	public String productEdit(@RequestParam("no") Long no, Model model) {
		adminProductService.getProduct(no, model);
		adminProductService.getCategory(model);
		adminProductService.getOption(model);

		return "admin/product_edit";
	}

	// 상품 수정
	@Auth
	@RequestMapping(value = "product_edit", method = RequestMethod.POST)
	public String productEdit(@ModelAttribute ProductVo vo, @RequestParam("image1") MultipartFile multipartFile1,
			@RequestParam("image2") MultipartFile multipartFile2, @RequestParam("image3") MultipartFile multipartFile3,
			@RequestParam("imagename1") String path1, @RequestParam("imagename2") String path2,
			@RequestParam("imagename3") String path3) {

		if (multipartFile1.isEmpty()) {
			System.out.println("dddd");
			vo.setFile1(path1);
		} else {
			String url1 = adminProductService.restore(multipartFile1);
			vo.setFile1(url1);
		}

		if (multipartFile2.isEmpty()) {
			vo.setFile2(path2);
		} else {
			String url2 = adminProductService.restore(multipartFile2);
			vo.setFile2(url2);
		}

		if (multipartFile3.isEmpty()) {
			vo.setFile3(path3);
		} else {
			String url3 = adminProductService.restore(multipartFile3);
			vo.setFile3(url3);
		}

		adminProductService.modifyProduct(vo);

		return "redirect:/ad/product";
	}

	// 상품 삭제
	@Auth
	@RequestMapping(value = "product_delete", method = RequestMethod.GET)
	public String productDelete(@RequestParam("no") Long no, @RequestParam("page") Long page) {

		adminProductService.deleteProduct(no);
		return "redirect:/ad/product?page=" + page;
	}

	// 상품 입력창
	@Auth
	@RequestMapping(value = "/product_new", method = RequestMethod.GET)
	public String productNew(Model model) {
		// 상품 카테고리
		adminProductService.getCategory(model);
		adminProductService.getOption(model);

		return "admin/product_new";

	}

	// 상품 입력
	@Auth
	@RequestMapping(value = "/product_new", method = RequestMethod.POST)
	public String productNew(@ModelAttribute ProductVo vo, 
			@RequestParam("beforefile1") MultipartFile multipartFile1,
			@RequestParam("beforefile2") MultipartFile multipartFile2,
			@RequestParam("beforefile3") MultipartFile multipartFile3) {

		if (multipartFile1.isEmpty()) {
			vo.setFile1("");
		} else {
			String url1 = adminProductService.restore(multipartFile1);
			vo.setFile1(url1);
		}

		if (multipartFile2.isEmpty()) {
			vo.setFile2("");
		} else {
			String url2 = adminProductService.restore(multipartFile2);
			vo.setFile2(url2);
		}

		if (multipartFile3.isEmpty()) {
			vo.setFile3("");
		} else {
			String url3 = adminProductService.restore(multipartFile3);
			vo.setFile3(url3);
		}

		adminProductService.insert(vo);

		return "redirect:/ad/product?page=1";

	}

	@Auth
	@RequestMapping(value = "/search_product", method = RequestMethod.GET)
	public String search(@RequestParam("sel1") Long tag1, // 상품상태(판매중, 판매중지, 품절)
			@RequestParam("sel2") String tag2, // 아이콘(new,hit,sale)
			@RequestParam("sel3") Long tag3, // 분류(아우터,상의,하의)
			@RequestParam("sel4") Long tag4, // 제품이름, 코드
			@RequestParam("search_text") String searchText, @RequestParam("page") Long page, Model model) {

		adminProductService.search(tag1, tag2, tag3, tag4, searchText, model, page);

		return "admin/product";
	}

}
