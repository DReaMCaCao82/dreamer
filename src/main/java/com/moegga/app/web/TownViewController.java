package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.mortbay.util.ajax.JSON;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.moegga.app.service.BBSService;
import com.moegga.app.service.BBS_ImgService;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.ChattingService;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.Like_MeetingService;
import com.moegga.app.service.MeetingDTO;

import com.moegga.app.service.MeetingRoleDTO;

import com.moegga.app.service.MeetingRoleService;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.PagingUtil;
//import com.sun.org.glassfish.gmbal.ParameterNames;
import sun.net.www.MeteredStream;

@Controller
public class TownViewController {
	
	@Resource(name = "memberService")
	MemberService member;
	@Resource(name = "townService")
	TownService town;
	@Resource(name = "categoryService")
	CategoryService category;
	@Resource(name = "meetingService")
	MeetingService meeting;
	@Resource(name = "meetingRoleService")
	MeetingRoleService meetingRole;

	@Resource(name = "bbsService")
	BBSService bbs;
	@Resource(name = "bbs_imgService")
	BBS_ImgService bbs_img;
	
	@Resource(name = "like_meetingService")
	Like_MeetingService like_meeting;
   
	@Resource(name = "chattingService")
	ChattingService chattingService;

	
	@Value("${MEMBERPAGE_SIZE}")
	private int pageSize;
	@Value("${MEMBERBLOCK_PAGE}")
	private int blockPage;
	
	@RequestMapping(value="/town/AllOfMeeting.do",method = RequestMethod.GET)
	public String meeting(Authentication auth,Model model,@RequestParam Map map) {
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		TownDTO townDTO=town.selectTownById(map);
		
		String town=null;
		map.put("town", town);
		List<MeetingDTO> allMeetingList = meeting.selectAllMeetingList(map);
		if(townDTO != null) {
			town =townDTO.getTown();
			map.put("town", town);
		}
		
		List<MeetingDTO> meetingList =meeting.selectMeetingList(map);
		System.out.println("모임 몇개 들어갔니 ? :"+allMeetingList.size());
		for(MeetingDTO meeting:meetingList ) {
			System.out.println(meeting.getMeetingDescription().length());
			if(meeting.getMeetingDescription().length()>50) {
				meeting.setMeetingDescription(meeting.getMeetingDescription().substring(0, 50)+". . .");
			}
			map.put("meetingNo", meeting.getMeetingNo()); //trex meetingno 2
			
			int meetingRoleList =meetingRole.selectMeetingRoleList(map);
			meeting.setMeetingRoleList(meetingRoleList);
			
	        String userLike = like_meeting.selectMeetingLike(map);
	        meeting.setUserLike(userLike);
		}
		
		map.put("operator", id);
		MeetingDTO Mdto=meeting.selectMeetingByOperator(map);
		model.addAttribute("Mdto", Mdto);
		int joinMcount=meetingRole.selectJoinMeetingList(map);
		model.addAttribute("joinMcount", joinMcount);
		
		//2021-01-09 동네모임리스트 db에서 꺼내기까지 완료
		model.addAttribute("meetingList",meetingList);
		model.addAttribute("town",town);
		model.addAttribute("allMeetingList",allMeetingList);

		return "/town/allOfMeeting.tiles";
	}
	
	
	@RequestMapping(value="/ShowUser.do",method = RequestMethod.GET)
	public String member(@RequestParam Map map,Model model,Authentication auth,HttpServletRequest req) {
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		
		List categorySize = new Vector<>();
		
		MeetingDTO Mdto=meeting.selectMeetingById(map);
		String meetingNo=null;
		if(Mdto==null) {
			model.addAttribute("Mdto", null);
		}else {
			model.addAttribute("Mdto", Mdto);
			meetingNo=String.valueOf(Mdto.getMeetingNo());
			model.addAttribute("meetingNo", meetingNo);
			map.put("meetingNo", meetingNo);
			List<MeetingRoleDTO> thisMeetingRole=meetingRole.selectThisMeetingRole(map);
			model.addAttribute("thisMeetingRole", thisMeetingRole);
		}
		map.put("meetingNo", meetingNo);
		
		TownDTO townDTO=town.selectTownById(map);
		if(townDTO != null) {
			model.addAttribute("town",townDTO.getTown());
		}else {
			model.addAttribute("town",null);
		}
		
		int nowPage = map.get("nowPage") == null ? 1 : Integer.parseInt(map.get("nowPage").toString());
		int totalRecord =member.selectMemberListCount(map);
		int totalPage=(int)Math.ceil((double)totalRecord/pageSize);
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		map.put("start", start);
		map.put("end", end);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecord, pageSize, blockPage, nowPage, req.getContextPath()+"/ShowUser.do?");
		
		List<MemberDTO> list =member.selectMemberList(map);
		for(MemberDTO dto:list ) {
			if(dto.getPr()==null) {
				dto.setPr("자기소개가 없어요");
			}else {
				if(dto.getPr().length()>15) {
					dto.setPr(dto.getPr().substring(0, 10)+". . .");
				}
			}//List categorySize = new Vector<>();
			map.put("id", dto.getId());
			System.out.println(dto.getId());
			dto.setCategoryList(category.selectCategory(map));
			int joinMcount=meetingRole.selectJoinMeetingList(map);
			System.out.println(joinMcount);
			dto.setJoinMcount(joinMcount);
			MeetingDTO isOperator=meeting.selectMeetingById(map);
			if(isOperator==null) {
				dto.setIsOperator("true");
			}else {
				dto.setIsOperator("false");
			}
		}

		List<MemberDTO> appealList = member.selectAllAppealList(map);
		model.addAttribute("appealList",appealList);
		
		List<MeetingDTO> joinedMeetingList=meeting.selectMeetingAll(map);
		model.addAttribute("meetingList",joinedMeetingList);

		model.addAttribute("categorySize",categorySize);
		model.addAttribute("list",list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		
		return "/town/showUser.tiles";
	}
	
	/*
	@RequestMapping(value = "/profileView.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String profileView(@RequestParam Map map, Model model,Authentication auth) {
		String id =map.get("id").toString();
		System.out.println("아이디 : "+id);
		MemberDTO memberDTO = member.selectOneById(map);
		TownDTO townDTO =town.selectTownById(map);
		System.out.println("동네 : "+townDTO);
		String userTown=null;
		if(townDTO != null) {
			userTown =townDTO.getTown();
		}
		List<Map> appealList = member.selectAppealList(map);
   
		Map record = new HashMap();
		List<Map> list = new Vector<Map>();
		List<MeetingDTO> joinedMeetingList =meeting.selectJoinedMeetingList(map);

		System.out.println("가입한 모임 :"+joinedMeetingList);
		record.put("about_me", memberDTO.getAbout_me());
		record.put("age", memberDTO.getAge());
		record.put("gender", memberDTO.getGender());
		record.put("id", memberDTO.getId());
		record.put("name", memberDTO.getName());
		record.put("postDate", memberDTO.getPostdate().toString());
		record.put("pr", memberDTO.getPr());
		record.put("profileImg", memberDTO.getProfileimg());
		record.put("town", userTown);
		record.put("appealList", appealList);
		record.put("joinedMeetingList", joinedMeetingList); //이게 jsp로 에이작스 넘어가면서 에이작스가 안됨. dto로 받고있느,ㄴ걸 map으로 한번 받아보자 ㅆㅃ

		list.add(record);

		return JSONArray.toJSONString(list);
      
	}*/
	
	
	//모임 가입 제안하기===================================================
	@RequestMapping("/JoinPropositionByOperator.do")
	public String joinMeetingSubscription(@RequestParam Map map,HttpServletRequest req,Model model) {
		
		MemberDTO dto=member.selectOneById(map);
		String name=dto.getName();
		String JoinMeetingSubscriptionId=(String)map.get("id");
		System.out.println("쿼리스트링으로 가져 모임 신청 id:"+JoinMeetingSubscriptionId);
		String meetingNo=(String)map.get("meetingNo");
		System.out.println("쿼리스트링으로 가져온 모임 번호:"+map.get("meetingNo"));
		String SubscriptionroleNo=req.getParameter("selectRole");
		System.out.println("역할 번호:"+SubscriptionroleNo);
		map.put("id", JoinMeetingSubscriptionId);
		map.put("meetingNo", meetingNo);
		map.put("roleNo", SubscriptionroleNo);
		meetingRole.joinProposition(map);
		
		return "redirect:/MeetingViewMain.do?meetingNo="+meetingNo;

	}
	
	//====모임 가입 제안 수락=================================================
	@RequestMapping("/JoinPropositionOk.do")
	public String joinMeetingOk(@RequestParam Map map,Authentication auth) {
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		MemberDTO my=member.selectOneById(map);
		map.put("name", my.getName());
		map.put("roleNo", map.get("roleNo"));
		meetingRole.propositionOk(map);
		int meetingNo=(int) map.get("meetingNo");
		
		/* 그룹 채팅방 참가 구현 */
		String meetingno = map.get("meetingNo").toString();
		int chatno = chattingService.getChatno(meetingno);
		map.put("chatno", chatno);
		chattingService.chatMemberInsert(map);
		
		return "redirect:/MeetingViewMain.do?meetingNo="+meetingNo;
	}
	
	//====모임 가입 제안 거절=================================================
	@RequestMapping("/JoinPropositionReject.do")
	public String joinMeetingReject(@RequestParam Map map) {
		System.out.println(map.get("roleNo"));
		map.put("roleNo", map.get("roleNo"));
		meetingRole.propositionReject(map);
		int meetingNo=(int) map.get("meetingNo");
		return "redirect:/MeetingViewMain.do?meetingNo="+meetingNo;
	}

	
	@RequestMapping(value="/CreateMeeting.do",method = RequestMethod.GET)
	public String createMeeting(Model model) {
		List<Map> mainCategory =category.selectMainCategory();

		for(Map maincate : mainCategory) {
			System.out.println("메인카테고리 :"+maincate.get("MAINCATEGORY"));
			}
		model.addAttribute("mainCategory",mainCategory);
		return "/meeting/createMeeting.tiles";
	}
	
	
	///CreateNewMeeting.do
	@RequestMapping(value="/CreateNewMeeting.do")
	public String createNewMeeting(@RequestParam("cma_file") MultipartFile upload,@RequestParam Map map,HttpServletRequest req,Authentication auth) {
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("operator", id); //#{operator}
		
		int maxrole=1;
		for(String memberRole : req.getParameterValues("memberRole")) {
			maxrole++;
		}
		
		map.put("maxRole", maxrole);
		
		map.put("content", map.get("content").toString());
		//map.put("content", map.get("content").toString().substring(3, map.get("content").toString().lastIndexOf("<")));
		
		int categoryNo=category.selectCategoryNo(map);
		map.put("categoryNo", categoryNo);

		map.put("bannerImg", upload.getOriginalFilename());
		
		meeting.insertNewMeeting(map);
		
		MeetingDTO meetingDTO = meeting.selectMeetingByOperator(map);
		//if(meetingDTO)
		map.put("meetingNo", meetingDTO.getMeetingNo());
		
		map.put("img", upload.getOriginalFilename().toString());

		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path+File.separator +id+File.separator+meetingDTO.getMeetingName());
        if(!pathFile.exists()) {
           pathFile.mkdirs();
        }

		File file = new File(path+File.separator +id+File.separator+meetingDTO.getMeetingName() + File.separator + upload.getOriginalFilename());
		try {
			upload.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		map.put("id", id);
		MemberDTO memberDTO = member.selectOneById(map);
		map.put("name", memberDTO.getName());
		meetingRole.insertOperator(map);
		for(String memberRole : req.getParameterValues("memberRole")) {
			map.put("memberRole", memberRole); //meetingRole이라는 name값 , 처음에 베이스 라는 value;
			meetingRole.insertMemberRole(map); //#{meetingRole} ->베이스 
		}
		
		/* 그룹 채팅 생성 및 가입용 */
	      /* 모임정보(meetingno, meetingname) 가져오기 */
	      Map getMeetingInfo = chattingService.getMeetingInfo(map);
	      System.out.println(getMeetingInfo);
			
	      String meetingno = map.get("meetingNo").toString();
	      String meetingname = getMeetingInfo.get("MEETINGNAME").toString();
	      System.out.println("meetingno:"+meetingno+", meetingname:"+meetingname);
			
	      /* 채팅방 생성용 */
	      chattingService.createChatRoom(getMeetingInfo);
	      System.out.println("채팅방 생성 성공!!!");
			
	      /* 채팅방 가입용 */
	      int chatno = chattingService.getChatno(meetingno);
	      String roleNo = getMeetingInfo.get("ROLENO").toString();
	      String name = map.get("name").toString();
	      Map chatMap = new HashedMap();
	      chatMap.put("chatno", chatno);
	      chatMap.put("name", name);
	      chatMap.put("roleNo", roleNo);
	      chattingService.chatMemberInsert(chatMap);
	      System.out.println("채팅방 참가도 성공!!!");
	      
	      return "redirect:/MeetingViewMain.do?meetingNo="+meetingDTO.getMeetingNo();
	}


	@RequestMapping(value = "/meetingLikeMypage.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String meetingLikeMypage(@RequestParam Map map, Authentication auth) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		like_meeting.insertMeetingLike(map);

		MeetingDTO dto = meeting.selectOneMeetingByNoAndId(map);

		Map record = new HashMap();
		List<Map> list = new Vector<Map>();
      
		if (dto.getMeetingDescription().length() > 90) {
			dto.setMeetingDescription(dto.getMeetingDescription().substring(0, 90) + ". . .");
			record.put("meetingDescription", dto.getMeetingDescription());
		} else {
			record.put("meetingDescription", dto.getMeetingDescription());
		}

		map.put("meetingNo", dto.getMeetingNo());

		int meetingRoleList = meetingRole.selectMeetingRoleList(map);

		dto.setMeetingRoleList(meetingRoleList);
		record.put("meetingNo", dto.getMeetingNo());
		record.put("meetingName", dto.getMeetingName());
		record.put("bannerImg", dto.getBannerImg());
		record.put("categoryNo", dto.getCategoryNo());
		record.put("endDate", dto.getEndDate().toString());
		record.put("mainCategory", dto.getMainCategory());
		record.put("maxrole", dto.getMaxrole());
		record.put("meetingRoleList", dto.getMeetingRoleList());
		record.put("openDate", dto.getOpenDate().toString());
		record.put("subCategory", dto.getSubCategory());
		record.put("town", dto.getTown());
		record.put("operator", dto.getOperator());

		list.add(record);
		
		return JSONArray.toJSONString(list);
      
	}

	@RequestMapping(value="/LikeMeetingChange.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String likeMeetingChange(Authentication auth,@RequestParam Map map) {

		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		map.put("meetingNo",map.get("bbsno").toString());
		
		String re=map.get("meetingNo").toString();

		if(re.equals("On")) {
			like_meeting.insertMeetingLike(map);
		}else {
			like_meeting.deleteBookMark(map);
		}
		
		return "";
   }
   
   @RequestMapping(value = "/meetingLike.do", produces = "text/html; charset=UTF-8")
   @ResponseBody
   public String meetingLike(@RequestParam Map map, Authentication auth) {

      String id = ((UserDetails) auth.getPrincipal()).getUsername();
      map.put("id", id);
      like_meeting.insertMeetingLike(map);
      return "";
   }

}
