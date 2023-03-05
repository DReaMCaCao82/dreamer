package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingRoleDTO;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.TownDTO;

@Repository
public class MeetingRoleDAO {



   @Resource(name = "template")
   private SqlSessionTemplate meetingRoleTemplate;

	public int selectMeetingRoleList(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.selectOne("selectMeetingRoleList",map);
	}

	public int insertMemberRole(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.insert("insertMemberRole",map);
	}
	
	public int insertOperator(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.insert("insertOperator",map);
	}

	public List<MeetingRoleDTO> selectThisMeetingRole(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.selectList("selectThisMeetingRole", map);
	}

	public int updateOperatorRole(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("updateOperatorRole", map);
	}

	public int updateMemberRole(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("updateMemberRole", map);
	}

	public int joinMeetingDescription(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("joinMeetingDescription", map);
	}

	public int selectJoinMeetingList(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.selectOne("selectJoinMeetingList", map);
	}

	public List<MeetingRoleDTO> selectMyMeetingRole(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.selectList("selectMyMeetingRole", map);
	}

	public int joinMeetingOk(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("joinMeetingOk", map);
	}

	public int joinMeetingReject(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("joinMeetingReject", map);
	}

	public int deleteMyMeeting(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.delete("deleteMyMeeting", map);
	}

	public int deleteMeetingRole(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.delete("deleteMeetingRole", map);
	}

	public int joinProposition(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("joinProposition", map);
	}

	public int propositionOk(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("propositionOk", map);
	}

	public int propositionReject(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.update("propositionReject", map);
	}

	public List<MeetingRoleDTO> selectPropositionList(Map map) {
		// TODO Auto-generated method stub
		return meetingRoleTemplate.selectList("selectPropositionList", map);
	}

   

}

