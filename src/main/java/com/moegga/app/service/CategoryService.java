package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface CategoryService {
	
	public int selectCategoryNo(Map map);

	public List<Map> selectCategory(Map map);

	public List<Map> selectMainCategory();

	public List<Map> selectSubCategory(Map map);
	
	public int selectCategoryNoBySubcategory(Map map);

	public CategoryDTO selectCategoryOfThisMeeting(Map map);

	public CategoryDTO selectCategoryByMeetingNo(Map map);

	
	

}
