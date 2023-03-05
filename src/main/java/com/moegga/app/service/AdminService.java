package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	/*통계용*/
	List<Map> ageAndGender();
	List<Map> categoryAndMeeting();
	List<Map> subcategoryAndMeeting();
	List<Map> townAndMeeting();
	/*게시글 신고 관리용*/
	List<BBSAccusationDTO> bbsAccusationSelectlist(Map map);
	int getTotalRecordCountBBSAccusation();
	Map selectBbs(String bbsno);
	void bbsAccusationProcess(Map map);
	/*모임 신고 관리용*/
	List<MeetingAccusationDTO> meetingAccusationSelectlist(Map map);
	int getTotalRecordCountMeetingAccusation();
	Map selectMeeting(String meetingno);
	void meetingAccusationProcess(Map map);
	/*공지사항 관리용*/
	List<Map> noticeSelectlist(Map map);
	int getTotalRecordCountNotice();
	Map noticeSelectone(String noticeno);
	int noticeInsert(Map map);
	int noticeUpdate(Map map);
	int noticeDelete(String noticeno);
	int noticeEnabledToggle(Map map);
	/*메인에서 공지사항 보여주기*/
	List<Map> mainNoticeSelectlist();
	
	/*회원 조회용*/
	List<Map> memberList();
	/*정지 회원 조회용*/
	List<Map> suspendMemberList();
	/*모임 조회용*/
	List<Map> meetingList();
	/*정지 모임 조회용*/
	List<Map> suspendMeetingList();
	/*회원 정지 해제용*/
	int memberSuspendRelease(Map map);
	/*모임 정지 해제용*/
	int meetingSuspendRelease(Map map);
	/*정지 회원 검색용*/
	List<Map> searchMember(String keyword);
	/*정지 모임 검색용*/
	List<Map> searchMeeting(String keyword);

	//admin애서 전체 문의게시판 리스트
	List<Map> questionselectList(Map map);
	int getTotalRecord(Map map);
	//admin 문의보기
	BBSDTO qsusetionselectOne(Map map);
	//admin 문의 답장용
	int qsusetionsupdate(Map map);
	///admin 펀딩 목록가져오기
	List<FundingDTO> fundingadminlist(Map map);
	///admin 펀딩 총갯수
	int getfundingtotal(Map map);
	
	////펀딩 승인 수락용
	int fundingupdate(Map map);
	///펀딩 삭제
	int  fundingDelete(Map map);
	///카테고리 리스트용
	List<CategoryDTO> categorylist(Map map);
	//카테고리 총갯수
	int getcategorygtotal(Map map);
	
	////카테고리 추가
	int categoryadd(Map map);
	///카테고리 삭제
	int categoryDelete(Map map);
}
