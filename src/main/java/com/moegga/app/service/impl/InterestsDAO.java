package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.InterestsDTO;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.TownDTO;

@Repository
public class InterestsDAO {

	@Resource(name = "template")
	private SqlSessionTemplate interestsTemplate;


	public int insertInterests(Map map) {
		// TODO Auto-generated method stub
		return interestsTemplate.insert("insertInterests",map);
	}


	public List<InterestsDTO> selectInterestsList(Map map) {
		// TODO Auto-generated method stub
		return interestsTemplate.selectList("selectInterestsList",map);
	}


	public int deleteInterests(Map map) {
		// TODO Auto-generated method stub
		return interestsTemplate.delete("deleteInterests",map);
	}


	public int updateInterests(Map map) {
		// TODO Auto-generated method stub
		return interestsTemplate.update("updateInterests",map);
	}

}
