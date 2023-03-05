package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name="memberDAO")
	MemberDAO dao;

	@Override
	public int checkId(Map map) {
		
		return dao.checkId(map);
	}

	@Override
	public int join(Map map) {
		
		return dao.join(map);
	}

	@Override
	public int updateInfo(Map map) {
		
		return dao.updateInfo(map);
	}

	@Override
	public MemberDTO selectOneById(Map map) {
		
		return dao.selectOneById(map);
	}

	@Override
	public List<Map> selectAppealList(Map map) {
		
		return dao.selectAppealList(map);
	}

	@Override
	public int insertAppealImg(Map map) {
		
		return dao.insertAppealImg(map);
	}

	@Override
	public int deleteAppealImg(Map map) {
		
		return dao.deleteAppealImg(map);
	}

	@Override
	public int updatePwd(Map map) {

		return dao.updatePwd(map);
		
	}

	@Override
	public int deleteAll(Map map) {
		
		return dao.deleteAll(map);
	}

	@Override
	public int infoUpdate(Map map) {
		
		return dao.infoUpdate(map);
	}

	@Override
	public List<MemberDTO> selectMemberList(Map map) {
		
		return dao.selectMemberList(map);
	}

	@Override
	public int selectMemberListCount(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMemberListCount(map);
	}


	@Override
	public List<MemberDTO> selectAllAppealList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectAllAppealList(map);
	}

	@Override
	public List<MemberDTO> selectBBSMember() {
		// TODO Auto-generated method stub
		return dao.selectBBSMember();
	}
	
	

}
