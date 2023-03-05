package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface MeetingService {

	List<MeetingDTO> selectMeetingList(Map map);
	
	int insertNewMeeting(Map map);

	MeetingDTO selectMeetingByOperator(Map map);

	List<MeetingDTO> selectJoinedMeetingList(Map map);

	List<MeetingDTO> selectBookMarkMeetingList(Map map);
	
	int meetingLikeSelect(Map map);
	
	MeetingDTO selectOneMeetingByNoAndId(Map map);

	MeetingDTO selectMeetingByNo(Map map);

	int updateMeetingByOperator(Map map);

	int deleteMeeting(Map map);

	List<MeetingDTO> selectMeetingByMainCategory(Map map);

	List<MeetingDTO> selectAllMeetingList(Map map);
	
	MeetingDTO selectMeetingById(Map map);

	List<MeetingDTO> selectMeetingAll(Map map);

	

}
