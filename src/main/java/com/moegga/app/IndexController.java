package com.moegga.app;

import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.MainPageService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.impl.MemberDAO;
import com.moegga.app.service.impl.TownDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	@Resource(name = "adminService")
	AdminService adminservice;
	@Resource(name = "mainpageService")
	MainPageService mainpageservice;
	
	@RequestMapping(value="/Quarter")
	public String quater(Authentication auth) {
		 Collection authorities =  ((UserDetails) auth.getPrincipal()).getAuthorities();
		 String role = authorities.iterator().next().toString();
		 if(role.equals("ROLE_ADMIN"))
			 return "redirect:/Admin/Main.do";
		 return "redirect:/";
	}
	
	@RequestMapping(value = "/")
	public String home(Model model) {
		//깃 테스트를 위해 주석 추가아아아아아아
		//추가아아아아아아아아아
		List<Map> notice = adminservice.mainNoticeSelectlist();
		model.addAttribute("notice",notice);
		/*────────────────────추천 모임───────────────────*/
		
		
		/*────────────────────곧 시작되는 공연───────────────────*/
		List<Map> upcomming_performance = mainpageservice.upcomming_performance();
		model.addAttribute("upcomming_performance",upcomming_performance);
		
		/*────────────────────현재 인기있는 게시글───────────────────*/
		List<Map> popular_bbs = mainpageservice.popular_bbs();
		List<Map> popularBBS = new Vector<Map>();
		for(Map map : popular_bbs) {
			String bbsno = map.get("BBSNO").toString();
			String bbs_img = mainpageservice.getbbsimage(bbsno);
			map.put("BBS_IMG", bbs_img);
			popularBBS.add(map);
		}
		System.out.println("popularBBS:: " + popularBBS);
		model.addAttribute("popularBBS",popularBBS);
		
		/*────────────────────현재 진행 중인 펀딩───────────────────*/
		List<Map> proceed_funding = mainpageservice.proceed_funding();
		model.addAttribute("proceed_funding",proceed_funding);
		
		return "index.tiles";
	}
	
	@RequestMapping(value="/Join.do",method = RequestMethod.GET)
	public String join() {
		return "/member/join";
	}
	
	@RequestMapping(value="/RecommendMeeting.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String recommendMeeting(@RequestParam Map map) {
		List meetingnos = new Vector();
	    Set keys = map.keySet();
	    for(Object key : keys) {
	       meetingnos.add(map.get(key).toString());
	    }
	    map.put("meetingnos", meetingnos);
	    List<MeetingDTO> list = mainpageservice.getRecommends(map);
	    JSONObject json = new JSONObject();
	    JSONArray jsonarray = new JSONArray();
	    for(MeetingDTO dto : list) {
	       JSONObject dtoJson = new JSONObject();
	       dtoJson.put("meetingNo", dto.getMeetingNo());
	       dtoJson.put("meetingName", dto.getMeetingName());
	       dtoJson.put("operator", dto.getOperator());
	       dtoJson.put("openDate", dto.getOpenDate().toString());
	       dtoJson.put("endDate", dto.getEndDate().toString());
	       dtoJson.put("town", dto.getTown());
	       dtoJson.put("meetingDescription", dto.getMeetingDescription());
	       dtoJson.put("categoryNo", dto.getCategoryNo());
	       dtoJson.put("warningCount", dto.getWarningCount());
	       dtoJson.put("enabled", dto.getEnabled());
	       dtoJson.put("bannerImg", dto.getBannerImg());
	       dtoJson.put("currentrole", mainpageservice.getCurrentRoleCount(dto.getMeetingNo()));
	       dtoJson.put("maxrole", dto.getMaxrole());
	       dtoJson.put("mainCategory", dto.getMainCategory());
	       dtoJson.put("subCategory", dto.getSubCategory());
	         
	       jsonarray.add(dtoJson);
	    }
	    json.put("meetingList", jsonarray);
	    return jsonarray.toJSONString();
	}
	

	@RequestMapping(value="/SearchAddress.do",method = RequestMethod.GET)
	public String searchAddress(HttpServletRequest req,Model model) {
		
		model.addAttribute("address",req.getParameter("address"));
		return "/member/SearchAddress";
	}
	
//	@RequestMapping(value="/login.do",method = RequestMethod.GET)
//	public String login() {
//
//		return "/member/login";
//	}
	
}
