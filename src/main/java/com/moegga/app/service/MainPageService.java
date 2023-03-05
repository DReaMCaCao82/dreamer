package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface MainPageService {

	
	
	/* 곧 시작되는 공연 리스트 */
	List<Map> upcomming_performance();

	/* 모임 추천 */
	List<MeetingDTO> getRecommends(Map map);
	Object getCurrentRoleCount(int meetingNo);
	
	/* 현재 인기있는 게시글 */
	List<Map> popular_bbs();
	String getbbsimage(String bbsno);

	/* 현재 진행 중인 펀딩 */
	List<Map> proceed_funding();

	
}
