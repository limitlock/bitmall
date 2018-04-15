package com.cafe24.bitmall.repository.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OptVo;
import com.cafe24.bitmall.vo.OptsVo;

@Repository
public class AdminOptDao {

	@Autowired
	private SqlSession sqlSession;

	public boolean insertOpt(OptVo vo) {
		int count = sqlSession.insert("opt.insertOpt", vo);
		return count == 1;

	}

	public List<OptVo> getOptList() {
		return sqlSession.selectList("opt.getOptList");
	}

	public List<OptVo> getOpt(Long no) {
		return sqlSession.selectList("opt.getOpt", no);
	}

	public boolean modifyOpt(OptVo vo) {
		int count = sqlSession.update("opt.modifyOpt", vo);
		System.out.println(vo);
		return count == 1;
	}

	// 소옵션 추가 (외래키참조)
	public boolean insertOpts(Long optNo, String title) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("optNo", optNo);
		map.put("title", title);

		int count = sqlSession.insert("opt.insertOpts", map);
		return count == 1;

	}

	public List<OptsVo> getOptsList(Long no) {
		return sqlSession.selectList("opt.getOptsList", no);
	}

	public boolean deleteOpts(Long no) {
		int count = sqlSession.delete("opt.deleteOpts", no);
		return count == 1;
	}

	public List<OptsVo> getOpts(Long no, Long optNo) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("optNo", optNo);
		map.put("no", no);

		return sqlSession.selectList("opt.getOpts", map);
	}

	public boolean modifyOpts(OptsVo vo) {
		int count = sqlSession.update("opt.modifyOpts",vo);
		return count == 1;
	}

}
