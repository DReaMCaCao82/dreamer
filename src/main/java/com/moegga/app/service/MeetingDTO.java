package com.moegga.app.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class MeetingDTO {

	private int meetingNo;
	private String meetingName;
	private String operator;
	private Date openDate;
	private Date endDate;
	private String town;
	private String meetingDescription;
	private int categoryNo;
	private int warningCount;
	private int enabled;
	private String bannerImg;
	private int maxrole;
	
	//category 조인
	private String mainCategory;
	private String subCategory;
	
	//meetingRoleCurrentCount
	private int meetingRoleList;
	private String id;

	//meetingBBSImgList
	private List<Map> meetingBBSImgList;
	
	//userLike
	private String userLike;
	
	
	
}
