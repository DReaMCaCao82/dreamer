package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface PerformanceService {

	List<PerformanceDTO> selectPerformanceList(Map map);
	
	int insertNewPerformance(Map map);

	List<PerformanceDTO> selectMyTownPerformanceList(Map map);
	
	PerformanceDTO selectOnePerformance(Map map);

	List<PerformanceDTO> selectPerformanceListOfThisMeeting(Map map);

	PerformanceDTO selectOnePerformanceByNo(Map map);

	int updatePerformanceByNo(Map map);

	int deletePerformance(Map map);




	

}
