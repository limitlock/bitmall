package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.bitmall.repository.admin.AdminFAQDao;
import com.cafe24.bitmall.vo.FAQVo;

@Service
public class AdminFAQService {
	@Autowired
	private AdminFAQDao adminfaqDao;

	public void insert(FAQVo vo) {

		adminfaqDao.insert(vo);
	}

	public void getFAQList(Model model) {
		List<FAQVo> list = adminfaqDao.getFAQList();
		model.addAttribute("list", list);

	}

	public void getFAQ(Long no, Model model) {
		List<FAQVo> list = adminfaqDao.getFAQ(no);
		model.addAttribute("faq", list);

	}

	public void modifyFAQ(FAQVo vo) {
		adminfaqDao.modfiy(vo);
		
	}

	public void deleteFAQ(Long no) {
		adminfaqDao.delete(no);
		
	}

}
