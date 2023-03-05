package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.BBS_ImgService;
import com.moegga.app.service.Like_MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;

@Service("like_meetingService")
public class Like_MeetingServiceImpl implements Like_MeetingService {
	
	@Resource(name="like_meetingDAO")
	Like_MeetingDAO dao;

	@Override
	public int deleteBookMark(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteBookMark(map);
	}

	@Override
	public String selectMeetingLike(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMeetingLike(map);
	}

	@Override
	public int insertMeetingLike(Map map) {
		// TODO Auto-generated method stub
		return dao.insertMeetingLike(map);
	}
	
	
	

}
