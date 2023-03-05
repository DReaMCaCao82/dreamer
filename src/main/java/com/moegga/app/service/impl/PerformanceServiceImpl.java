package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.PerformanceDTO;
import com.moegga.app.service.PerformanceService;

@Service("performanceService")
public class PerformanceServiceImpl implements PerformanceService {
	
	@Resource(name="performanceDAO")
	PerformanceDAO dao;

	@Override
	public List<PerformanceDTO> selectPerformanceList(Map map){
		
		return dao.selectPerformanceList(map);
	}

	
	@Override
	public List<PerformanceDTO> selectMyTownPerformanceList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMyTownPerformanceList(map);
	}
	
	
	@Override
	public int insertNewPerformance(Map map) {
		// TODO Auto-generated method stub
		return dao.insertNewPerformance(map);
	}


	@Override
	public List<PerformanceDTO> selectPerformanceListOfThisMeeting(Map map) {
		// TODO Auto-generated method stub
		return dao.selectPerformanceListOfThisMeeting(map);
	}


	@Override
	public PerformanceDTO selectOnePerformanceByNo(Map map) {
		// TODO Auto-generated method stub
		return dao.onePerformanceByNo(map);
	}


	@Override
	public int updatePerformanceByNo(Map map) {
		// TODO Auto-generated method stub
		return dao.updatePerformanceByNo(map);
	}


	@Override
	public int deletePerformance(Map map) {
		// TODO Auto-generated method stub
		return dao.deletePerformance(map);
	}
	
	@Override
	public PerformanceDTO selectOnePerformance(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOnePerformance(map);
	}

}
