package com.cafe24.bitmall.repository.admin;

import java.util.List;

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
	public boolean insertOpts(OptsVo vo) {
		int count = sqlSession.insert("opt.insertOpts", vo);
		return count == 1;

	}

	public List<OptsVo> getOptsList(Long no) {
		return sqlSession.selectList("opt.getOptsList",no);
	}

}
