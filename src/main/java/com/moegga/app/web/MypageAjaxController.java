package com.moegga.app.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moegga.app.service.Like_MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;

@RestController
public class MypageAjaxController {

	@Resource(name = "memberService")
	MemberService member;
	@Resource(name = "like_meetingService")
	Like_MeetingService like_meeting;

	@PostMapping(value = "/infoPwdAjax.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxinfoPwdCheck(@RequestParam Map map,Authentication auth) {
		// 1]서비스 호출
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		MemberDTO dto = member.selectOneById(map);
		JSONObject json = new JSONObject();
		
		if(map.get("infoPwd").toString().equals(dto.getPwd())) {
			
			json.put("infoPwdDisplay", "비밀번호가 일치해요");
			json.put("infoPwdCheck", "yes");
			
		}else{
			if(map.get("infoPwd").equals("")) {
				json.put("infoPwdDisplay", "비밀번호를 입력해주세요");
				json.put("infoPwdCheck", "no");
			}else {
				json.put("infoPwdDisplay", "비밀번호가 맞지 않아요");
				json.put("infoPwdCheck", "no");
			}
	}
		

		return json.toJSONString();
	}/////////////개인정보수정 비밀번호 확인
	
	
		
		@PostMapping(value = "/updatePwdAjax.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxupdatePwdCheck(@RequestParam Map map,Authentication auth) {
		// 1]서비스 호출
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		MemberDTO dto = member.selectOneById(map);
		JSONObject json = new JSONObject();
		
		if(map.get("updatePwd").toString().equals(dto.getPwd())) {
			
			json.put("updatePwdDisplay", "비밀번호가 일치해요");
			json.put("updatePwdCheck", "yes");
			
		}else{
			if(map.get("updatePwd").equals("")) {
				json.put("updatePwdDisplay", "비밀번호를 입력해주세요");
				json.put("updatePwdCheck", "no");
			}else {
				json.put("updatePwdDisplay", "비밀번호가 맞지 않아요");
				json.put("updatePwdCheck", "no");
			}
	}
		

		return json.toJSONString();
	}/////////////비밀번호 수정
		
		@PostMapping(value = "/withdrawPwdAjax.do", produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String ajaxwithdrawPwdCheck(@RequestParam Map map,Authentication auth) {
			// 1]서비스 호출
			String id = ((UserDetails) auth.getPrincipal()).getUsername();
			map.put("id", id);
			MemberDTO dto = member.selectOneById(map);
			JSONObject json = new JSONObject();
			
			if(map.get("withdrawPwd").toString().equals(dto.getPwd())) {
				
				json.put("withdrawPwdDisplay", "비밀번호가 일치해요");
				json.put("withdrawPwdCheck", "yes");
				
			}else{
				if(map.get("withdrawPwd").equals("")) {
					json.put("withdrawPwdDisplay", "비밀번호를 입력해주세요");
					json.put("withdrawPwdCheck", "no");
				}else {
					json.put("withdrawPwdDisplay", "비밀번호가 맞지 않아요");
					json.put("withdrawPwdCheck", "no");
				}
		}
			

			return json.toJSONString();
		}/////////////회원탈퇴 비밀번호 확인
		
		@PostMapping(value = "/cancelBookMarkAjax.do", produces = "text/html; charset=UTF-8")
		@ResponseBody
		public String cancelBookMarkAjax(@RequestParam Map map,Authentication auth) {
			// 1]서비스 호출
			String id = ((UserDetails) auth.getPrincipal()).getUsername();
			map.put("id", id);
			map.put("meetingNo", map.get("meetingNo"));
			like_meeting.deleteBookMark(map);
			JSONObject json = new JSONObject();
		
			return json.toJSONString();
		}/////////////즐겨찾기 해제
		
		

}///////////// class
