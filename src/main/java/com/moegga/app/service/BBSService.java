package com.moegga.app.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;


public interface BBSService {


   //=====모임 게시판 목록 끝=======

	
	//admin애서 전체asdasdasd 문의게시판 리스트
	List<Map> selectList(Map map);
	
	///마이 페이지 내문의리스트
	List<Map> myselectList(Map map);
	//전체 레코드 수]
	int getTotalRecord(Map map);
	//상세보기용]
	BBSDTO selectOne(Map map);
	//입력/수정/삭제용]
	int insert(Map map);
	int delete(Map map);
	int update(Map map);


	int insertMeetingBBS(Map map);
	
	BBSDTO selectMbbsByMeetingNoForThisBBSImg(Map map);
	
	List<Map> selectAllMeetingBBS();

	String countThisBBSLike(Map map);

	String likeCheck(Map map);

	String countComment(Map map);

	List<Map> comment(Map map);

	int insertLikeBBS(Map map);

	int deleteLikeBBS(Map map);

	int commentInsert(Map map);

	int commentUpdate(Map map);

	int commentDelete(Map map);

	List<Map> selectAllFreeBBS();

	int insertFreeBBS(Map map);

	BBSDTO selectFreeBBSNOForThisBBSImg(Map map);

	Map selectOneMeeetingBBS(Map map);

	int updateThisBBS(Map map);

	int deleteThisBBS(Map map);

	Map selectOneFreeBBS(Map map);

	Map selectThisBBS(Map map);

	List<Map> selectThisMeetingBBS(Map map);

}
