package com.moegga.app.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.moegga.app.service.AdminService;
import com.moegga.app.service.BBSAccusationDTO;
import com.moegga.app.service.BBSDTO;
import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.FundingDTO;
import com.moegga.app.service.MeetingAccusationDTO;
import com.moegga.app.service.impl.Paging;
import com.moegga.app.service.impl.PagingUtil;

import sun.text.normalizer.ICUBinary.Authenticate;


@Controller
public class AdminController {
	
	@Resource(name = "adminService")
	AdminService service;
	
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_PAGE}")
	private int blockPage;
	
	/*관리자 메인 페이지 이동 - 로그인 처리 추가예정 */
	@RequestMapping("/Admin/Main.do")
	public String admin(Model model) {
		List<Map> AgeNGender = service.ageAndGender();
		List<Map> CategoryNMeeting = service.categoryAndMeeting();
		model.addAttribute("AgeNGender",AgeNGender);
		model.addAttribute("CategoryNMeeting",CategoryNMeeting);
		return "admin/admin.adminTiles";
	}
	/*통계정보 상세보기 - 사용자 이용통계 보류중*/
	@RequestMapping("/Admin/Analysis.do")
	public String analysis(Model model) {
		List<Map> AgeNGender = service.ageAndGender();
		List<Map> CategoryNMeeting = service.categoryAndMeeting();
		List<Map> SubcategoryNMeeting = service.subcategoryAndMeeting();
		List<Map> TownNMeeting = service.townAndMeeting();
		model.addAttribute("AgeNGender",AgeNGender);
		model.addAttribute("CategoryNMeeting",CategoryNMeeting);
		model.addAttribute("SubcategoryNMeeting",SubcategoryNMeeting);
		model.addAttribute("TownNMeeting",TownNMeeting);
		return "admin/analysis/analysis.adminTiles";
	}
	/*게시글 신고 페이지*/
	@RequestMapping("/Admin/Accusation/BBS.do")
	public String bbsAccusation(@RequestParam Map map, Model model,HttpServletRequest req) {
		int nowPage = map.get("nowPage") == null ? 1 : Integer.parseInt(map.get("nowPage").toString());
		int totalRecord =service.getTotalRecordCountBBSAccusation();
		int totalPage=(int)Math.ceil((double)totalRecord/pageSize);
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
	
		map.put("start", start);
		map.put("end", end);
		List<BBSAccusationDTO> list = service.bbsAccusationSelectlist(map);
		String pagingString=Paging.pagingAccusation(totalRecord, pageSize, blockPage, nowPage, req.getContextPath()+"/Admin/Accusation/BBS.do?");
		
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		
		return "admin/accusation/bbsAccusation.adminTiles";
	}
	@RequestMapping(value="/Admin/Accusation/BBS/Select.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String selectBbs(@RequestParam String bbsno) {
		Map map=  service.selectBbs(bbsno);	
		JSONObject obj = new JSONObject();
		obj.put("TITLE", map.get("TITLE").toString());
		obj.put("ID", map.get("ID").toString());
		return obj.toJSONString();
	}
	@RequestMapping(value="/Admin/Accusation/BBS/Process.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String accusationBBSProcess(@RequestParam Map map) {
		service.bbsAccusationProcess(map);
		JSONObject obj = new JSONObject();
		obj.put("baccusationno", map.get("baccusationno").toString());
		obj.put("result", map.get("result").toString());
		return obj.toJSONString();
	}
	/*모임 신고 페이지*/
	@RequestMapping("/Admin/Accusation/Meeting.do")
	public String meetingAccusation(@RequestParam Map map, Model model,HttpServletRequest req) {
		int nowPage = map.get("nowPage") == null ? 1 : Integer.parseInt(map.get("nowPage").toString());
		int totalRecord =service.getTotalRecordCountMeetingAccusation();
		int totalPage=(int)Math.ceil((double)totalRecord/pageSize);
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
	
		map.put("start", start);
		map.put("end", end);
		List<MeetingAccusationDTO> list = service.meetingAccusationSelectlist(map);
		String pagingString=Paging.pagingAccusation(totalRecord, pageSize, blockPage, nowPage, req.getContextPath()+"/Admin/Accusation/Meeting.do?");
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		
		return "admin/accusation/meetingAccusation.adminTiles";
	}
	@RequestMapping(value="/Admin/Accusation/Meeting/Select.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String selectMeeting(@RequestParam String meetingno) {
		Map map=  service.selectMeeting(meetingno);
		JSONObject obj = new JSONObject();
		obj.put("MEETINGNAME", map.get("MEETINGNAME").toString());
		obj.put("OPERATOR", map.get("OPERATOR").toString());
		return obj.toJSONString();
	}
	@RequestMapping(value="/Admin/Accusation/Meeting/Process.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String accusationMeetingProcess(@RequestParam Map map) {
		service.meetingAccusationProcess(map);
		JSONObject obj = new JSONObject();
		obj.put("maccusationno", map.get("maccusationno").toString());
		obj.put("result", map.get("result").toString());
		return obj.toJSONString();
	}
	/*공지사항관리 페이지*/
	@RequestMapping("/Admin/Notice/List.do")
	public String noticeList(@RequestParam Map map, Model model,HttpServletRequest req) {
		int nowPage = map.get("nowPage") == null ? 1 : Integer.parseInt(map.get("nowPage").toString());
		int totalRecord =service.getTotalRecordCountNotice();
		int totalPage=(int)Math.ceil((double)totalRecord/pageSize);
		int start =(nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
	
		map.put("start", start);
		map.put("end", end);
		List<Map> list = service.noticeSelectlist(map);
		String pagingString=Paging.pagingAccusation(totalRecord, pageSize, blockPage, nowPage, req.getContextPath()+"/Admin/Notice/List.do?");
		model.addAttribute("list", list);
		model.addAttribute("pagingString", pagingString);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		
		return "admin/notice/noticeList.adminTiles";
	}
	@RequestMapping("/Admin/Notice/Write.do")
	public String noticeWrite() {
		return "admin/notice/noticeWrite.adminTiles";
	}
	@RequestMapping("/Admin/Notice/WriteProcess.do")
	public String noticeWriteprocess(@RequestParam Map map) {
		service.noticeInsert(map);
		return "redirect:/Admin/Notice/List.do";
	}
	@RequestMapping("/Admin/Notice/Update.do")
	public String noticeUpdate(@RequestParam String noticeno, Model model) {
		Map map = service.noticeSelectone(noticeno);
		model.addAttribute("item", map);
		return "admin/notice/noticeUpdate.adminTiles";
	}
	@RequestMapping("/Admin/Notice/UpdateProcess.do")
	public String noticeUpdateprocess(@RequestParam Map map) {
		service.noticeUpdate(map);
		return "redirect:/Admin/Notice/List.do";
	}
	@RequestMapping("/Admin/Notice/DeleteProcess.do")
	public String noticeDeleteProcess(@RequestParam String noticeno) {
		service.noticeDelete(noticeno);
		return "redirect:/Admin/Notice/List.do";
	}
	@RequestMapping(value = "/Admin/Notice/ToggleEnabled.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public void toggleEnabled(@RequestParam Map map) {
		service.noticeEnabledToggle(map);
	}
	/*서머노트 업로드*/
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		System.out.println("contextRoot:"+contextRoot);
		String fileRoot = contextRoot+"resources/fileupload/";
		System.out.println("fileRoot:"+fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		System.out.println("originalFileName:"+originalFileName);
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/app/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			System.out.println("success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	/*회원 조회용*/
	@RequestMapping("/Admin/Member/Member.do")
	public String member(Model model) {
		List<Map> MemberList = service.memberList();
		model.addAttribute("MemberList",MemberList);
		return "admin/member/member.adminTiles";
	}
	/*정지 회원 조회용*/
	@RequestMapping("/Admin/Member/SuspendMember.do")
	public String suspendMember(Model model) {
		List<Map> SuspendMemberList = service.suspendMemberList();
		model.addAttribute("SuspendMemberList",SuspendMemberList);
		return "admin/member/suspendMember.adminTiles";
	}
	/*회원 정지 해제용*/
	@RequestMapping(value = "/Admin/Member/MemberSuspendRelease.do",produces = "text/html; charset=UTF-8")
	public String memberSuspendRelease(@RequestParam Map map) {
		service.memberSuspendRelease(map);
		return "forward:/Admin/Member/SuspendMember.do";
	}
	/*모임 조회용*/
	@RequestMapping("/Admin/Meeting/Meeting.do")
	public String meeting(Model model) {
		List<Map> MeetingList = service.meetingList();
		model.addAttribute("MeetingList",MeetingList);
		return "admin/meeting/meeting.adminTiles";
	}
	/*정지 모임 조회용*/
	@RequestMapping("/Admin/Meeting/SuspendMeeting.do")
	public String suspendMeeting(Model model) {
		List<Map> SuspendMeetingList = service.suspendMeetingList();
		model.addAttribute("SuspendMeetingList",SuspendMeetingList);
		return "admin/meeting/suspendMeeting.adminTiles";
	}
	/*모임 정지 해제용*/
	@RequestMapping(value = "/Admin/Meeting/MeetingSuspendRelease.do",produces = "text/html; charset=UTF-8")
	public String meetingSuspendRelease(@RequestParam Map map) {
		service.meetingSuspendRelease(map);
		return "forward:/Admin/Meeting/SuspendMeeting.do";
	}
	/*정지 회원 검색용*/
	@RequestMapping("/Admin/Member/SearchMember.do")
	public ModelAndView searchMember(@RequestParam(defaultValue="") String keyword, Model model) {
		List<Map> searchList = service.searchMember(keyword);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchList", searchList);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		mav.setViewName("admin/member/memberSearchResult.adminTiles");
		
		return mav;
	}
	
	/*정지 모임 검색용*/
	@RequestMapping("/Admin/Member/SearchMeeting.do")
	public ModelAndView searchMeeting(@RequestParam(defaultValue="") String keyword, Model model) {
		List<Map> searchList = service.searchMeeting(keyword);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchList", searchList);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		mav.setViewName("admin/meeting/meetingSearchResult.adminTiles");
		
		return mav;
	}
	/// 관리자 문의 리스트용

	   @RequestMapping("/QuestionsAdminlist.do")
	   public String list(
	         // @ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기-isLogin.jsp파일 사용시
	         // 불필요
	         @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage,
	         HttpServletRequest req, // 컨텍스트 루트 얻기용
	         Model model) {
	      /*
	       * 스프링 씨큐리티 적용시 인증(로그인)되었다면 Authentication객체에 로그인과 관련된 정보가 전달됨 로그인이 안되어 있으면
	       * auth는 null
	       */

	      // 서비스 호출]
	      // 페이징을 위한 로직 시작]
	      // 전체 레코드수
	      int totalRecordCount = service.getTotalRecord(map);

	      // 전체 페이지수
	      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	      // 시작 및 끝 ROWNUM구하기
	      int start = (nowPage - 1) * pageSize + 1;
	      int end = nowPage * pageSize;
	      // 페이징을 위한 로직 끝]

	      map.put("start", start);
	      map.put("end", end);
	      List<Map> list = service.questionselectList(map);

	      List<Map> collections = new Vector<Map>();
	      for (Map m : list) {

	         SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	         String date = simpleDateFormat.format(m.get("BBSPOSTDATE"));
	         m.put("BBSPOSTDATE", date);

	         String none = "";
	         String success = "답변대기";
	         String color = "red";

	         if (m.get("TITLE").toString().length() >= 5) {
	            if (m.get("TITLE").toString().substring(0, 4).equals("[답글]")) {
	               success = "답변완료";
	               color = "green";
	               none = " style=\"color:gray\"";

	            }

	         }
	         m.put("success", success);
	         m.put("none", none);
	         m.put("color", color);
	         collections.add(m);
	      }

	      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
	            req.getContextPath() + "/QuestionsAdminlist.do");
	      model.addAttribute("list", collections);
	      model.addAttribute("pagingString", pagingString);
	      model.addAttribute("totalRecordCount", totalRecordCount);
	      model.addAttribute("nowPage", nowPage);
	      model.addAttribute("pageSize", pageSize);
	      // 뷰정보 반환]
	      return "admin/questions/questions.adminTiles";
	   }

	   ///// 관리자 문의보기

	   @RequestMapping("/QuestionsAdminlistOne.do")
	   public String listone(
	         // @ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기-isLogin.jsp파일 사용시
	         // 불필요
	         @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, Model model) {

	      BBSDTO bbsdto = service.qsusetionselectOne(map);
	      model.addAttribute("bbsdto", bbsdto);
	      // 뷰정보 반환]
	      return "admin/questions/questionsview.adminTiles";

	   }

	   /// 관리자 문의 보내기
	   @RequestMapping("/Questionsupdate.do")
	   public String update(HttpServletRequest req, @RequestParam Map map) {

	      service.qsusetionsupdate(map);

	      // 뷰로 포워드
	      return "forward:/QuestionsAdminlist.do";
	   }////////////////

	   /// 승인대기 펀딩리스트
	   @RequestMapping("/FundingAdminlist.do")
	   public String fundinglist(
	         // @ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기-isLogin.jsp파일 사용시
	         // 불필요
	         @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage,
	         HttpServletRequest req, // 컨텍스트 루트 얻기용
	         Model model) {

	      map.put("enabled", 0);
	      int totalRecordCount = service.getfundingtotal(map);

	      // 전체 페이지수
	      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	      // 시작 및 끝 ROWNUM구하기
	      int start = (nowPage - 1) * pageSize + 1;

	      int end = nowPage * pageSize;

	      map.put("start", start);
	      map.put("end", end);

	      System.out.println("들어옴");
	      List<FundingDTO> list = service.fundingadminlist(map);

	      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
	            req.getContextPath() + "/FundingAdminlist.do");
	      model.addAttribute("list", list);
	      model.addAttribute("pagingString", pagingString);
	      model.addAttribute("totalRecordCount", totalRecordCount);
	      model.addAttribute("nowPage", nowPage);
	      model.addAttribute("pageSize", pageSize);

	      // 뷰정보 반환]
	      return "admin/funding/funding.adminTiles";
	   }/// 승인대기

	   /////// 진행중인 펀딩 리스트
	   @RequestMapping("/FundingAdminStartlist.do")
	   public String fundingstartlist(
	         // @ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기-isLogin.jsp파일 사용시
	         // 불필요
	         @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage,
	         HttpServletRequest req, // 컨텍스트 루트 얻기용
	         Model model) {

	      map.put("enabled", 1);
	      int totalRecordCount = service.getfundingtotal(map);

	      // 전체 페이지수
	      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	      // 시작 및 끝 ROWNUM구하기
	      int start = (nowPage - 1) * pageSize + 1;

	      int end = nowPage * pageSize;

	      map.put("start", start);
	      map.put("end", end);

	      System.out.println("들어옴");
	      List<FundingDTO> list = service.fundingadminlist(map);

	      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
	            req.getContextPath() + "/FundingAdminlist.do");
	      model.addAttribute("list", list);
	      model.addAttribute("pagingString", pagingString);
	      model.addAttribute("totalRecordCount", totalRecordCount);
	      model.addAttribute("nowPage", nowPage);
	      model.addAttribute("pageSize", pageSize);

	      // 뷰정보 반환]
	      return "admin/funding/fundingstart.adminTiles";
	   } /////// 진행중인 펀딩 리스트

	   /////// 중지된 펀딩 리스트
	   @RequestMapping("/FundingAdminStoplist.do")
	   public String fundingstoplist(
	         // @ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기-isLogin.jsp파일 사용시
	         // 불필요
	         @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage,
	         HttpServletRequest req, // 컨텍스트 루트 얻기용
	         Model model) {

	      map.put("enabled", 2);
	      int totalRecordCount = service.getfundingtotal(map);

	      // 전체 페이지수
	      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	      // 시작 및 끝 ROWNUM구하기
	      int start = (nowPage - 1) * pageSize + 1;

	      int end = nowPage * pageSize;

	      map.put("start", start);
	      map.put("end", end);

	      System.out.println("들어옴");
	      List<FundingDTO> list = service.fundingadminlist(map);

	      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
	            req.getContextPath() + "/FundingAdminlist.do");
	      model.addAttribute("list", list);
	      model.addAttribute("pagingString", pagingString);
	      model.addAttribute("totalRecordCount", totalRecordCount);
	      model.addAttribute("nowPage", nowPage);
	      model.addAttribute("pageSize", pageSize);

	      // 뷰정보 반환]
	      return "admin/funding/fundingstop.adminTiles";
	   } /////// 중지된 펀딩 리스트

	   /// 펀딩 승인 중지용
	   @RequestMapping("/FundingUpdate.do")
	   public String fundigupdate(HttpServletRequest req, @RequestParam Map map) {
	 
	      
	        
	      service.fundingupdate(map);
	      
	      String path="";
	      if(map.get("message")=="승인") {
	       path="forward:/FundingAdminlist.do";
	      }
	      if(map.get("message")=="중지") {
	          path="forward:/FundingAdminStartlist.do";
	         }
	      // 뷰로 포워드
	      return path;
	   }//////////////// 승인,중지

	   @RequestMapping("/FundingDelete.do")
	   public String fundingdelete(HttpServletRequest req, @RequestParam Map map) {
	 
	      
	      service.fundingDelete(map);
	   
	      
	   
	      return "forward:/FundingAdminStoplist.do";
	   }//////////////// 승인,중지
	   
	   ////카테고리 리스트
	   @RequestMapping("/Categorylist.do")
	   public String categorylist(
	         // @ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기-isLogin.jsp파일 사용시
	         // 불필요
	         @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage,
	         HttpServletRequest req, // 컨텍스트 루트 얻기용
	         Model model) {

	   
	      int totalRecordCount = service.getcategorygtotal(map);
	        System.out.println("totalRecordCount"+totalRecordCount);

	      // 전체 페이지수
	      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	      // 시작 및 끝 ROWNUM구하기
	      int start = (nowPage - 1) * pageSize + 1;

	      int end = nowPage * pageSize;

	      map.put("start", start);
	      map.put("end", end);

	      
	      List<CategoryDTO> list = service.categorylist(map);

	      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
	            req.getContextPath() + "/Categorylist.do");
	      model.addAttribute("list", list);
	      model.addAttribute("pagingString", pagingString);
	      model.addAttribute("totalRecordCount", totalRecordCount);
	      model.addAttribute("nowPage", nowPage);
	      model.addAttribute("pageSize", pageSize);

	      // 뷰정보 반환]
	      return "admin/category/categoryadd.adminTiles";
	      }////////////////카테고리 리스트 
	   
	   
	   
	   ////카테고리 추가
	   @RequestMapping(value = "Categoryadd.do", produces = "text/html; charset=UTF-8")
	   @ResponseBody
	   public String write( @RequestParam Map map) {
	     
	      service.categoryadd(map);
	      return "카테고리 추가 완료";// 원본글의 번호 반환
	   }
	   
	   
	   ////카테고리 삭제
	   @RequestMapping("/CategoryDelete.do")
	   public String categorydelete(HttpServletRequest req, @RequestParam Map map) {
	 
	      
	      service.categoryDelete(map);
	   
	      
	   
	      return "forward:/Categorylist.do";
	   }//////////////// 승인,중지
	
}
