package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.ChattingDTO;
import com.moegga.app.service.MessageDTO;

@Repository("chattingDAO")
public class ChattingDAO {

	@Resource(name="template")
	private SqlSessionTemplate chattingTemplate;
	
	/*채팅 목록*/
	public List<ChattingDTO> chattingList(String id) {
		return chattingTemplate.selectList("chattingList", id);
	}

	/*roleno 가져오기*/
	public int selectRoleno(String currentUser) {
		return chattingTemplate.selectOne("selectRoleno", currentUser);
	}
	
	/*채팅 메시지 insert*/
	public int chattingMsgInsert(Map<String, String> result) {
		return chattingTemplate.insert("chattingMsgInsert", result);
	}

	/*채팅 내역 출력용*/
	public List<MessageDTO> chattingMessageList(String cno) {
		return chattingTemplate.selectList("chattingMessageList", cno);
	}

	/*채팅방 참여 유무*/
	public int isChatMember(String currentUser) {
		return chattingTemplate.selectOne("isChatMember", currentUser);
	}

	/*그룹채팅 생성 시 필요한 데이터 가져오기*/
	public List<ChattingDTO> newMeetingInfo(Map map) {
		return chattingTemplate.selectList("newMeetingInfo", map);
	}
	
	/*그룹 채팅 생성용*/
	public int createChatRoom(Map map) {
		return chattingTemplate.insert("createChatRoom", map);
	}

	/*그룹 채팅 참가용*/
	public int chatMemberInsert(Map result) {
		return chattingTemplate.insert("chatMemberInsert", result);
	}

	/*chatno 가져오기*/
	public int getChatno(String meetingno) {
		return chattingTemplate.selectOne("getChatno", meetingno);
	}

	/* 가장 최근 메시지 가져오기 */
	public List<MessageDTO> currentMsgInfo(String chatno) {
		return chattingTemplate.selectList("currentMsgInfo", chatno);
	}

	/*현재 사용자의 이름 가져오기*/
	public String getNickname(String currentUser) {
		return chattingTemplate.selectOne("getNickname", currentUser);
	}

	/*역할 no에 따른 이름 가져오기*/
	public String getName(int roleno) {
		return chattingTemplate.selectOne("getName", roleno);
	}

	/* 모임정보(meetingno, meetingname) 가져오기 */
	public Map getMeetingInfo(Map map) {
		return chattingTemplate.selectOne("getMeetingInfo", map);
	}

	/* 모임원의 모임정보(meetingno, meetingname) 가져오기 */
	public Map getMeetingInfo_member(String currentUser) {
		return chattingTemplate.selectOne("getMeetingInfo_member", currentUser);
	}

	/* 첨부 파일 insert */
	public int insertFileMessage(Map map) {
		return chattingTemplate.insert("insertFileMessage", map);
	}


}
