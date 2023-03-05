package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface InterestsService {
	public int insertInterests(Map map);

	public List<InterestsDTO> selectInterestsList(Map map);

	public int deleteInterests(Map map);

	public int updateInterests(Map map);
	

}
