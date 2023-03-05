package com.moegga.app.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BBSAccusationDTO {
	private String bbsNo;
	private String bAccusationNo;
	private String reason;
	private String content;
	private String process;
	private String id;
}
