package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;

@Service("townService")
public class TownServiceImpl implements TownService {
	
	@Resource(name="townDAO")
	TownDAO dao;

	@Override
	public int insertAddr(Map map) {
		
		return dao.insertAddr(map);
	}

	@Override
	public TownDTO selectTownById(Map map) {
		
		return dao.selectTownById(map);
	}

	@Override
	public int updateAddr(Map map) {
		// TODO Auto-generated method stub
		return dao.updateAddr(map);
	}

	
	
	

}
