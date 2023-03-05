package com.moegga.app.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moegga.app.service.DonationDTO;
import com.moegga.app.service.DonationService;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.FundingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;

@RestController
public class FundingAjaxController {

	@Resource(name = "fundingService")
	FundingService funding;
	@Resource(name = "donationService")
	DonationService donation;

	@PostMapping(value = "/ajaxFunding.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxinfoPwdCheck(@RequestParam Map map,Authentication auth) {
		// 1]서비스 호출
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		map.put("donation", map.get("donation").toString());
		map.put("meetingNo", map.get("meetingNo"));
		
		
		
		DonationDTO donationDTO =donation.selectDonationOne(map);
		FundingDTO fundingDTO =funding.selectFundingOne(map);
		fundingDTO.setAmount(fundingDTO.getAmount()+Integer.parseInt(map.get("donation").toString()));
		map.put("amount", fundingDTO.getAmount());
		funding.updateAmount(map);
		
		if(donationDTO!=null) {
			donationDTO.setDonation(donationDTO.getDonation()+Integer.parseInt(map.get("donation").toString()));
			map.put("donation", donationDTO.getDonation());
			donation.updateDonation(map);
		}else {
			donation.insertDonation(map);
			
		}
		JSONObject json = new JSONObject();
		return json.toJSONString();
	}/////////////개인정보수정 비밀번호 확인
}///////////// class
