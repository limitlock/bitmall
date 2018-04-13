package com.cafe24.bitmall.repository.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.UserVo;

@Repository
public class AdminMemberDao {

	@Autowired
	private SqlSession sqlSession;

	public List<UserVo> getUserList(Long page) {
		
		return sqlSession.selectList("user.getUserList",page);
	}

	public List<UserVo> search(Long tag, String searchText, Long page) {
		
		searchText = "%"+searchText+"%";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchText", searchText);
		map.put("page", page);
		System.out.println("dddddddddd: "+searchText+page);
		
		if(tag == 1) {
			return sqlSession.selectList("user.searchByName",map);
		}else {
			return sqlSession.selectList("user.searchById",map);
		}
	}

	public Long getMax() {
		return sqlSession.selectOne("user.getMax");
	}

	public Long getMaxSearch(Long tag, String searchText) {
		searchText = "%"+searchText+"%";
		if(tag == 1) {
			return sqlSession.selectOne("user.getMaxSearchByName",searchText);
		}else {
			return sqlSession.selectOne("user.getMaxSearchById",searchText);
		}
		
		
	}

	public boolean delete(Long no) {
		int count = sqlSession.delete("user.delete",no);
		return count == 1;
		
	}
	

}
