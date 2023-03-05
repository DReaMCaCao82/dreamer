package com.moegga.app.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MeetingViewDTO {

String meetingno;       //모임 번호   
String meetingname;      //모임 이름
String operator;   //방장
String town;   //지역
String meetingdescription; //모임 설명
String categoryno;   //카테고리 번호
String maincategory;
String subcategory;
String warningcount;
String enabled;
String bannerimg;
String meetingmembercount;
String maxrole;
String role;


Date opendate;   //모임 오픈 날짜
Date enddate;   //모임 오픈 날짜

}