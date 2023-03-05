package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.MemberDTO;

@Repository
public class FundingDAO {

	@Resource(name="template")
	private SqlSessionTemplate fundingTemplate;

	
	public List<FundingDTO> selectFundingList(Map map) {
		// TODO Auto-generated method stub
		return fundingTemplate.selectList("selectFundingList",map);
	}



	public int updateAmount(Map map) {
		
		return fundingTemplate.update("updateAmount",map);
	}


	public FundingDTO selectFundingOne(Map map) {
		// TODO Auto-generated method stub
		return fundingTemplate.selectOne("selectFundingOne",map);
	}



	public int getTotalRecordCountFunding(Map map) {
		
		return fundingTemplate.selectOne("getTotalRecordCountFunding",map);
	}



	public int insertFunding(Map map) {
		// TODO Auto-generated method stub
		return fundingTemplate.insert("insertFunding", map);
	}



	

}
