package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface ChattingService {
	
	/*채팅 목록*/
	List<ChattingDTO> chattingList(String id);

	/*roleno 가져오기*/
	int selectRoleno(String currentUser);
	
	/*채팅 메시지 insert*/
	int chattingMsgInsert(Map<String, String> result);

	/*채팅 내역 출력용*/
	List<MessageDTO> chattingMessageList(String cno);

	/*채팅방 참여 유무*/
	int isChatMember(String currentUser);

	/*그룹채팅 생성 시 필요한 데이터 가져오기*/
	List<ChattingDTO> newMeetingInfo(Map map);
	
	/*그룹 채팅 생성용*/
	int createChatRoom(Map map);

	/*그룹 채팅 참가용*/
	int chatMemberInsert(Map result);

	/*chatno 가져오기*/
	int getChatno(String meetingno);

	/* 가장 최근 메시지 가져오기 */
	List<MessageDTO> currentMsgInfo(String chatno);

	/*현재 사용자의 이름 가져오기*/
	String getNickname(String currentUser);

	/*역할 no에 따른 이름 가져오기*/
	String getName(int roleno);
	
	/* 모임정보(meetingno, meetingname) 가져오기 */
	Map getMeetingInfo(Map map);

	/* 모임원의 모임정보(meetingno, meetingname) 가져오기 */
	Map getMeetingInfo_member(String currentUser);

	/* 첨부 파일 insert */
	int insertFileMessage(Map map);
	

	
	
	
}
