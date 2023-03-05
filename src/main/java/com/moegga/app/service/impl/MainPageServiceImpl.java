package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.MainPageService;
import com.moegga.app.service.MeetingDTO;


@Service("mainpageService")
public class MainPageServiceImpl implements MainPageService{

	@Resource(name="mainpageDAO")
	MainPageDAO dao;
	
	/* 곧 시작되는 공연 리스트 */
	@Override
	public List<Map> upcomming_performance() {
		return dao.upcomming_performance();
	}

	/* 모임 추천 */
	@Override
	public List<MeetingDTO> getRecommends(Map map) {
		return dao.getRecommends(map);
	}

	/* 역할 개수 */
	@Override
	public Object getCurrentRoleCount(int meetingNo) {
		return dao.getCurrentRoleCount(meetingNo);
	}
	
	/* 현재 인기있는 게시글 */
	@Override
	public List<Map> popular_bbs() {
		return dao.popular_bbs();
	}

	@Override
	public String getbbsimage(String bbsno) {
		return dao.getbbsimage(bbsno);
	}
	
	/* 현재 진행 중인 펀딩 */
	@Override
	public List<Map> proceed_funding() {
		return dao.proceed_funding();
	}

	

}
