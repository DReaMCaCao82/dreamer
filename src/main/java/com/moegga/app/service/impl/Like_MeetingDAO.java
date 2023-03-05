package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.TownDTO;

@Repository("like_meetingDAO")
public class Like_MeetingDAO {

	@Resource(name="template")
	private SqlSessionTemplate like_meetingTemplate;

	public int deleteBookMark(Map map) {
		// TODO Auto-generated method stub
		return like_meetingTemplate.delete("deleteBookMark",map);
	}

	public String selectMeetingLike(Map map) {
		// TODO Auto-generated method stub
		return like_meetingTemplate.selectOne("selectMeetingLike",map);
	}

	public int insertMeetingLike(Map map) {
		// TODO Auto-generated method stub
		return like_meetingTemplate.insert("insertMeetingLike",map);
	}

	
	

}
