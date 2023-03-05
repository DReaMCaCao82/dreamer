package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.PerformanceDTO;
import com.moegga.app.service.PerformanceService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;

@Controller
public class PerformanceController {

	@Resource(name = "performanceService")
	PerformanceService performance;
	@Resource(name = "meetingService")
	MeetingService meeting;
	@Resource(name = "townService")
	TownService town;
	@Resource(name = "memberService")
	MemberService member;
	@Resource(name = "categoryService")
	CategoryService category;

	@RequestMapping(value = "/performance/PerformanceList.do", method = RequestMethod.GET)
	public String perform(Model model, Authentication auth,Map map) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		TownDTO townDTO=town.selectTownById(map);
		
		String town=null;
		map.put("town", town);
		if(townDTO != null) {
			town =townDTO.getTown();
			map.put("town", town);
		}
		List<PerformanceDTO> performanceList = performance.selectPerformanceList(map);

		model.addAttribute("performanceList", performanceList);
		model.addAttribute("town",town);

		return "/performance/performanceList.tiles";
	}


	@RequestMapping(value = "/performance/MyTownPerformance.do", method = RequestMethod.GET)
	public String myTownperformance(Model model, Authentication auth) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();

		Map map = new HashMap();
		map.put("id", id);
		TownDTO townDTO = town.selectTownById(map);
		System.out.println(townDTO.getTown());
		if (townDTO != null) {
			map.put("town", townDTO.getTown());
		}
		List<PerformanceDTO> myTownPerformanceList = performance.selectMyTownPerformanceList(map);

		model.addAttribute("town", town);
		model.addAttribute("myTownPerformanceList", myTownPerformanceList);

		return "/performance/myTownPerformance.tiles";
	}

	@RequestMapping(value = "/performance/CreatePerformance.do", method = RequestMethod.GET)
	public String createPerformance() {
		return "/performance/createPerformance.tiles";
	}

	@RequestMapping(value = "/CreateNewPerformance.do")
	public String createNewPerformance(@RequestParam("cma_file") MultipartFile upload, @RequestParam Map map,
			HttpServletRequest req, Authentication auth) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("operator", id); // #{operator}
		MeetingDTO meetingDTO = meeting.selectMeetingByOperator(map);
		map.put("meetingNo", meetingDTO.getMeetingNo());
		System.out.println(map.get("operator"));
		System.out.println(map.get("meetingNo"));

		map.put("content", map.get("content").toString());

		map.put("main_img", upload.getOriginalFilename());

		String place = map.get("addr").toString() + "," + map.get("detailAddress").toString();
		map.put("place", place);

		performance.insertNewPerformance(map);

		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path + File.separator + id + File.separator + meetingDTO.getMeetingName()
				+ File.separator + "Performance");
		if (!pathFile.exists()) {
			pathFile.mkdirs();
		}
		
		File file = new File(path + File.separator + id + File.separator + meetingDTO.getMeetingName() + File.separator
				+ "Performance" + File.separator + upload.getOriginalFilename());
		try {
			upload.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/MeetingViewCon.do?meetingNo="+meetingDTO.getMeetingNo();
	}

	@RequestMapping(value = "/performance/UpdatePerformance.do", method = RequestMethod.GET)
	public String updatePerformance(@RequestParam Map map, Authentication auth, Model model) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("operator", id); // #{operator}

		MeetingDTO thisMeeting = meeting.selectMeetingByOperator(map);

		PerformanceDTO onePerformanceByNo = performance.selectOnePerformanceByNo(map);

		String[] address = (onePerformanceByNo.getPlace()).split(",");
		String addr = address[0];
		String detailAddress = address[1];

		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		String perform_date = dtFormat.format(onePerformanceByNo.getPerform_date());

		String performanceNo = onePerformanceByNo.getPerformanceNo();

		model.addAttribute("perform_date", perform_date);
		model.addAttribute("performanceNo", performanceNo);
		model.addAttribute("addr", addr);
		model.addAttribute("detailAddress", detailAddress);
		model.addAttribute("thisMeeting", thisMeeting);
		model.addAttribute("onePerformanceByNo", onePerformanceByNo);

		return "/performance/updatePerformance.tiles";
	}

	// /UpdatePerformanceProcess.do
	@RequestMapping(value = "/UpdatePerformanceProcess.do")
	public String uUpdatePerformanceProcess(@RequestParam("cma_file") MultipartFile upload, @RequestParam Map map,
			HttpServletRequest req, Authentication auth) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("operator", id); // #{operator}
		MeetingDTO meetingDTO = meeting.selectMeetingByOperator(map);

		map.put("content", map.get("content").toString());

		map.put("place", map.get("addr").toString() + ", " + map.get("detailAddress").toString());

		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path + File.separator + id + File.separator + meetingDTO.getMeetingName()
				+ File.separator + "Performance");
		if (!pathFile.exists()) {
			pathFile.mkdirs();
		}

		File file = new File(path + File.separator + id + File.separator + meetingDTO.getMeetingName() + File.separator
				+ "Performance" + File.separator + upload.getOriginalFilename());

		if (upload.getOriginalFilename().equals("")) {
			map.put("main_img", null);
			performance.updatePerformanceByNo(map);
		} else {
			map.put("main_img", upload.getOriginalFilename());
			performance.updatePerformanceByNo(map);
			try {
				upload.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		return "redirect:/MeetingViewCon.do?meetingNo="+meetingDTO.getMeetingNo();
	}

	@RequestMapping("/DeletePerformance.do")
	public String noticeDeleteProcess(@RequestParam Map map) {

		performance.deletePerformance(map);
		
		return "redirect:/PerformanceList.do";
	}

}////////////////////// class
