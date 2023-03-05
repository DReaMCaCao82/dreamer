package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface MeetingRoleService {


	int selectMeetingRoleList(Map map);
	int insertMemberRole(Map map);
	int insertOperator(Map map);
	List<MeetingRoleDTO> selectThisMeetingRole(Map map);
	int updateOperatorRole(Map map);
	int updateMemberRole(Map map);
	int joinMeetingDescription(Map map);
	int selectJoinMeetingList(Map map);
	List<MeetingRoleDTO> selectMyMeetingRole(Map map);
	int joinMeetingOk(Map map);
	int joinMeetingReject(Map map);
	int deleteMyMeeting(Map map);
	int deleteMeetingRole(Map map);
	int joinProposition(Map map);
	int propositionOk(Map map);
	int propositionReject(Map map);
	List<MeetingRoleDTO> selectPropositionList(Map map);
   


}
