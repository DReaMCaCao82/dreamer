package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.PerformanceDTO;
import com.moegga.app.service.TownDTO;

@Repository
public class PerformanceDAO {

	@Resource(name = "template")
	private SqlSessionTemplate performanceTemplate;

	
	public List<PerformanceDTO> selectPerformanceList(Map map) {
		// TODO Auto-generated method stub
		return performanceTemplate.selectList("selectPerformanceList",map);
	}
	
	
	public List<PerformanceDTO> selectMyTownPerformanceList(Map map){
		
		return performanceTemplate.selectList("selectMyTownPerformanceList", map);
	}


	public int insertNewPerformance(Map map) {
		// TODO Auto-generated method stub
		return performanceTemplate.insert("insertNewPerformance", map);
	}


	public List<PerformanceDTO> selectPerformanceListOfThisMeeting(Map map) {
		// TODO Auto-generated method stub
		return performanceTemplate.selectList("selectPerformanceListOfThisMeeting", map);
	}


	public PerformanceDTO onePerformanceByNo(Map map) {
		// TODO Auto-generated method stub
		return performanceTemplate.selectOne("onePerformanceByNo", map);
	}


	public int updatePerformanceByNo(Map map) {
		// TODO Auto-generated method stub
		return performanceTemplate.update("updatePerformanceByNo", map);
	}


	public int deletePerformance(Map map) {
		// TODO Auto-generated method stub
		return performanceTemplate.delete("deletePerformance", map);
	}

	public PerformanceDTO selectOnePerformance(Map map) {
		// TODO Auto-generated method stub
		return performanceTemplate.selectOne("selectOnePerformance",map);
	}
	

}
