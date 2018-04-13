package com.cafe24.bitmall.repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.FAQVo;

@Repository
public class AdminFAQDao {
	@Autowired
	private SqlSession sqlSession;

	public boolean insert(FAQVo vo) {
		int count = sqlSession.insert("faq.insert", vo);
		return count == 1;

	}

	public List<FAQVo> getFAQList() {
		return sqlSession.selectList("faq.getFAQList");

	}

	public List<FAQVo> getFAQ(Long no) {

		return sqlSession.selectList("faq.getFAQ", no);
	}

	public boolean modfiy(FAQVo vo) {
		int count = sqlSession.update("faq.modify", vo);
		return count == 1;

	}

	public boolean delete(Long no) {
		int count = sqlSession.delete("faq.delete", no);
		return count == 1;

	}

}
