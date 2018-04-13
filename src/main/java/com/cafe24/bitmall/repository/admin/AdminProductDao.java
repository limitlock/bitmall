package com.cafe24.bitmall.repository.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.OptionVo;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.UserVo;

@Repository
public class AdminProductDao {

	@Autowired
	private SqlSession sqlSession;

	public List<CategoryVo> getCategoryList() {
		return sqlSession.selectList("adminproduct.getCategoryList");
	}

	public List<OptionVo> getOptionList() {
		return sqlSession.selectList("adminproduct.getOptionList");
	}

	public boolean insert(ProductVo vo) {
		int count = sqlSession.insert("adminproduct.insert", vo);
		return count == 1;

	}

	public List<ProductVo> getProductList(Long page) {

		return sqlSession.selectList("adminproduct.getProductList", page);
	}

	public boolean delete(Long no) {
		int count = sqlSession.delete("adminproduct.delete", no);
		return count == 1;
	}

	public List<ProductVo> getProduct(Long no) {

		return sqlSession.selectList("adminproduct.getProduct", no);
	}

	public boolean update(ProductVo vo) {
		int count = sqlSession.update("adminproduct.update", vo);
		return count == 1;

	}

	public Long getMax() {
		return sqlSession.selectOne("adminproduct.getMax");
	}

	public List<UserVo> search(Long tag1, String tag2, Long tag3, Long tag4, String searchText, Long page) {
		searchText = "%" + searchText + "%";
		Long tag2_number = Long.parseLong(tag2);
		tag2 = "%" + tag2 + "%";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchText", searchText);
		map.put("page", page);
		map.put("tag1", tag1);
		map.put("tag2", tag2);
		map.put("tag3", tag3);
		map.put("tag4", tag4);
		map.put("tag2_number", tag2_number);

		return sqlSession.selectList("adminproduct.searchProduct", map);
	}

	public Long getMaxSearch(Long tag1, String tag2, Long tag3, Long tag4, String searchText) {
		searchText = "%" + searchText + "%";
		Long tag2_number = Long.parseLong(tag2);
		tag2 = "%" + tag2 + "%";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchText", searchText);
		map.put("tag1", tag1);
		map.put("tag2", tag2);
		map.put("tag3", tag3);
		map.put("tag4", tag4);
		map.put("tag2_number", tag2_number);
		return sqlSession.selectOne("adminproduct.getMaxSearchProduct", map);
	}

}
