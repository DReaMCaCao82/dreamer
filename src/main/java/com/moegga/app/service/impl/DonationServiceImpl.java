package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.DonationDTO;
import com.moegga.app.service.DonationService;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.FundingService;

import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;

@Service("donationService")
public class DonationServiceImpl implements DonationService {
	
	@Resource(name="donationDAO")
	DonationDAO dao;

	@Override
	public List<DonationDTO> selectDonationList(Map map) {

		// TODO Auto-generated method stub
		return dao.selectDonationList(map);
	}

	@Override
	public DonationDTO selectDonationOne(Map map) {
		// TODO Auto-generated method stub
		return dao.selectDonationOne(map);
	}

	@Override
	public int insertDonation(Map map) {
		// TODO Auto-generated method stub
		return dao.insertDonation(map);
	}

	@Override
	public int updateDonation(Map map) {
		// TODO Auto-generated method stub
		return dao.updateDonation(map);
	}

		
	}
