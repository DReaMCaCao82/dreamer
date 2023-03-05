package com.moegga.app.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moegga.app.service.BBSService;
import com.moegga.app.service.BBS_ImgService;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.Like_MeetingService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingRoleService;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.PerformanceDTO;
import com.moegga.app.service.PerformanceService;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;

@RestController
public class KakaoMapAjaxController {

	@Resource(name = "meetingService")
	MeetingService meeting;
	@Resource(name = "bbsService")
	BBSService bbs;
	@Resource(name = "bbs_imgService")
	BBS_ImgService bbs_img;
	@Resource(name = "meetingRoleService")
	MeetingRoleService meetingRole;
	@Resource(name="performanceService")
	PerformanceService performance;
	@Resource(name = "categoryService")
	CategoryService category;
	@Resource(name = "like_meetingService")
	Like_MeetingService like_meeting;

	@PostMapping(value = "/kakaoMapAjax.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String kakaoMapAjax(@RequestParam Map map) {
		// 1]서비스 호출

		System.out.println("과연 들어오나? :" + map.get("town"));
		List<PerformanceDTO> list = performance.selectMyTownPerformanceList(map);
		String getTown=(String) map.get("town");
		
		List<Map> collections = new Vector<Map>();
		for (PerformanceDTO dto : list) {
			Map record = new HashMap();

			record.put("meetingNo", dto.getMeetingNo());
			record.put("meetingName", dto.getMeetingName());
			record.put("main_img", dto.getMain_img());
			record.put("perform_date", dto.getPerform_date().toString());
			record.put("perform_time", dto.getPerform_time().toString());
			record.put("operator", dto.getOperator());
			record.put("place", dto.getPlace());
			record.put("title", dto.getTitle());
			
			String perform_place=dto.getPlace();
			if(perform_place.contains(getTown)) {
				int i=perform_place.indexOf(getTown);
				int j=getTown.length();
				String town=perform_place.substring(i, j);
				record.put("town", dto.getTown());
			}

			collections.add(record);
		}

		return JSONArray.toJSONString(collections);

	}///////////// id체크 컨트롤러

	
	@PostMapping(value = "/kakaoMapMeetingAjax.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String kakaoMapMeetingAjax(@RequestParam Map map) {
		// 1]서비스 호출

		System.out.println("과연 들어오나? 카테고리 :" + map.get("mainCategory"));
		//System.out.println("동네 :" + map.get("town"));
		if(map.get("mainCategory").equals("music")) {
			map.put("mainCategory", "음악");
		}else if(map.get("mainCategory").equals("sports")) {
			map.put("mainCategory", "스포츠");
		}else if(map.get("mainCategory").equals("art")) {
			map.put("mainCategory", "공연예술");
		}else if(map.get("mainCategory").equals("game")) {
			map.put("mainCategory", "컴퓨터");
		}
		List<MeetingDTO> list = meeting.selectMeetingByMainCategory(map);

		List<Map> collection = new Vector<Map>();
		for (MeetingDTO dto : list) {
			System.out.println(dto);
			Map record = new HashMap();
			// 90자이상이면 ... 아니면 그냥 맵에 추가
			if (dto.getMeetingDescription().length() > 50) {
				dto.setMeetingDescription(dto.getMeetingDescription().substring(0, 50) + ". . .");
				record.put("meetingDescription", dto.getMeetingDescription());
			} else {
				record.put("meetingDescription", dto.getMeetingDescription());
			}
			//
			map.put("meetingNo", dto.getMeetingNo());
			int meetingRoleList =meetingRole.selectMeetingRoleList(map);
			System.out.println("for문 안에 들어왔나?");
			dto.setMeetingRoleList(meetingRoleList);
			record.put("meetingNo", dto.getMeetingNo());
			record.put("meetingName", dto.getMeetingName());
			record.put("bannerImg", dto.getBannerImg());
			record.put("categoryNo", dto.getCategoryNo());
			record.put("mainCategory", dto.getMainCategory());
			record.put("subCategory", dto.getSubCategory());
			record.put("maxrole", dto.getMaxrole());
			record.put("meetingRoleList", dto.getMeetingRoleList());
			record.put("openDate", dto.getOpenDate().toString());
			record.put("endDate", dto.getEndDate().toString());
			record.put("town", dto.getTown());
			record.put("operator", dto.getOperator());

			collection.add(record);
		}
		System.out.println("에이작스까지 잘 내보내나?");
		return JSONArray.toJSONString(collection);

	}///////////// id체크 컨트롤러
	
	
}///////////// class
