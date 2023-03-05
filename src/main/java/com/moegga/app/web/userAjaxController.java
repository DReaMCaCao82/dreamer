package com.moegga.app.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
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

import com.moegga.app.service.CategoryService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingRoleService;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;

@RestController
public class userAjaxController {

	@Resource(name = "memberService")
	MemberService member;
	@Resource(name = "meetingService")
	MeetingService meeting;
	@Resource(name = "meetingRoleService")
	MeetingRoleService meetingRole;
	@Resource(name = "categoryService")
	CategoryService category;
	@Resource(name = "townService")
	TownService town;
	

	@PostMapping(value = "/ajaxUser.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String ajaxUserView(@RequestParam Map map,Authentication auth) {
		
		List<MeetingDTO> joinedMeeting=meeting.selectJoinedMeetingList(map);
		
		List<Map> collection = new Vector<Map>();
		
		if(joinedMeeting.isEmpty()) {
			collection=null;
		}else {
			for(MeetingDTO meeitng:joinedMeeting) {
				Map record = new HashMap();
				record.put("meetingNo", meeitng.getMeetingNo());
				record.put("meetingName", meeitng.getMeetingName());
				record.put("bannerImg", meeitng.getBannerImg());
				record.put("categoryNo", meeitng.getCategoryNo());
				record.put("mainCategory", meeitng.getMainCategory());
				record.put("subCategory", meeitng.getSubCategory());
				record.put("town", meeitng.getTown());
				record.put("operator", meeitng.getOperator());

				collection.add(record);
			}
		}
		
		return JSONArray.toJSONString(collection);
		
	}
	
}///////////// class
