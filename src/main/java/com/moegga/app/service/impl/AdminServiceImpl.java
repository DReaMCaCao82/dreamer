package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.BBSAccusationDTO;
import com.moegga.app.service.BBSDTO;
import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.MeetingAccusationDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Resource(name="adminDAO")
	AdminDAO dao;
	/*통계용*/
	@Override
	public List<Map> ageAndGender() {
		return dao.ageAndGender();
	}
	@Override
	public List<Map> categoryAndMeeting() {
		
		return dao.categoryAndMeeting();
	}
	@Override
	public List<Map> subcategoryAndMeeting() {
		
		return dao.subcategoryAndMeeting();
	}
	@Override
	public List<Map> townAndMeeting() {
		
		return dao.townAndMeeting();
	}
	
	/*bbsAccusation*/
	@Override
	public List<BBSAccusationDTO> bbsAccusationSelectlist(Map map) {
		// TODO Auto-generated method stub
		return dao.bbsAcusationSelectlist(map);
	}
	@Override
	public int getTotalRecordCountBBSAccusation() {
		// TODO Auto-generated method stub
		return dao.getTotalRecordCountBBSAccusation();
	}
	@Override
	public Map selectBbs(String bbsno) {
		// TODO Auto-generated method stub
		return dao.selectBbs(bbsno);
	}
	@Override
	public void bbsAccusationProcess(Map map) {
		dao.bbsAccusationProcess(map);
		
	}
	
	/*MeetingAccusation*/
	@Override
	public List<MeetingAccusationDTO> meetingAccusationSelectlist(Map map) {
		// TODO Auto-generated method stub
		return dao.meetingAcusationSelectlist(map);
	}
	@Override
	public int getTotalRecordCountMeetingAccusation() {
		// TODO Auto-generated method stub
		return dao.getTotalRecordCountMeetingAccusation();
	}
	@Override
	public Map selectMeeting(String meetingno) {
		// TODO Auto-generated method stub
		return dao.selectMeeting(meetingno);
	}
	@Override
	public void meetingAccusationProcess(Map map) {
		dao.meetingAccusationProcess(map);
		
	}
	
	/*Notice*/
	@Override
	public List<Map> noticeSelectlist(Map map) {
		return dao.noticeSelectlist(map);
	}
	@Override
	public int getTotalRecordCountNotice() {
		return dao.getTotalRecordCountNotice();
	}
	@Override
	public int noticeInsert(Map map) {
		return dao.noticeInsert(map);
	}
	@Override
	public Map noticeSelectone(String noticeno) {
		return dao.noticeSelectone(noticeno);
	}
	@Override
	public int noticeUpdate(Map map) {
		return dao.noticeUpdate(map);
	}
	@Override
	public int noticeDelete(String noticeno) {
		return dao.noticeDelete(noticeno);
	}
	@Override
	public int noticeEnabledToggle(Map map) {
		return dao.noticeEnabledToggle(map);
	}
	/*메인에서 공지사항 보여주기*/
	@Override
	public List<Map> mainNoticeSelectlist() {
		return dao.mainNoticeSelectlist();
	}
	
	/*회원 조회용*/
	@Override
	public List<Map> memberList() {
		return dao.memberList();
	}
	/*정지 회원 조회용*/
	@Override
	public List<Map> suspendMemberList() {
		return dao.suspendMemberList();
	}
	/*회원 정지 해제용*/
	@Override
	public int memberSuspendRelease(Map map) {
		return dao.memberSuspendRelease(map);
	}
	/*모임 정지 해제용*/
	@Override
	public int meetingSuspendRelease(Map map) {
		return dao.meetingSuspendRelease(map);
	}
	/*모임 조회용*/
	@Override
	public List<Map> meetingList() {
		return dao.meetingList();
	}
	/*정지 모임 조회용*/
	@Override
	public List<Map> suspendMeetingList() {
		return dao.suspendMeetingList();
	}
	/*정지 회원 검색용*/
	@Override
	public List<Map> searchMember(String keyword) {
		return dao.searchMember(keyword);
	}
	@Override
	public List<Map> searchMeeting(String keyword) {
		return dao.searchMeeting(keyword);
	}
	
	///관리자 문의게시판
	public List<Map> questionselectList(Map map) {
		
		return dao.questionselectList(map);
	}
	///문의총갯수
	@Override
	public int getTotalRecord(Map map) {
	
		return dao.getTotalRecord(map);
	}
	
	//문의 보기
	@Override
	public BBSDTO qsusetionselectOne(Map map) {
		
		return dao.qsusetionselectOne(map);
	}

	//문의 답장용
	public int qsusetionsupdate(Map map) {
		
		return dao.qsusetionsupdate(map);
	}
	
	
	///펀딩 리스트불러오기
	@Override
	public List<FundingDTO> fundingadminlist(Map map) {
	
		return dao.fundingadminlist(map);
	}
	
	///펀딩 총 갯수
	@Override
	public int getfundingtotal(Map map) {
			return dao.getfundingtotal(map);
	}
	
	//펀딩 수락 중지용
	@Override
	public int fundingupdate(Map map) {
		// TODO Auto-generated method stub
		return dao.fundingupdate(map);
	}
	
	
	///카테고리 리스트
	@Override
	public List<CategoryDTO> categorylist(Map map) {
		
		return dao.categorylist(map);
	}
	
	//카테고리 총갯수
	@Override
	public int getcategorygtotal(Map map) {
		// TODO Auto-generated method stub
		return dao.getcategorygtotal(map);
	}
	
	////카테고리 추가
	@Override
	public int categoryadd(Map map) {
		
		return dao.categoryadd(map);
	}
	@Override
	public int categoryDelete(Map map) {
		
		return dao.categoryDelete(map);
	}
	@Override
	public int fundingDelete(Map map) {
		
		return dao.fundingDelete(map);
	}
}
