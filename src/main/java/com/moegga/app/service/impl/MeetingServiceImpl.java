package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;

@Service("meetingService")
public class MeetingServiceImpl implements MeetingService {
	
	@Resource(name="meetingDAO")
	MeetingDAO dao;

	@Override
	public List<MeetingDTO> selectMeetingList(Map map) {
		
		return dao.selectMeetingList(map);
	}

	@Override
	public int insertNewMeeting(Map map) {
		
		return dao.insertNewMeeting(map);
	}

	@Override
	public MeetingDTO selectMeetingByOperator(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMeetingByOperator(map);
	}
	
	public List<MeetingDTO> selectJoinedMeetingList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectJoinedMeetingList(map);
	}

	@Override
	public List<MeetingDTO> selectBookMarkMeetingList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectBookMarkMeetingList(map);

	}

	@Override
	public int meetingLikeSelect(Map map) {
		// TODO Auto-generated method stub
		return dao.meetingLikeSelect(map);
	}

	@Override
	public MeetingDTO selectOneMeetingByNoAndId(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOneMeetingByNoAndId(map);
	}
	
	@Override
	public MeetingDTO selectMeetingByNo(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMeetingByNo(map);
	}

	@Override
	public int updateMeetingByOperator(Map map) {
		// TODO Auto-generated method stub
		return dao.updateMeetingByOperator(map);
	}

	@Override
	public int deleteMeeting(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteMeeting(map);
	}

	@Override
	public List<MeetingDTO> selectMeetingByMainCategory(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMeetingByMainCategory(map);
	}

	@Override
	public List<MeetingDTO> selectAllMeetingList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectAllMeetingList(map);
	}

	@Override
	public MeetingDTO selectMeetingById(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMeetingById(map);
	}

	@Override
	public List<MeetingDTO> selectMeetingAll(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMeetingAll(map);
	}
	
	

}
