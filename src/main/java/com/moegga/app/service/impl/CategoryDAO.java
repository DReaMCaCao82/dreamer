package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.TownDTO;

@Repository
public class CategoryDAO {

	@Resource(name = "template")
	private SqlSessionTemplate categoryTemplate;

	public int selectCategoryNo(Map map) {

		return categoryTemplate.selectOne("selectCategoryNo", map);
	}

	public List<Map> selectCategory(Map map) {
		// TODO Auto-generated method stub
		return categoryTemplate.selectList("selectCategory",map);
	}

	public List<Map> selectMainCategory() {
		// TODO Auto-generated method stub
		return categoryTemplate.selectList("selectMainCategory");
	}

	public List<Map> selectSubCategory(Map map) {
		// TODO Auto-generated method stub
		return categoryTemplate.selectList("selectSubCategory",map);
	}
	
	public int selectCategoryNoBySubcategory(Map map) {
		// TODO Auto-generated method stub
		return categoryTemplate.selectOne("selectCategoryNoBySubcategory",map);
	}

	public CategoryDTO selectCategoryOfThisMeeting(Map map) {
		// TODO Auto-generated method stub
		return categoryTemplate.selectOne("selectCategoryOfThisMeeting", map);
	}

	public CategoryDTO selectCategoryByMeetingNo(Map map) {
		// TODO Auto-generated method stub
		return categoryTemplate.selectOne("selectCategoryByMeetingNo", map);
	}


}
