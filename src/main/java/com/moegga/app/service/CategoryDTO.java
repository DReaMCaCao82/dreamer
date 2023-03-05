package com.moegga.app.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class CategoryDTO {

	String categoryno;	
	String maincategory;
	String subcategory;
	
	///meeting조인
	private String meetingNo;
	private String meetingName;
	private String operator;
	private String town;
	private String bannerImg;
	

}


