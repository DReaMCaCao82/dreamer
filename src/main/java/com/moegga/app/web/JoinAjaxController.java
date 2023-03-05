package com.moegga.app.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;

@RestController
public class JoinAjaxController {

	@Resource(name = "memberService")
	MemberService member;

	@PostMapping(value = "/joinAjaxId.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxIdcheck(@RequestParam Map map) {
		// 1]서비스 호출

		int able = member.checkId(map);
		JSONObject json = new JSONObject();
		json.put("chId", "사용 불가능한 아이디에요");

		if (map.get("id").toString().length() > 15) {
			json.put("chId", "아이디가 너무 길어요");
			json.put("user_id", "");
		} else if (!(map.get("id").toString().length() == 0) && map.get("id").toString().length() < 5) {
			json.put("chId", "아이디가 너무 짧아요");
			json.put("user_id", "");
		} else if (able == 0 && !("".equals(map.get("id")))) {
			json.put("chId", "사용 가능한 아이디에요");
			json.put("user_id", map.get("id"));

		} else if ("".equals(map.get("id"))) {
			json.put("chId", "아이디를 입력해주세요");
			json.put("user_id", "");
		}

		return json.toJSONString();
	}///////////// id체크 컨트롤러

	@PostMapping(value = "/ajaxPassword.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxPasswordValidate(@RequestParam Map map) {
		// 1]서비스 호출
		JSONObject json = new JSONObject();

		if (map.get("password").toString().length() > 10) {
			json.put("chPassword", "비밀번호가 너무 길어요");
			json.put("user_Password", "");
		} else if (!(map.get("password").toString().length() == 0) && map.get("password").toString().length() < 5) {
			json.put("chPassword", "비밀번호 가 너무 짧아요");
			json.put("user_Password", "");
		} else if ("".equals(map.get("password"))) {
			json.put("chPassword", "비밀번호를 입력해주세요");
		} else {
			json.put("chPassword", "사용 가능한 비밀번호에요");
			json.put("user_Password", map.get("password"));
		}

		return json.toJSONString();
	}

	@PostMapping(value = "/ajaxPasswordCheck", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxPasswordCheck(@RequestParam Map map) {
		// 1]서비스 호출
		JSONObject json = new JSONObject();
		json.put("checkPassword", "비밀번호가 일치하지 않아요");
		json.put("user_passwordCheck", "no");
		if (map.get("password").equals("")) {
			json.put("checkPassword", "비밀번호를 입력하세요");
			json.put("user_passwordCheck", "no");
		} else if (map.get("password").equals(map.get("passwordCheck"))) {
			json.put("checkPassword", "비밀번호가 일치해요");
			json.put("user_passwordCheck", "yes");
			json.put("checkDuplicate", map.get("passwordCheck"));
		}


		return json.toJSONString();
	}///////////// 비밀번호 유효성검사 컨트롤러

	@PostMapping(value = "/ajaxName.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxName(@RequestParam Map map) {
		// 1]서비스 호출
		JSONObject json = new JSONObject();
		
		boolean isStr=true;
		for(int i=0; i<map.get("name").toString().length(); i++) {
			char tmp = map.get("name").toString().charAt(i);
			if('0' <= tmp && tmp <='9'){
				isStr=false;
			}
		}
		if(!isStr) {
			json.put("chName", "한글,영문만 넣어주세요");
			json.put("user_name", "");
		}
		else if (map.get("name").toString().length() > 10) {
			json.put("chName", "이름이 너무 길어요");
			json.put("user_name", "");
		} else if ("".equals(map.get("name"))) {
			json.put("chName", "이름을 입력해주세요");
			json.put("user_name", "");
		} else {
			json.put("chName", "아주 멋진 이름이군요 !");
			json.put("user_name", map.get("name"));
		}

		return json.toJSONString();
	}
	
	@PostMapping(value = "/ajaxAge.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxAge(@RequestParam Map map) {
		// 1]서비스 호출
		JSONObject json = new JSONObject();
		
		
		boolean isNum=true;
		for(int i=0; i<map.get("age").toString().length(); i++) {
			char tmp = map.get("age").toString().charAt(i);
			if(!('0' <= tmp && tmp <='9')){
				isNum=false;
			}
		}
		if(!isNum) {
			json.put("chAge", "숫자만 넣어주세요");
			json.put("user_age", "");
		}else if (map.get("age").toString().length()>2) {
			json.put("chAge", "값을 제대로 넣어주세요");
			json.put("user_age", "");
		} else if ("".equals(map.get("age"))) {
			json.put("chAge", "나이를 입력해주세요");
			json.put("user_age", "");
		} else {
			json.put("chAge", "나이가 입력 되었습니다");
			json.put("user_age", map.get("age"));
		}

		return json.toJSONString();
	}

}///////////// class
