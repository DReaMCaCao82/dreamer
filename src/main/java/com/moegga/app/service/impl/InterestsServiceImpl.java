package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.InterestsDTO;
import com.moegga.app.service.InterestsService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;

@Service("interestsService")
public class InterestsServiceImpl implements InterestsService {
	
	@Resource(name="interestsDAO")
	InterestsDAO dao;

	@Override
	public int insertInterests(Map map) {
		
		return dao.insertInterests(map);
	}

	@Override
	public List<InterestsDTO> selectInterestsList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectInterestsList(map);
	}

	@Override
	public int deleteInterests(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteInterests(map);
	}

	@Override
	public int updateInterests(Map map) {
		// TODO Auto-generated method stub
		return dao.updateInterests(map);
	}


	
	
	

}
