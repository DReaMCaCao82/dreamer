package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.FundingService;

import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;

@Service("fundingService")
public class FundingServiceImpl implements FundingService {
	
	@Resource(name="fundingDAO")
	FundingDAO dao;

	@Override
	public List<FundingDTO> selectFundingList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectFundingList(map);
	}

	@Override
	public int updateAmount(Map map) {
		return dao.updateAmount(map);
	}

	@Override
	public FundingDTO selectFundingOne(Map map) {
		return dao.selectFundingOne(map);
	}

	@Override
	public int getTotalRecordCountFunding(Map map) {
		return dao.getTotalRecordCountFunding(map);
	}

	@Override
	public int insertFunding(Map map) {
		// TODO Auto-generated method stub
		return dao.insertFunding(map);
	}
	

}
