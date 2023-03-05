package com.moegga.app.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageDTO {
	int meesageno;
	String content;
	int chatno;
	int roleno;
	String postdate;
	String name;
	String id;
	String profileImg;
	int division;
}
