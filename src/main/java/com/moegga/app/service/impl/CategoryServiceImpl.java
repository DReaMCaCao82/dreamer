package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Resource(name="categoryDAO")
	CategoryDAO dao;

	@Override
	public int selectCategoryNo(Map map) {
		return dao.selectCategoryNo(map);
	}

	@Override
	public List<Map> selectCategory(Map map) {
		// TODO Auto-generated method stub
		return dao.selectCategory(map);
	}

	@Override
	public List<Map> selectMainCategory() {
		// TODO Auto-generated method stub
		return dao.selectMainCategory();
	}

	@Override
	public List<Map> selectSubCategory(Map map) {
		// TODO Auto-generated method stub
		return dao.selectSubCategory(map);
	}
	
	@Override
	public int selectCategoryNoBySubcategory(Map map) {
		// TODO Auto-generated method stub
		return dao.selectCategoryNoBySubcategory(map);
	}

	@Override
	public CategoryDTO selectCategoryOfThisMeeting(Map map) {
		// TODO Auto-generated method stub
		return dao.selectCategoryOfThisMeeting(map);
	}

	@Override
	public CategoryDTO selectCategoryByMeetingNo(Map map) {
		// TODO Auto-generated method stub
		return dao.selectCategoryByMeetingNo(map);
	}
	
	
	

}
