package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface MemberService {

	public List<MemberDTO> selectMemberList(Map map);
	
	public int checkId(Map map);

	public int join(Map map);

	public int updateInfo(Map map);

	public MemberDTO selectOneById(Map map);

	public List<Map> selectAppealList(Map map);

	public int insertAppealImg(Map map);
	
	public int deleteAppealImg(Map map);

	public int updatePwd(Map map);

	public int deleteAll(Map map);

	public int infoUpdate(Map map);

	public int selectMemberListCount(Map map);

	public List<MemberDTO> selectAllAppealList(Map map);

	public List<MemberDTO> selectBBSMember();
}
