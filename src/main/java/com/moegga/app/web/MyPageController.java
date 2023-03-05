package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moegga.app.service.BBSService;
import com.moegga.app.service.BBS_ImgService;
import com.moegga.app.service.Like_MeetingService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingRoleDTO;
import com.moegga.app.service.MeetingRoleService;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;
import com.moegga.app.service.impl.TownDAO;

@Controller
public class MyPageController {

	@Resource(name = "memberService")
	MemberService member;
	@Resource(name = "townService")
	TownService town;
	@Resource(name = "meetingService")
	MeetingService meeting;
	@Resource(name = "bbs_imgService")
	BBS_ImgService bbs_img;
	@Resource(name = "bbsService")
	BBSService bbs;
	@Resource(name = "meetingRoleService")
	MeetingRoleService meetingRole;
	@Resource(name = "like_meetingService")
	Like_MeetingService like_meeting;
	

	@RequestMapping(value = "/Mypage.do")
	public String mypage(Authentication auth, Model model) {
		Map map = new HashMap();

		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);

		MemberDTO dto = member.selectOneById(map);
		TownDTO townDTO = town.selectTownById(map);
		List<Map> appealList = member.selectAppealList(map);
		List<MeetingDTO> joinedMeetingList = meeting.selectJoinedMeetingList(map);
		List<MeetingDTO> bookMarkMeetingList = meeting.selectBookMarkMeetingList(map);

		for (MeetingDTO joinedMeeting : joinedMeetingList) {

			if (joinedMeeting.getMeetingDescription().length() > 90) {
				joinedMeeting.setMeetingDescription(joinedMeeting.getMeetingDescription().substring(0, 90) + ". . .");
			}
			map.put("meetingNo", joinedMeeting.getMeetingNo());

			int meetingRoleList = meetingRole.selectMeetingRoleList(map);

			String userLike = like_meeting.selectMeetingLike(map);

			joinedMeeting.setUserLike(userLike);

			joinedMeeting.setMeetingRoleList(meetingRoleList);
		}

		for (MeetingDTO bookMarkMeeting : bookMarkMeetingList) {

			if (bookMarkMeeting.getMeetingDescription().length() > 90) {
				bookMarkMeeting.setMeetingDescription(bookMarkMeeting.getMeetingDescription().substring(0, 90) + ". . .");
			}
			map.put("meetingNo", bookMarkMeeting.getMeetingNo());

			int meetingRoleList = meetingRole.selectMeetingRoleList(map);

			bookMarkMeeting.setMeetingRoleList(meetingRoleList);
		}

		model.addAttribute("dto", dto);
		model.addAttribute("appealList", appealList);
		model.addAttribute("townDTO", townDTO);
		model.addAttribute("meetingList", joinedMeetingList);
		model.addAttribute("bookMarkMeetingList", bookMarkMeetingList);
		
		List<MeetingRoleDTO> propositionList=meetingRole.selectPropositionList(map);
		if(propositionList.isEmpty()) {
			model.addAttribute("propositionList", null);
		}else {
			model.addAttribute("propositionList", propositionList);
		}

		return "/member/mypage.tiles";
	}

	@RequestMapping(value = "/ProfileUpdate.do", method = RequestMethod.GET)
	public String pwdUpdate(Authentication auth, Model model) {
		Map map = new HashMap();
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		MemberDTO dto = member.selectOneById(map);
		
		model.addAttribute("dto", dto);

		return "/mypage/profileUpdate";
	}

	@RequestMapping(value = "/insertAppealImg.do")
	public String insertAppealImg(@RequestParam("appeal") MultipartFile upload, HttpServletRequest req,
			Authentication auth) {

		Map map = new HashMap();
		String id = ((UserDetails) auth.getPrincipal()).getUsername();

		String path = req.getSession().getServletContext().getRealPath("/images");

		File file = new File(path + File.separator + id + File.separator + upload.getOriginalFilename());
		
		map.put("id", id);
		map.put("img", upload.getOriginalFilename());

		try {
			upload.transferTo(file);
			member.insertAppealImg(map);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forward:/Mypage.do";
	}

	@RequestMapping(value = "/deleteAppealImg.do", method = RequestMethod.GET)
	public String deleteAppealImg(@RequestParam String appealNo, Authentication auth) {

		Map map = new HashMap();

		String id = ((UserDetails) auth.getPrincipal()).getUsername();

		map.put("id", id);
		map.put("appealNo", appealNo);

		member.deleteAppealImg(map);

		return "forward:/Mypage.do";
	}
}
