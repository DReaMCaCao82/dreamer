package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moegga.app.service.MeetingViewService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.PerformanceDTO;
import com.moegga.app.service.PerformanceService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;
import com.moegga.app.service.BBSService;
import com.moegga.app.service.BBS_ImgService;
import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.ChattingService;
import com.moegga.app.service.DonationDTO;
import com.moegga.app.service.DonationService;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.FundingService;
import com.moegga.app.service.Like_MeetingService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingRoleDTO;
import com.moegga.app.service.MeetingRoleService;
import com.moegga.app.service.MeetingService;

@Controller
public class MeetingViewController {
   
   
	@Resource(name = "meetingViewService")
	private MeetingViewService meetingViewService;
	@Resource(name = "fundingService")
	FundingService funding;
	@Resource(name = "donationService")
	DonationService donation;
	@Resource(name="memberService")
	MemberService member;
	@Resource(name="townService")
	TownService town;
	@Resource(name = "performanceService")
	PerformanceService performance;
	@Resource(name = "meetingService")
	MeetingService meeting;
	@Resource(name = "categoryService")
	CategoryService category;
	@Resource(name="meetingRoleService")
	MeetingRoleService meetingRole;
	@Resource(name = "bbsService")
	BBSService bbs;
	@Resource(name="bbs_imgService")
	BBS_ImgService bbs_img;
	@Resource(name = "chattingService")
	ChattingService chattingService;
	@Resource(name = "like_meetingService")
	Like_MeetingService like_meeting;
	
   //==============================모임 상세 TOP=========================================
	@RequestMapping("/MeetingViewTop.do")
	public String meetingViewTop(@RequestParam Map map,Model model,Authentication auth) {
    	  
		if(map.get("operator")!= null) {
			System.out.println("쿼리스트링으로 얻은 모임장:"+map.get("operator"));			
		}else {
			System.out.println("쿼리스트링으로 얻은 모임 번호:"+map.get("meetingNo"));					
		}  
		return "meetingViewTop.meetingViewTiles";  
	}
	//=============================================================================================
	
	
	//==============================모임 상세보기================================================
	@RequestMapping("/MeetingViewMain.do")
	public String member(@RequestParam Map map,Model model,Authentication auth) {

		System.out.println("쿼리스트링으로 얻은 모임 번호"+map.get("meetingNo"));
		MeetingDTO meetingDTO=meeting.selectMeetingByNo(map);
		model.addAttribute("meetingDTO", meetingDTO);
		map.put("operator", meetingDTO.getOperator());
		CategoryDTO categoryDTO=category.selectCategoryOfThisMeeting(map);
		model.addAttribute("category", categoryDTO);
		map.put("meetingNo", meetingDTO.getMeetingNo());
		List<MeetingRoleDTO> thisMeetingRole=meetingRole.selectThisMeetingRole(map);
		model.addAttribute("thisMeetingRole", thisMeetingRole);
		
		FundingDTO dto =funding.selectFundingOne(map);
		model.addAttribute("dto",dto);

		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		model.addAttribute("id", id);
    	 
		int roleMember=meetingRole.selectMeetingRoleList(map);
		model.addAttribute("roleMember", roleMember);

		int meetingNo=meetingDTO.getMeetingNo();
		model.addAttribute("meetingNo", meetingNo);
		
		map.put("id", id);
		MeetingDTO Mdto=meeting.selectMeetingById(map);
		model.addAttribute("Mdto", Mdto);
		int joinMcount=meetingRole.selectJoinMeetingList(map);
		model.addAttribute("joinMcount", joinMcount);
		for(MeetingRoleDTO tmrdto:thisMeetingRole) {
			if(tmrdto.getId()!=null) {
				if(tmrdto.getId().equals(id)) {
					model.addAttribute("myMeetingNo", tmrdto.getMeetingNo());
					break;
				}
			}else {
				model.addAttribute("myMeetingNo", 0);
			}
			
			
		}
		List<MeetingRoleDTO> myMeeting=meetingRole.selectMyMeetingRole(map);
		model.addAttribute("myMeeting", myMeeting);

		List<PerformanceDTO> performanceListOfThisMeeting=performance.selectPerformanceListOfThisMeeting(map);
		if(performanceListOfThisMeeting.isEmpty()) {
			model.addAttribute("endPerform", true);
		}else {
			for(PerformanceDTO perform:performanceListOfThisMeeting) {
				SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date curTime = new Date ();
				String Time = SimpleDateFormat.format (curTime);
				long caldate = perform.getPerform_date().getTime()-curTime.getTime();  
			    int caldatedays = (int)(caldate / ( 24*60*60*1000)); 
			    System.out.println(caldatedays);
			    //calDateDays = Math.abs(calDateDays);
			    System.out.println(caldatedays+"일");
			    if(caldatedays>0) {
			    	model.addAttribute("endPerform", false);
			    	break;
			    }else {
			    	model.addAttribute("endPerform", true);
			    }
			}
		}
		
		Map record = new HashMap();
		List<Map> subscriptionList = new Vector<Map>();
		for(MeetingRoleDTO tmr:thisMeetingRole) {
			if(tmr.getName()!=null && tmr.getEnabled()==0) {
				map.put("id", tmr.getId());
				MemberDTO mb=member.selectOneById(map);
				List<Map> cg=category.selectCategory(map);
				TownDTO t=town.selectTownById(map);
				List<MeetingDTO> mt=meeting.selectJoinedMeetingList(map);
				List<Map> apl=member.selectAppealList(map);
				System.out.println(mt+" : "+cg);
				if(!apl.isEmpty()) {
					for(int i=0;i<apl.size();i++) {
						record.put("img."+i, apl.get(i));
					}
				}else {
					record.put("img.0", null);
				}
				if(!mt.isEmpty()) {
					record.put("meetingNo", mt.get(0).getMeetingNo());
					record.put("meetingName", mt.get(0).getMeetingName());
					record.put("operator", mt.get(0).getOperator());
					record.put("bannerImg", mt.get(0).getBannerImg());
					record.put("mMainCate", mt.get(0).getMainCategory());
					record.put("mSubCate", mt.get(0).getSubCategory());
				}
				if(!cg.isEmpty()) {
					record.put("mainCategory", cg.get(0).get("MAINCATEGORY"));
					record.put("subCategory", cg.get(0).get("SUBCATEGORY"));
				}
				record.put("town", t.getTown());
				record.put("id", mb.getId());
				record.put("name", mb.getName());
				record.put("gender", mb.getGender());
				record.put("postDate", mb.getPostdate());
				record.put("age", mb.getAge());
				record.put("pr", mb.getPr());
				record.put("aboutMe", mb.getAbout_me());
				record.put("profileImg", mb.getProfileimg());
				record.put("imgCount", apl.size());
			}
			subscriptionList.add(record);
		}
		model.addAttribute("subscriptionList", subscriptionList);
		
		List<Map> bbsImg=bbs_img.selectThisMeetingBBSImgList(map);
		model.addAttribute("bbsImg", bbsImg);
		
		return "meetingViewMain.meetingViewTiles";  
	}
	//=============================================================================

	
	@RequestMapping("/MeetingViewBBS.do")
	public String MeetingViewBBS(@RequestParam Map map,Model model,Authentication auth) {
		
		System.out.println("쿼리스트링으로 얻은 모임 번호"+map.get("meetingNo"));
		MeetingDTO meetingDTO=meeting.selectMeetingByNo(map);
		model.addAttribute("meetingDTO", meetingDTO);
		map.put("operator", meetingDTO.getOperator());
		CategoryDTO categoryDTO=category.selectCategoryOfThisMeeting(map);
		model.addAttribute("category", categoryDTO);
		model.addAttribute("meetingNo", meetingDTO.getMeetingNo());
		
		map.put("meetingNo", meetingDTO.getMeetingNo());
		List<MeetingRoleDTO> thisMeetingRole=meetingRole.selectThisMeetingRole(map);
		model.addAttribute("thisMeetingRole", thisMeetingRole);
		
		int roleMember=meetingRole.selectMeetingRoleList(map);
		model.addAttribute("roleMember", roleMember);
		
		FundingDTO dto =funding.selectFundingOne(map);
		model.addAttribute("dto",dto);
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		model.addAttribute("id", id);
		map.put("id", id);
		
		List<PerformanceDTO> performanceListOfThisMeeting=performance.selectPerformanceListOfThisMeeting(map);
		if(performanceListOfThisMeeting.isEmpty()) {
			model.addAttribute("endPerform", true);
		}else {
			for(PerformanceDTO perform:performanceListOfThisMeeting) {
				SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date curTime = new Date ();
				String Time = SimpleDateFormat.format (curTime);
				long caldate = perform.getPerform_date().getTime()-curTime.getTime();  
			    int caldatedays = (int)(caldate / ( 24*60*60*1000)); 
			    System.out.println(caldatedays);
			    //calDateDays = Math.abs(calDateDays);
			    System.out.println(caldatedays+"일");
			    if(caldatedays>0) {
			    	model.addAttribute("endPerform", false);
			    	break;
			    }else {
			    	model.addAttribute("endPerform", true);
			    }
			}
		}
		
		String meetingNo=map.get("meetingNo").toString();
		//map.put("meetingNo", meetingNo);
		//List<Map> meetingBBSList=bbs.selectAllMeetingBBS();
		List<Map> meetingBBSList=bbs.selectThisMeetingBBS(map);
		System.out.println("게시판 내용 수 : "+meetingBBSList.size());
		//Optional<Map> noBBS=meetingBBSList.stream().filter(x->x.get("MEETINGNO").toString().equals(meetingNo)).findAny();//.isPresent();
		
		if(meetingBBSList.size()==0) {//noBBS.isPresent()==false) {
			meetingBBSList=null;
			System.out.println("이 모임에서 쓴 게시글이 없네"+meetingBBSList);
		}else {
			for(Map bbsMap:meetingBBSList) {
				//if(!bbsMap.get("MEETINGNO").toString().equals(meetingNo)) {System.out.print(meetingBBSList.));}idx++;
				System.out.println("모임 번호가 다르면 여기 들어오면 안돼");
				String bbsno=bbsMap.get("BBSNO").toString();
				System.out.println(bbsno);
				map.put("bbsno", bbsno);
	    	  
				String imgCount=bbs_img.thisBBSImgCount(map);
				List<Map> imgList=bbs_img.selectThisBBSImgList(map);
				String likeCount=bbs.countThisBBSLike(map);
				String iLikeIt=bbs.likeCheck(map);
				String countComment=bbs.countComment(map);
				List<Map> comment=bbs.comment(map);
	    	  
				bbsMap.put("imgCount", imgCount);
				bbsMap.put("imgList", imgList);
				bbsMap.put("likeCount", likeCount);
				bbsMap.put("iLikeIt", iLikeIt );
				bbsMap.put("countComment", countComment);
				bbsMap.put("comment", comment);
				
			}System.out.println(meetingBBSList);
			model.addAttribute("meetingBBSList",meetingBBSList);
		}
		
		return "/bbs/meetingViewBBS.meetingViewTiles";
	}
	
	@RequestMapping(value="/bbs/WriteMeetingBBS.do",method = RequestMethod.GET)
	public String writeMeetingBBS(Authentication auth,@RequestParam Map map,Model model) {
		//String meetingNo=(String) map.get("meetingNo");
		model.addAttribute("meetingNo",map.get("meetingNo"));
		return "/bbs/writeMeetingBBS.tiles";
	}

	@RequestMapping("/MeetingViewCal.do")
	public String MeetingViewCal() {
		return "/calendar/meetingViewCal.meetingViewTiles";
	}

	
	//=================공연 상세보기==========================================================
	@RequestMapping("/MeetingViewCon.do")
	public String MeetingViewCon(@RequestParam Map map,Model model,Authentication auth) {

		System.out.println("쿼리스트링으로 얻은 모임 번호"+map.get("meetingNo"));		
		CategoryDTO categoryDTO=category.selectCategoryOfThisMeeting(map);
		model.addAttribute("category", categoryDTO);
		
		map.put("meetingNo", categoryDTO.getMeetingNo());
		List<MeetingRoleDTO> thisMeetingRole=meetingRole.selectThisMeetingRole(map);
		model.addAttribute("thisMeetingRole", thisMeetingRole);
		
		int roleMember=meetingRole.selectMeetingRoleList(map);
		model.addAttribute("roleMember", roleMember);
		
		FundingDTO dto =funding.selectFundingOne(map);
		model.addAttribute("dto",dto);
		
		List<PerformanceDTO> performanceListOfThisMeeting=performance.selectPerformanceListOfThisMeeting(map);
		if(performanceListOfThisMeeting.isEmpty()) {
			model.addAttribute("endPerform", true);
		}else {
			for(PerformanceDTO perform:performanceListOfThisMeeting) {
				SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date curTime = new Date ();
				String Time = SimpleDateFormat.format (curTime);
				long caldate = perform.getPerform_date().getTime()-curTime.getTime();  
			    int caldatedays = (int)(caldate / ( 24*60*60*1000)); 
			    System.out.println(caldatedays);
			    //calDateDays = Math.abs(calDateDays);
			    System.out.println(caldatedays+"일");
			    if(caldatedays>0) {
			    	model.addAttribute("endPerform", false);
			    	break;
			    }else {
			    	model.addAttribute("endPerform", true);
			    }
			}
		}
		CategoryDTO categoryOfThisMeeting=category.selectCategoryOfThisMeeting(map);
		model.addAttribute("meetingDTO",categoryOfThisMeeting);
		model.addAttribute("performanceListOfThisMeeting", performanceListOfThisMeeting);
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		model.addAttribute("id", id);
		
		return "/concert/meetingViewCon.meetingViewTiles";
	}
	//======================================================================================

	
	@RequestMapping("/funding/MeetingViewFun.do")
	public String MeetingViewFun(@RequestParam Map map,Model model,Authentication auth) {
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		model.addAttribute("id", id);
		System.out.println("쿼리스트링으로 얻은 모임 번호"+map.get("meetingNo"));
		MeetingDTO meetingDTO=meeting.selectMeetingByNo(map);
		map.put("operator", meetingDTO.getOperator());
		CategoryDTO categoryDTO=category.selectCategoryOfThisMeeting(map);
		model.addAttribute("category", categoryDTO);
		model.addAttribute("meetingDTO", meetingDTO);
		map.put("meetingNo", meetingDTO.getMeetingNo());
		List<MeetingRoleDTO> thisMeetingRole=meetingRole.selectThisMeetingRole(map);
		model.addAttribute("thisMeetingRole", thisMeetingRole);
		int roleMember=meetingRole.selectMeetingRoleList(map);
		model.addAttribute("roleMember", roleMember);
		
		FundingDTO dto =funding.selectFundingOne(map);
		if(dto==null) {
			model.addAttribute("dto",null);
		}else {
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date currentTime = new Date ();
			String mTime = mSimpleDateFormat.format (currentTime);
			try {
				currentTime=mSimpleDateFormat.parse(mTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//펀딩 끝나는날과 현재날 빼서 일수 계산 로직
			long calDate = currentTime.getTime() - dto.getFundingEnddate().getTime();  
		    int calDateDays = (int)(calDate / ( 24*60*60*1000)); 
		    calDateDays = Math.abs(calDateDays);
		    dto.setCalDateDays(calDateDays);
		    List<DonationDTO> donationList =donation.selectDonationList(map);
		    dto.setDonationList(donationList.size());
		    dto.setMeetingDescription(dto.getMeetingDescription().replace("\n","<br/>"));
			model.addAttribute("dto",dto);
		}
		List<PerformanceDTO> performanceListOfThisMeeting=performance.selectPerformanceListOfThisMeeting(map);
		if(performanceListOfThisMeeting.isEmpty()) {
			model.addAttribute("endPerform", true);
		}else {
			for(PerformanceDTO perform:performanceListOfThisMeeting) {
				SimpleDateFormat SimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date curTime = new Date ();
				String Time = SimpleDateFormat.format (curTime);
				long caldate = perform.getPerform_date().getTime()-curTime.getTime();  
			    int caldatedays = (int)(caldate / ( 24*60*60*1000)); 
			    System.out.println(caldatedays);
			    //calDateDays = Math.abs(calDateDays);
			    System.out.println(caldatedays+"일");
			    if(caldatedays>0) {
			    	model.addAttribute("endPerform", false);
			    	break;
			    }else {
			    	model.addAttribute("endPerform", true);
			    }
			}
		}
		
		return "/funding/meetingViewFun.meetingViewTiles";
	}
	
	
	//모임 수정=================================================================================
	@RequestMapping(value="/UpdateMeeting.do")
	public String createNewMeeting(@RequestParam Map map,HttpServletRequest req,Authentication auth,Model model) {
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("operator", id);
		//System.out.println("쿼리스트링으로 얻은 모임 번호"+map.get("meetingNo"));
		MeetingDTO thisMeeting=meeting.selectMeetingByOperator(map);
		System.out.println("모임 정보 맞게 잘 뽑아오나 보자");
		model.addAttribute("thisMeeting", thisMeeting);
		
		List<Map> mainCategory =category.selectMainCategory(); //select distinct * maincategory from category ->음악,예술,공연,스포츠
		System.out.println(mainCategory.size());
		for(Map maincate : mainCategory) {
			System.out.println("메인카테고리 :"+maincate.get("MAINCATEGORY"));
		}
		model.addAttribute("mainCategory",mainCategory);
		
		CategoryDTO categoryDTO=category.selectCategoryByMeetingNo(map);
		String mainCate=categoryDTO.getMaincategory();
		String subCate=categoryDTO.getSubcategory();
		model.addAttribute("mainCate",mainCate);
		model.addAttribute("subCate",subCate);System.out.println(mainCate+">"+subCate);
		
		System.out.println("쿼리스트링으로 얻은 모임 번호"+map.get("meetingNo"));
		List<MeetingRoleDTO> memberRole=meetingRole.selectThisMeetingRole(map);

		model.addAttribute("memberRole",memberRole);
		return "/meeting/updateMeeting.tiles";
	}
	
	
	@RequestMapping(value = "/UpdateMeetingProcess.do")
	public String uUpdatePerformanceProcess(@RequestParam("cma_file") MultipartFile upload,@RequestParam Map map,HttpServletRequest req,Authentication auth) {
		System.out.println("수정 시작합니다.");
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("operator", id); //#{operator}
		MeetingDTO meetingDTO = meeting.selectMeetingByOperator(map);
		System.out.println(map.get("operator"));
		
		System.out.println(map.get("subCategory"));
		int categoryNo=category.selectCategoryNo(map);
		map.put("categoryNo", categoryNo);
			
		map.put("content", map.get("content").toString());
			
		int newMaxRole=1;
		for(String memberRole : req.getParameterValues("memberRole")) {
			newMaxRole++;
		}
		map.put("maxRole", newMaxRole);
		int originMaxRole=meetingDTO.getMaxrole();

		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path+File.separator +id+File.separator+meetingDTO.getMeetingName());
        if(!pathFile.exists()) {
           pathFile.mkdirs();
        }

		File file = new File(path+File.separator +id+File.separator+meetingDTO.getMeetingName() + File.separator + upload.getOriginalFilename());
		
		if(upload.getOriginalFilename().equals("")) {
			System.out.println("배너이미지 널");
			map.put("bannerImg", null);
			meeting.updateMeetingByOperator(map);
			System.out.println("디비에 모임 데이터 수정 완료,이미지는 미변경");
		}else {
			System.out.println("배너이미지 널 아님");
			map.put("bannerImg", upload.getOriginalFilename());
			meeting.updateMeetingByOperator(map);
			System.out.println("디비에 모임 데이터 수정 완료");
			try {
				upload.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("모임장 id : "+map.get("operator"));
		System.out.println("모임 수정할 때 얻은 모임장 역할:"+map.get("operatorRole"));
		meetingRole.updateOperatorRole(map);
		map.put("meetingNo", meetingDTO.getMeetingNo());
		List<MeetingRoleDTO> mRole=meetingRole.selectThisMeetingRole(map);
		String[] memberRole=req.getParameterValues("memberRole");
		String[] memberRoleNo=req.getParameterValues("roleNo");
		int i=0;
		if(newMaxRole==originMaxRole) {//역할 수 그대로일 때
			for(MeetingRoleDTO dto:mRole) {
				System.out.println("역할 번호  : "+dto.getRoleNo());
				if(dto.getId()==null) {
					System.out.println(i+"번째 배열의 수정한 역할:"+memberRole[i]);
					map.put("roleNo", dto.getRoleNo());
					map.put("memberRole", memberRole[i]);
					meetingRole.updateMemberRole(map);
					i++;
				}
			}
		}else if(newMaxRole>originMaxRole) {//역할 수 늘어났을 때
			for(MeetingRoleDTO dto:mRole) {
				System.out.println("역할 번호  : "+dto.getRoleNo());
				if(dto.getId()==null) {
					System.out.println(i+"번째 배열의 수정한 역할:"+memberRole[i]);
					map.put("roleNo", dto.getRoleNo());
					map.put("memberRole", memberRole[i]);
					meetingRole.updateMemberRole(map);
					i++;
				}
			}
			for(int j=originMaxRole-1;j<memberRole.length;j++) {
				System.out.println(j);
				System.out.println("추가로 만들"+j+"번째 배열의 역할:"+memberRole[j]);
				map.put("memberRole", memberRole[j]);
				meetingRole.insertMemberRole(map);
			}
		}else {//역할 수 줄었을 때
			for(MeetingRoleDTO dto:mRole) {
				System.out.println("역할 번호  : "+dto.getRoleNo());
				System.out.println("배열의 크기:"+memberRole.length+",역할 번호 배열의 크기:"+memberRoleNo.length);
				if(dto.getId()==null) {
					int k=0;
					for(int j=0;j<memberRoleNo.length;j++) {
						int mRoleNo=Integer.parseInt(memberRoleNo[j]);
						if(mRoleNo!=dto.getRoleNo()) {
							k++;
							if(k==(originMaxRole-1-(originMaxRole-newMaxRole))) {
								System.out.println(dto.getRoleNo()+"번 역할 삭제할게");
								map.put("roleNo", dto.getRoleNo());
								meetingRole.deleteMeetingRole(map);
							}							
						}else {
							System.out.println(j+"번째 배열의 수정한 역할:"+memberRole[j]);
							map.put("roleNo", dto.getRoleNo());
							map.put("memberRole", memberRole[j]);
							meetingRole.updateMemberRole(map);
						}
					}
				}
			}
		}
		System.out.println("수정 다 끝났어?");
		
		return "redirect:/MeetingViewMain.do?meetingNo="+meetingDTO.getMeetingNo();
	}
	//======================================================================
	
		
	//모임 삭제=========================================================	
	@RequestMapping("/DeleteMeeting.do")
	public String noticeDeleteProcess(@RequestParam Map map) {
		System.out.println("쿼리스트링으로 얻은 공연 번호:"+map.get("meetingNo"));
		meeting.deleteMeeting(map);
		return "redirect:/town/AllOfMeeting.do";
	}
	//================================================================
	
	
	//모임 가입신청하기===================================================
	@RequestMapping("/JoinMeetingSubscription.do")
	public String joinMeetingSubscription(@RequestParam Map map,HttpServletRequest req,Model model) {
		
		MemberDTO dto=member.selectOneById(map);
		String name=dto.getName();
		String JoinMeetingSubscriptionId=(String) map.get("id");
		System.out.println("쿼리스트링으로 가져 모임 신청 id:"+JoinMeetingSubscriptionId);
		String meetingNo=(String) map.get("meetingNo");
		System.out.println("쿼리스트링으로 가져온 모임 번호:"+map.get("meetingNo"));
		String SubscriptionroleNo=req.getParameter("selectRole");
		System.out.println("역할 번호:"+SubscriptionroleNo);
		map.put("id", JoinMeetingSubscriptionId);
		map.put("name", name);
		map.put("meetingNo", meetingNo);
		map.put("roleNo", SubscriptionroleNo);
		meetingRole.joinMeetingDescription(map);
		
		return "redirect:/MeetingViewMain.do?meetingNo="+meetingNo;

	}

	
	//====모임 가입 신청 승인=================================================
	@RequestMapping("/JoinMeetingOk.do")
	public String joinMeetingOk(@RequestParam Map map) {
		
		map.put("roleNo", map.get("roleNo"));
		meetingRole.joinMeetingOk(map);
		int meetingNo=(int) map.get("meetingNo");

		/* 그룹 채팅방 참가 구현 */
		String meetingno = map.get("meetingNo").toString();
		int chatno = chattingService.getChatno(meetingno);
		map.put("chatno", chatno);
		chattingService.chatMemberInsert(map);
		
		return "redirect:/MeetingViewMain.do?meetingNo="+meetingNo;
	}
	//===================================================================
	
	
	//====모임 가입 신청 거절=================================================
	@RequestMapping("/JoinMeetingReject.do")
	public String joinMeetingReject(@RequestParam Map map) {
		System.out.println(map.get("roleNo"));
		map.put("roleNo", map.get("roleNo"));
		meetingRole.joinMeetingReject(map);
		int meetingNo=(int) map.get("meetingNo");
		return "redirect:/MeetingViewMain.do?meetingNo="+meetingNo;
	}
	//===================================================================
	
	
	//====모임 탈퇴=================================================
	@RequestMapping("/DeleteMyMeeting.do")
	public String deleteMyMeeting(@RequestParam Map map) {
		
		map.put("roleNo", map.get("roleNo"));
		meetingRole.deleteMyMeeting(map);
		
		return "/town/allOfMeeting.tiles";
	}
	//===================================================================
	
}
