package com.moegga.app.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class FundingDTO {

	

	private int amount;

	private Date fundingEnddate;
	//실제 DB엔 없고 계산할값 넣을 변수
	private int calDateDays;
	private int donationList;
		
	//join할 값들 (미팅)
	private int meetingNo;
	private String meetingName;
	private String operator;
	private Date opendate;
	private Date enddate;
	private String town;
	private String meetingDescription;
	private int categoryNo;
	private int warningCount;
	private int enabled;
	private String bannerImg;
	
	//카테고리
	private String mainCategory;
	private String subCategory;
	
	
	
	
	
}
