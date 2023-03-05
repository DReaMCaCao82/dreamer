package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.ChattingDTO;
import com.moegga.app.service.ChattingService;
import com.moegga.app.service.MessageDTO;

@Service("chattingService")
public class ChattingServiceImpl implements ChattingService {

	@Resource(name="chattingDAO")
	ChattingDAO dao;

	/*채팅 목록*/
	@Override
	public List<ChattingDTO> chattingList(String id) {
		return dao.chattingList(id);
	}

	/*roleno 가져오기*/
	@Override
	public int selectRoleno(String currentUser) {
		return dao.selectRoleno(currentUser);
	}
	
	/*채팅 메시지 insert*/
	@Override
	public int chattingMsgInsert(Map<String, String> result) {
		return dao.chattingMsgInsert(result);
	}

	/*채팅 내역 출력용*/
	@Override
	public List<MessageDTO> chattingMessageList(String cno) {
		return dao.chattingMessageList(cno);
	}

	/*채팅방 참여 유무*/
	@Override
	public int isChatMember(String currentUser) {
		return dao.isChatMember(currentUser);
	}
	
	/*그룹채팅 생성 시 필요한 데이터 가져오기*/
	@Override
	public List<ChattingDTO> newMeetingInfo(Map map) {
		return dao.newMeetingInfo(map);
	}

	/*그룹 채팅 생성용*/
	@Override
	public int createChatRoom(Map map) {
		return dao.createChatRoom(map);
	}

	/*그룹 채팅 참가용*/
	@Override
	public int chatMemberInsert(Map result) {
		return dao.chatMemberInsert(result);
	}

	/*chatno 가져오기*/
	@Override
	public int getChatno(String meetingno) {
		return dao.getChatno(meetingno);
	}

	/* 가장 최근 메시지 가져오기 */
	@Override
	public List<MessageDTO> currentMsgInfo(String chatno) {
		return dao.currentMsgInfo(chatno);
	}

	/*현재 사용자의 이름 가져오기*/
	@Override
	public String getNickname(String currentUser) {
		return dao.getNickname(currentUser);
	}

	/*역할 no에 따른 이름 가져오기*/
	@Override
	public String getName(int roleno) {
		return dao.getName(roleno);
	}

	/* 모임정보(meetingno, meetingname) 가져오기 */
	@Override
	public Map getMeetingInfo(Map map) {
		return dao.getMeetingInfo(map);
	}

	/* 모임원의 모임정보(meetingno, meetingname) 가져오기 */
	@Override
	public Map getMeetingInfo_member(String currentUser) {
		return dao.getMeetingInfo_member(currentUser);
	}

	/* 첨부 파일 insert */
	@Override
	public int insertFileMessage(Map map) {
		return dao.insertFileMessage(map);
		
	}

	
	
}
