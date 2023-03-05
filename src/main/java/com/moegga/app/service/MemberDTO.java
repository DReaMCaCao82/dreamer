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
public class MemberDTO {

	private String id;
	private String pwd;
	private String name;
	private int age;
	private String gender;
	private String tel;
	private String profileimg;
	private String pr;
	private String about_me;
	private Date postdate;
	private String authority;
	private int enabled;
	
	//town join
	private String town;
	
	//카테고리
	private List<Map> categoryList;
	
	private int joinMcount;
	
	private String img;
	
	private String isOperator;
	
	
	
}
