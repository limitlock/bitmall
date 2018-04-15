package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.bitmall.repository.admin.AdminMemberDao;
import com.cafe24.bitmall.vo.UserVo;

@Service
public class AdminMemberService {
	@Autowired
	private AdminMemberDao adminMemberDao;

	public void getUserList(Model model, Long page) {
		page = (page - 1) * 5;
		List<UserVo> list = adminMemberDao.getUserList(page);

		Long max = adminMemberDao.getMax();
		model.addAttribute("max", max);
		
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);

	}

	public void search(Long tag, String searchText, Model model, Long page) {

		page = (page - 1) * 5;
		List<UserVo> list = adminMemberDao.search(tag, searchText, page);
		Long max = adminMemberDao.getMaxSearch(tag, searchText);

		model.addAttribute("max", max);

		model.addAttribute("size", list.size());
		model.addAttribute("list", list);

	}

	public void deleteUser(Long no) {
		adminMemberDao.delete(no);

	}

}
