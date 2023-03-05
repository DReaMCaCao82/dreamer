package com.moegga.app.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moegga.app.service.CategoryService;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;

@RestController
public class CategoryAjaxController {

	@Resource(name = "categoryService")
	CategoryService category;

	@PostMapping(value = "/categoryAjax.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String categoryAjax(@RequestParam Map map) {
		// 1]서비스 호출
		List<Map> subCategory=category.selectSubCategory(map);
		for(Map subcate : subCategory) {
			System.out.println("서브카테고리:"+subcate.get("SUBCATEGORY"));
		}
		
		JSONObject json = new JSONObject();
		
		json.put("subCategory", subCategory);
		

		

		return json.toJSONString();
	}/////////////

	
}///////////// class
