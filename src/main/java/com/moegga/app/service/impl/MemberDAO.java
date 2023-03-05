package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.MemberDTO;

@Repository
public class MemberDAO {

	@Resource(name="template")
	private SqlSessionTemplate memberTemplate;

	
	public int checkId(Map map) {
		
		return memberTemplate.selectOne("idCheck",map);
	}


	public int join(Map map) {

		return memberTemplate.insert("join",map);
		
	}


	public int updateInfo(Map map) {
		
		return memberTemplate.update("updateInfo",map);
		
	}


	public MemberDTO selectOneById(Map map) {
		return memberTemplate.selectOne("selectOneById",map);
		
	}


	public List<Map> selectAppealList(Map map) {
		
		return memberTemplate.selectList("selectAppealList",map);
	}


	public int insertAppealImg(Map map) {
		return memberTemplate.insert("insertAppealImg",map);
		
	}


	public int deleteAppealImg(Map map) {
		return memberTemplate.delete("deleteAppealImg",map);
		
	}


	public int updatePwd(Map map) {
		
		return memberTemplate.update("updatePwd",map);
	}


	public int deleteAll(Map map) {
		
		return memberTemplate.delete("deleteAll",map);
	}


	public int infoUpdate(Map map) {
		
		return memberTemplate.update("infoUpdate",map);
	}


	public List<MemberDTO> selectMemberList(Map map) {
		
		return memberTemplate.selectList("selectMemberList",map);
	}


	public int selectMemberListCount(Map map) {
		// TODO Auto-generated method stub
		return memberTemplate.selectOne("selectMemberListCount",map);
	}


	public List<MemberDTO> selectAllAppealList(Map map) {
		// TODO Auto-generated method stub
		return memberTemplate.selectList("selectAllAppealList", map);
	}


	public List<MemberDTO> selectBBSMember() {
		// TODO Auto-generated method stub
		return memberTemplate.selectList("selectBBSMember");
	}

}
