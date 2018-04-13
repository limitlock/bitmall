package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.bitmall.repository.admin.AdminOptDao;
import com.cafe24.bitmall.vo.OptVo;
import com.cafe24.bitmall.vo.OptsVo;

@Service
public class AdminOptService {

	@Autowired
	private AdminOptDao adminoptDao;

	public void insertOpt(OptVo vo) {
		adminoptDao.insertOpt(vo);
	}

	public void getOptList(Model model) {
		List<OptVo> list = adminoptDao.getOptList();
		model.addAttribute("list", list);
		model.addAttribute("size",list.size());

	}

	public void getOpt(Long no, Model model) {
		List<OptVo> list = adminoptDao.getOpt(no);
		model.addAttribute("list", list);
	}

	public void modifyOpt(OptVo vo) {
		adminoptDao.modifyOpt(vo);
		
	}

	public void insertOpts(OptsVo vo) {
		adminoptDao.insertOpts(vo);
		
	}

	public void getOptsList(Long no, Model model) {
		List<OptsVo> list = adminoptDao.getOptsList(no);
		model.addAttribute("list", list);
		
	}

}
