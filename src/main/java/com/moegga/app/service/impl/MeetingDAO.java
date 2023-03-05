package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.TownDTO;

@Repository
public class MeetingDAO {

	@Resource(name = "template")
	private SqlSessionTemplate meetingTemplate;

	public List<MeetingDTO> selectMeetingList(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectList("selectMeetingList",map);
	}


	public int insertNewMeeting(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.insert("insertNewMeeting", map);
	}

	public MeetingDTO selectMeetingByOperator(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectOne("selectMeetingByOperator", map);
	}

	public List<MeetingDTO> selectJoinedMeetingList(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectList("selectJoinedMeetingList",map);
	}

	public List<MeetingDTO> selectBookMarkMeetingList(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectList("selectBookMarkMeetingList",map);

	}

	public int meetingLikeSelect(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectOne("meetingLikeSelect",map);
	}
	public MeetingDTO selectOneMeetingByNoAndId(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectOne("selectOneMeetingByNoAndId",map);
	}

	public MeetingDTO selectMeetingByNo(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectOne("selectMeetingByNo", map);
	}


	public int updateMeetingByOperator(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.update("updateMeetingByOperator", map);
	}


	public int deleteMeeting(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.delete("deleteMeeting", map);
	}


	public List<MeetingDTO> selectMeetingByMainCategory(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectList("selectMeetingByMainCategory", map);
	}


	public List<MeetingDTO> selectAllMeetingList(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectList("selectAllMeetingList", map);
	}

	public MeetingDTO selectMeetingById(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectOne("selectMeetingById", map);
	}


	public List<MeetingDTO> selectMeetingAll(Map map) {
		// TODO Auto-generated method stub
		return meetingTemplate.selectList("selectMeetingAll", map);
	}
	

}
