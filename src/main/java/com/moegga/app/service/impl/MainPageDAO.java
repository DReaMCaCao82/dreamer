package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.MeetingDTO;

@Repository("mainpageDAO")
public class MainPageDAO {

	@Resource(name="template")
	private SqlSessionTemplate mainpageTemplate;

	
	
	
	/* 곧 시작되는 공연 리스트 */
	public List<Map> upcomming_performance() {
		return mainpageTemplate.selectList("upcomming_performance");
	}
	
	public List<MeetingDTO> getRecommends(Map map) {
		return mainpageTemplate.selectList("recommendMeeting", map);
	}

	public Object getCurrentRoleCount(int meetingNo) {
		return mainpageTemplate.selectOne("currentRoleCount", meetingNo);
	}

	/* 현재 인기있는 게시글 */
	public List<Map> popular_bbs() {
		return mainpageTemplate.selectList("popular_bbs");
	}

	public String getbbsimage(String bbsno) {
		return mainpageTemplate.selectOne("getbbsimage", bbsno);
	}
	
	/* 현재 진행 중인 펀딩 */
	public List<Map> proceed_funding() {
		return mainpageTemplate.selectList("proceed_funding");
	}
}
