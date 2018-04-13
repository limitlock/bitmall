package com.cafe24.bitmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.admin.AdminOptService;
import com.cafe24.bitmall.vo.OptVo;
import com.cafe24.bitmall.vo.OptsVo;
import com.cafe24.security.Auth;

@Controller
@RequestMapping("/ad")
public class AdminOptController {

	@Autowired
	private AdminOptService adminoptService;

	// 옵션 메인창
	@Auth
	@RequestMapping(value = "/opt", method = RequestMethod.GET)
	public String opt(Model model) {
		adminoptService.getOptList(model);

		return "admin/opt";
	}

	// 옵션 추가창
	@Auth
	@RequestMapping(value = "/opt_new", method = RequestMethod.GET)
	public String optNew() {
		return "admin/opt_new";
	}

	// 옵션 추가
	@Auth
	@RequestMapping(value = "/opt_new", method = RequestMethod.POST)
	public String optNew(@ModelAttribute OptVo vo) {
		adminoptService.insertOpt(vo);

		return "redirect:/ad/opt";
	}

	// 옵션 수정창
	@Auth
	@RequestMapping(value = "/opt_edit", method = RequestMethod.GET)
	public String optEdit(@RequestParam("no") Long no, Model model) {
		adminoptService.getOpt(no, model);
		return "admin/opt_edit";
	}

	// 옵션 수정
	@Auth
	@RequestMapping(value = "/opt_edit", method = RequestMethod.POST)
	public String optEdit(@ModelAttribute OptVo vo) {
		adminoptService.modifyOpt(vo);

		return "redirect:/ad/opt";
	}

	// 소옵션 메인창
	@Auth
	@RequestMapping(value = "/opts", method = RequestMethod.GET)
	public String opts(@RequestParam("no") Long no, Model model) {
		adminoptService.getOptsList(no, model);
		
		return "admin/opts";
	}

	// 소옵션 추가창
	@Auth
	@RequestMapping(value = "/opts_new", method = RequestMethod.GET)
	public String optsNew() {
		return "admin/opts_new";
	}

	// 소옵션 추가
	@Auth
	@RequestMapping(value = "/opts_new", method = RequestMethod.POST)
	public String optsNew(@ModelAttribute OptsVo vo) {
		adminoptService.insertOpts(vo);

		return "redirect:/ad/opts";
	}

}
