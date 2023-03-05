package com.moegga.app.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PerformanceDTO {

	private String performanceNo;	
	private String meetingNo;
	private String title;
	private Date perform_date;
	private String perform_time;
	private String place;
	private String main_img;
	private String content;
	
	//meeting 조인
	private String meetingName;
	private int enabled;
	private String operator;
	private String bannerImg;
	
	//town 조인
	private String town;
	
	//member 조인
	private String id;
	
	//category 조인
	private String mainCategory;
	private String subCategory;
	
	
	

}
