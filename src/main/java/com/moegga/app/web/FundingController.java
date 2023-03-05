package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moegga.app.service.DonationDTO;
import com.moegga.app.service.DonationService;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.FundingService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.Paging;
import com.moegga.app.service.impl.PagingUtil;

@Controller
public class FundingController {
	@Resource(name = "fundingService")
	FundingService funding;
	@Resource(name = "donationService")
	DonationService donation;
	@Resource(name = "townService")
	TownService town;
	@Resource(name = "meetingService")
	MeetingService meeting;
	
	@Value("${FUNDINGPAGE_SIZE}")
	private int pageSize;
	@Value("${FUNDINGBLOCK_PAGE}")
	private int blockPage;
	
	
	@RequestMapping(value="/FundingList.do")
	public String fundingList(@RequestParam Map map,Model model,HttpServletRequest req) {

		int nowPage = map.get("nowPage") == null ? 1 : Integer.parseInt(map.get("nowPage").toString());
		int totalRecord =funding.getTotalRecordCountFunding(map);
		int totalPage=(int)Math.ceil((double)totalRecord/pageSize);
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		
		map.put("start", start);
		map.put("end", end);
		
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecord, pageSize, blockPage, nowPage, req.getContextPath()+"/FundingList.do?");
		List<FundingDTO> list = funding.selectFundingList(map);
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format (currentTime);
		
		try {
			currentTime=mSimpleDateFormat.parse(mTime);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}

		for(FundingDTO dto:list ) {
			map.put("meetingNo", dto.getMeetingNo());
			//모임소개글이 너무길면 짤라서 뿌려줌
			if(dto.getMeetingDescription().length()>10) {
			dto.setMeetingDescription(dto.getMeetingDescription().substring(0, 10)+". . .");
			}
			System.out.println("펀딩 종료일"+dto.getFundingEnddate());
			//펀딩 끝나는날과 현재날 빼서 일수 계산 로직
			 long calDate = currentTime.getTime() - dto.getFundingEnddate().getTime();  
			 System.out.println(calDate);
		     int calDateDays = (int)(calDate / ( 24*60*60*1000));
		     System.out.println(calDateDays);
		     calDateDays = Math.abs(calDateDays);
		     dto.setCalDateDays(calDateDays);
		    //donationDTO 꺼내오기
		     List<DonationDTO> donationList =donation.selectDonationList(map);
		    
		     for(DonationDTO donationDTO : donationList) {
		    	 dto.setDonationList(donationList.size());
		     }
		}

		model.addAttribute("list",list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);

		return "/funding/fundingList.tiles";
	}
	
	
	@RequestMapping(value="/funding/FundingListMyTown.do")
	public String fundingListMyTown(@RequestParam Map map,Model model,Authentication auth,HttpServletRequest req) {
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		
		TownDTO townDTO =town.selectTownById(map);
		String town="";
		map.put("town", town);
		if(townDTO != null) {
			town =townDTO.getTown();
			map.put("town", town);
		}
		
		int nowPage = map.get("nowPage") == null ? 1 : Integer.parseInt(map.get("nowPage").toString());
		int totalRecord =funding.getTotalRecordCountFunding(map);
		int totalPage=(int)Math.ceil((double)totalRecord/pageSize);
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		
		map.put("start", start);
		map.put("end", end);
		
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecord, pageSize, blockPage, nowPage, req.getContextPath()+"/funding/FundingListMyTown.do?");
		
		List<FundingDTO> list = funding.selectFundingList(map);
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format (currentTime);
		
		try {
			currentTime=mSimpleDateFormat.parse(mTime);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}

		for(FundingDTO dto:list ) {
			map.put("meetingNo", dto.getMeetingNo());
			//모임소개글이 너무길면 짤라서 뿌려줌
			if(dto.getMeetingDescription().length()>40) {
			dto.setMeetingDescription(dto.getMeetingDescription().substring(0, 40)+". . .");
			}
			//펀딩 끝나는날과 현재날 빼서 일수 계산 로직
			System.out.println(dto.getFundingEnddate());
			 long calDate = currentTime.getTime() - dto.getFundingEnddate().getTime();  
		     int calDateDays = (int)(calDate / ( 24*60*60*1000)); 
		     calDateDays = Math.abs(calDateDays);
		     dto.setCalDateDays(calDateDays);
		    //donationDTO 꺼내오기
		     List<DonationDTO> donationList =donation.selectDonationList(map);
		    
		     for(DonationDTO donationDTO : donationList) {
		    	 dto.setDonationList(donationList.size()); 
		     }
		}

		model.addAttribute("town",town);
		model.addAttribute("list",list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);

		return "/funding/fundingListMyTown.tiles";
	}
	

	public String funding(@RequestParam Map map,Model model) {
		System.out.println("meetingNo:"+map.get("meetingNo").toString());
		FundingDTO dto =funding.selectFundingOne(map);
		System.out.println(dto.getFundingEnddate());
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format (currentTime);
		
		try {
			currentTime=mSimpleDateFormat.parse(mTime);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		//펀딩 끝나는날과 현재날 빼서 일수 계산 로직
		 long calDate = currentTime.getTime() - dto.getFundingEnddate().getTime();  
	     int calDateDays = (int)(calDate / ( 24*60*60*1000)); 
	     calDateDays = Math.abs(calDateDays);
	     dto.setCalDateDays(calDateDays);
	     
	     List<DonationDTO> donationList =donation.selectDonationList(map);
	     dto.setDonationList(donationList.size());
	     
	     dto.setMeetingDescription(dto.getMeetingDescription().replace("\n","<br/>"));
		
		model.addAttribute("dto",dto);
		
		
		return "/funding/funding.tiles";
	}
	
	
	@RequestMapping(value="/CreateFunding.do")
	public String createNewPerformance(@RequestParam Map map,HttpServletRequest req,Authentication auth) {
		
		//String id = ((UserDetails) auth.getPrincipal()).getUsername();
		System.out.println("쿼리스트링으로 얻은 모임 번호:"+map.get("meetingNo"));
		MeetingDTO meetingDTO=meeting.selectMeetingByNo(map);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String endDate=null;
		Calendar cal=Calendar.getInstance();
		
		System.out.println("모임 종료일 1 :"+meetingDTO.getEndDate().getTime());
		System.out.println("모임 종료일 2 :"+meetingDTO.getEndDate());
		cal.setTime(meetingDTO.getEndDate());
		System.out.println();
		df.format(cal.getTime());
		cal.add(Calendar.DATE, -7);
		System.out.println(df.format(cal.getTime()));
		endDate=df.format(cal.getTime());
		System.out.println(endDate);
		
		map.put("meetingNo", map.get("meetingNo"));
		map.put("fundingEnddate", endDate);
		
		funding.insertFunding(map);
		System.out.println("펀딩 신청 완료");
		
		return "/index.tiles";
	}
	
	
}
