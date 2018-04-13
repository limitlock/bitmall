package com.cafe24.bitmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.admin.AdminFAQService;
import com.cafe24.bitmall.vo.FAQVo;
import com.cafe24.security.Auth;

@Controller
@RequestMapping("/ad")
public class AdminFAQController {

	@Autowired
	private AdminFAQService adminfaqService;

	@Auth
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(Model model) {

		adminfaqService.getFAQList(model);

		return "admin/faq";
	}

	@Auth
	@RequestMapping(value = "/faq_new", method = RequestMethod.GET)
	public String faqNew() {
		return "admin/faq_new";
	}

	@Auth
	@RequestMapping(value = "/faq_new", method = RequestMethod.POST)
	public String faqNew(@ModelAttribute FAQVo vo) {
		adminfaqService.insert(vo);
		return "redirect:/ad/faq";
	}

	@Auth
	@RequestMapping(value = "/faq_edit", method = RequestMethod.GET)
	public String faqEdit(@RequestParam("no") Long no, Model model) {
		adminfaqService.getFAQ(no, model);

		return "/admin/faq_edit";
	}

	@Auth
	@RequestMapping(value = "/faq_edit", method = RequestMethod.POST)
	public String faqEdit(@ModelAttribute FAQVo vo) {

		adminfaqService.modifyFAQ(vo);
		return "redirect:/ad/faq";
	}

	@Auth
	@RequestMapping(value = "/faq_delete", method = RequestMethod.GET)
	public String faqDelete(@RequestParam("no") Long no) {

		adminfaqService.deleteFAQ(no);
		return "redirect:/ad/faq";
	}

}
