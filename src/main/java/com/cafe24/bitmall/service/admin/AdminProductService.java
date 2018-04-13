package com.cafe24.bitmall.service.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.repository.admin.AdminProductDao;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.OptionVo;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.UserVo;

@Service
public class AdminProductService {

	private String SAVE_PATH = "/uploads";
	private String PREFIX_URL = "/uploads/";

	@Autowired
	private AdminProductDao adminProductDao;

	public void getCategory(Model model) {

		List<CategoryVo> list = adminProductDao.getCategoryList();
		model.addAttribute("category", list);

	}

	public void getOption(Model model) {
		List<OptionVo> list = adminProductDao.getOptionList();
		model.addAttribute("option", list);

	}

	public void insert(ProductVo vo) {
		adminProductDao.insert(vo);
	}

	public void getProductList(Model model, Long page) {
		page = (page - 1) * 5;
		List<ProductVo> list = adminProductDao.getProductList(page);

		Long max = adminProductDao.getMax();
		model.addAttribute("max", max);

		model.addAttribute("size", list.size());
		model.addAttribute("product", list);
	}

	public void deleteProduct(Long no) {

		adminProductDao.delete(no);
	}

	public void getProduct(Long no, Model model) {
		List<ProductVo> list = adminProductDao.getProduct(no);
		System.out.println(list);
		model.addAttribute("product", list);

	}

	public void modifyProduct(ProductVo vo) {
		adminProductDao.update(vo);
	}

	public String restore(MultipartFile multipartFile) {

		String url = "";

		try {

			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());

			Long size = multipartFile.getSize();

			String saveFilename = genSaveFilename(extName);

			writeFiel(multipartFile, saveFilename);
			url = PREFIX_URL + saveFilename;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		return url;
	}

	private void writeFiel(MultipartFile multipartFile, String saveFilename) throws IOException {
		byte[] filedata = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
		fos.write(filedata);
		fos.flush();
		fos.close();
	}

	private String genSaveFilename(String extName) {

		String filename = "";

		Calendar cl = Calendar.getInstance();
		filename += cl.get(Calendar.YEAR);
		filename += cl.get(Calendar.MONTH);
		filename += cl.get(Calendar.DATE);
		filename += cl.get(Calendar.HOUR);
		filename += cl.get(Calendar.MINUTE);
		filename += cl.get(Calendar.SECOND);
		filename += cl.get(Calendar.MILLISECOND);
		filename += extName;

		return filename;
	}

	public void search(Long tag1, String tag2, Long tag3, Long tag4, String searchText, Model model, Long page) {
		page = (page - 1) * 5;

		List<UserVo> list = adminProductDao.search(tag1, tag2, tag3, tag4, searchText, page);
		Long max = adminProductDao.getMaxSearch(tag1, tag2, tag3, tag4, searchText);
		
		model.addAttribute("max", max);
		model.addAttribute("product", list);

	}

}
