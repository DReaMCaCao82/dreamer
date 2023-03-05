package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.AbstractHashedMap;
import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mortbay.util.ajax.JSON;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.moegga.app.service.BBSDTO;
import com.moegga.app.service.BBSService;
import com.moegga.app.service.BBS_ImgService;
import com.moegga.app.service.MeetingDTO;
import com.moegga.app.service.MeetingRoleDTO;
import com.moegga.app.service.MeetingRoleService;
import com.moegga.app.service.MeetingService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.PerformanceDTO;
import com.moegga.app.service.impl.PagingUtil;
import com.sun.org.apache.bcel.internal.generic.ATHROW;



@Controller
public class BBSController {

   @Resource(name = "bbsService")
   private BBSService bbsService;
   
   @Resource(name = "meetingRoleService")
   MeetingRoleService meetingRole;
   @Resource(name = "bbs_imgService")
   BBS_ImgService bbs_img;
   @Resource(name = "meetingService")
   MeetingService meeting;
   @Resource(name="memberService")
   MemberService member;

   @RequestMapping(value = "IsLogin.do", produces = "text/html; charset=UTF-8")
   @ResponseBody
   public String isLogin(Authentication auth) {
      // 인증이 안되었다면 auth는 null
      JSONObject json = new JSONObject();
      if (auth == null) {
         json.put("isLogin", "NO");
         return json.toJSONString();
      }
      json.put("isLogin", "YES");
      return json.toJSONString();
   }

   @RequestMapping(value = "/Questions.do", produces = "text/html; charset=UTF-8")
   @ResponseBody
   public String write(
         // @ModelAttribute("id") String id,
         Authentication auth, @RequestParam Map map) {
      // 서비스 호출]
      // map.put("id", id);//(씨큐리티 미 사용시)한줄 댓글 작성자의 아이디를 맵에 설정
      map.put("id", ((UserDetails) auth.getPrincipal()).getUsername());

      bbsService.insert(map);
      return "문의가 접수 되었습니다";// 원본글의 번호 반환
   }



   @RequestMapping("/MyQuestion.do")
   public String mylist(
         // @ModelAttribute("id") String id,//(씨큐리티 미 사용시)세션영역에서 id가져오기-isLogin.jsp파일 사용시
         // 불필요
         @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage,
         HttpServletRequest req, // 컨텍스트 루트 얻기용
         Model model) {
      /*
       * 스프링 씨큐리티 적용시 인증(로그인)되었다면 Authentication객체에 로그인과 관련된 정보가 전달됨 로그인이 안되어 있으면
       * auth는 null
       */
   
      int pageSize = 5;

      int blockPage = 10;

      // 서비스 호출]
      // 페이징을 위한 로직 시작]
      // 전체 레코드수
      int totalRecordCount = bbsService.getTotalRecord(map);
        System.out.println("totalRecordCount:"+totalRecordCount);
      // 전체 페이지수
      int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

      // 시작 및 끝 ROWNUM구하기
      int start = (nowPage - 1) * pageSize + 1;
      int end = nowPage * pageSize;
      // 페이징을 위한 로직 끝]
       
      map.put("start", start);
      map.put("end", end);
      List<Map> list = bbsService.myselectList(map);
      
      List<Map> collections = new Vector<Map>();
      for(Map m  : list) {
         
         SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
         String date = simpleDateFormat.format(m.get("BBSPOSTDATE"));
         m.put("BBSPOSTDATE",date);
      
         
         String CONTENTS =((String)m.get("CONTENTS")).replace("\r\n","<br/>");
      
         m.put("CONTENTS",CONTENTS);
         String success="답변대기";
         String color="red";
      
         
         if(m.get("TITLE").toString().length()>=5) {
            
            if(m.get("TITLE").toString().substring(0,4).equals("[답글]")) {
               
               
            success="답변완료";
            color="green";
            m.put("TITLE",m.get("TITLE").toString().substring(5));
            
                  }
         
            }
         m.put("success", success);
         
         m.put("color", color);
         collections.add(m);
         }
   
      
      // 데이타 저장]

      String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,
            req.getContextPath() + "/MyQuestion.do");
      model.addAttribute("list", collections);
      model.addAttribute("pagingString", pagingString);
      model.addAttribute("totalRecordCount", totalRecordCount);
      model.addAttribute("nowPage", nowPage);
      model.addAttribute("pageSize", pageSize);
      // 뷰정보 반환]
      return "mypage/questions/myquestions.tiles";
   }
   
   
   //==============================모임 게시판=========================
   @RequestMapping("/bbs/MeetingBBS.do")
   public String meetingBBS(Model model,Authentication auth) {
	   Map map = new HashMap();
	   String id = null;
	   if(auth.getPrincipal()!=null) {
		   id=((UserDetails)auth.getPrincipal()).getUsername();
	   }
	   map.put("id", id);
	   System.out.println("로그인 아이디 : "+id);

	   List<Map> meetingBBSList=bbsService.selectAllMeetingBBS();
	   System.out.println("게시판 목록 : "+meetingBBSList);
      
	   for(Map bbsMap:meetingBBSList) {
    	  
		   String bbsno=bbsMap.get("BBSNO").toString();
		   System.out.println(bbsno);
		   map.put("bbsno", bbsno);
    	  
		   String imgCount=bbs_img.thisBBSImgCount(map);
		   List<Map> imgList=bbs_img.selectThisBBSImgList(map);
		   String likeCount=bbsService.countThisBBSLike(map);
		   String iLikeIt=bbsService.likeCheck(map);
		   String countComment=bbsService.countComment(map);
		   List<Map> comment=bbsService.comment(map);
    	  
		   bbsMap.put("imgCount", imgCount);
		   bbsMap.put("imgList", imgList);
		   bbsMap.put("likeCount", likeCount);
		   bbsMap.put("iLikeIt", iLikeIt );
		   bbsMap.put("countComment", countComment);
		   bbsMap.put("comment", comment);
    	  
		   String meetingno=bbsMap.get("MEETINGNO").toString();
		   map.put("meetingNo", meetingno);
    	  
		   List<MeetingRoleDTO> member=meetingRole.selectThisMeetingRole(map);
    	  
		   bbsMap.put("member", member);
    	  
	   }
	   System.out.println("게시판 목록 내용 추가 후: "+meetingBBSList);

	   model.addAttribute("id",id);
	   model.addAttribute("meetingBBSList",meetingBBSList);

	   return "/bbs/meetingBBS.tiles";
	}///////////////////////////////////////////
   
   
	@RequestMapping(value="/bbs/WriteNewMeetingBBS.do")
	public String writeNewMeetingBBS(@RequestParam("cma_file") List<MultipartFile> upload,@RequestParam Map map,HttpServletRequest req,Authentication auth) {
		
		String meetingNo=(String) map.get("meetingNo");
		map.put("meetingNo",map.get("meetingNo"));
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		
		map.put("content", map.get("content").toString());
		bbsService.insertMeetingBBS(map);
		
		MeetingDTO thisMeeting=meeting.selectMeetingByNo(map);		
		BBSDTO thisBBS=bbsService.selectMbbsByMeetingNoForThisBBSImg(map);
		map.put("bbsno",thisBBS.getBbsNo());
		
		String operator=thisMeeting.getOperator();
		
		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path+File.separator +operator+File.separator+thisMeeting.getMeetingName()+File.separator+"BBS"+File.separator+thisBBS.getBbsNo());
		if(!pathFile.exists()) {
			pathFile.mkdirs();
		}
		for(MultipartFile mBBSImg: upload) {
			
			String bbsImg=mBBSImg.getOriginalFilename().toString();
			map.put("bbsImg",bbsImg);
			System.out.println("게시판 첨부 이미지 파일 이름:"+bbsImg);
			bbs_img.insertBBSImg(map);
			
			File file = new File(path+File.separator +operator+File.separator+thisMeeting.getMeetingName()+File.separator+"BBS"+File.separator+thisBBS.getBbsNo()+File.separator + bbsImg);
			try {
				mBBSImg.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	  
	      return "redirect:/MeetingViewBBS.do?meetingNo="+meetingNo;
	}////
		
	
	@RequestMapping(value = "/bbs/UpdateProcessMeetingBBS.do")
	public String updateProcessMeetingBBS(@RequestParam("cma_file") List<MultipartFile> upload,@RequestParam Map map,HttpServletRequest req,Authentication auth) {
	
		map.put("contents", map.get("content").toString());
		bbsService.updateThisBBS(map);
		
		String bbsno=(String) map.get("bbsno");
		Map thisBBS = bbsService.selectOneMeeetingBBS(map);
		String operator=thisBBS.get("OPERATOR").toString();
		
		String img = bbs_img.thisBBSImgCount(map);
		int imgCount = Integer.parseInt(img);
		int updateImgCount=0;
		for(MultipartFile count : upload) {
			updateImgCount++;
		}
		
		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path+File.separator +operator+File.separator+thisBBS.get("MEETINGNAME")+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO"));
		
		List<Map> imgList=bbs_img.selectThisBBSImgList(map);
		String[] newImgList=req.getParameterValues("imgNo");
		int i=0;
		if(updateImgCount==imgCount) {//사진 수 그대로일 때
			for(String no:newImgList) {
				System.out.println(no+"번의 수정된 이미지:"+upload.get(i).getOriginalFilename().toString());
				String bbsImg=upload.get(i).getOriginalFilename().toString();
				map.put("imgno", no);
				map.put("img", upload.get(i).getOriginalFilename().toString());
				bbs_img.updateBBSImg(map);
				File file = new File(path+File.separator +operator+File.separator+thisBBS.get("MEETINGNAME")+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
				try {
					upload.get(i).transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				i++;
			}
		}else if(updateImgCount>imgCount) {//사진 수 늘어났을 때
			for(String newNo:newImgList) {
				for(Map no:imgList) {
					if(no.get("IMGNO").toString()==newNo) {
						System.out.println(newNo+"번("+no.get("IMGNO")+")의 수정된 이미지:"+upload.get(i).getOriginalFilename().toString());
						String bbsImg=upload.get(i).getOriginalFilename().toString();
						map.put("imgno", newNo);
						map.put("img", upload.get(i).getOriginalFilename().toString());
						bbs_img.updateBBSImg(map);
						File file = new File(path+File.separator +operator+File.separator+thisBBS.get("MEETINGNAME")+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
						try {
							upload.get(i).transferTo(file);
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						i++;
					}
				}
			}
			for(int j=imgCount;j<=updateImgCount;j++) {
				System.out.println(j);
				System.out.println("새로 추가 할"+(j+1)+"번째 이미지:"+upload.get(j).getOriginalFilename().toString());
				map.put("img", upload.get(j).getOriginalFilename().toString());
				bbs_img.insertBBSImg(map);
				String bbsImg = upload.get(j).getOriginalFilename().toString();
				File file = new File(path+File.separator +operator+File.separator+thisBBS.get("MEETINGNAME")+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
				try {
					upload.get(j).transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else {//사진 수 줄었을 때
			for(Map no:imgList) {
				String imgNo=no.get("IMGNO").toString();
				boolean tORf=Arrays.stream(newImgList).anyMatch(imgNo::equals);
				if(!tORf) {
					map.put("imgno", imgNo);
					bbs_img.deleteBBSImg(map);
				}else {
					map.put("imgno", imgNo);
					System.out.println(imgNo+"번의 수정된 이미지:"+upload.get(i).getOriginalFilename().toString());
					String bbsImg=upload.get(i).getOriginalFilename().toString();
					map.put("img", upload.get(i).getOriginalFilename().toString());
					bbs_img.updateBBSImg(map);
					File file = new File(path+File.separator +operator+File.separator+thisBBS.get("MEETINGNAME")+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
					try {
						upload.get(i).transferTo(file);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					i++;
				}
			}
		}
		
		return "redirect:/MeetingViewBBS.do?meetingNo="+thisBBS.get("MEETINGNO").toString();
	}
	
	
	//======게시글 삭제===================================
	@RequestMapping(value="/bbs/DeleteBBS.do")
	public String deleteBBS(@RequestParam Map map) {
		
		String bbsno=(String) map.get("bbsno");
		Map thisBBS = bbsService.selectThisBBS(map);
		bbsService.deleteThisBBS(map);
		if(thisBBS.get("MEETINGNO")==null) {
			return "/bbs/freebbsList.tiles";
		}else {
			return "redirect:/MeetingViewBBS.do?meetingNo="+thisBBS.get("MEETINGNO").toString();
		}
	}
	
	
	@RequestMapping(value="/bbs/UpdateBBS.do")
	public String updateBBS(@RequestParam Map map,Model model) {
		
		String returnPage=null;
		
		if(map.containsKey("meetingbbsNo")) {
			
			System.out.println(map.get("meetingbbsNo"));
			map.put("bbsno", map.get("meetingbbsNo").toString());
			
			Map thisBBS = bbsService.selectOneMeeetingBBS(map);

			List<Map> imgList=bbs_img.selectThisBBSImgList(map);
			thisBBS.put("imgList", imgList);
			System.out.println(imgList);
			
			String imgCount=bbs_img.thisBBSImgCount(map);
			thisBBS.put("imgCount", imgCount);
			
			model.addAttribute("thisBBS",thisBBS);
			
			returnPage= "/bbs/updateMeetingBBS.tiles";
			
		}else if (map.containsKey("freebbsNo")) {
			
			System.out.println(map.get("freebbsNo"));
			map.put("bbsno", map.get("freebbsNo").toString());
			
			Map thisBBS = bbsService.selectOneFreeBBS(map);
			
			List<Map> imgList=bbs_img.selectThisBBSImgList(map);
			thisBBS.put("imgList", imgList);
			System.out.println(imgList);
			
			String imgCount=bbs_img.thisBBSImgCount(map);
			thisBBS.put("imgCount", imgCount);
			
			model.addAttribute("thisBBS",thisBBS);
			
			returnPage="/bbs/updateFreeBBS.tiles";
		}
		return returnPage;
	}
	
	
	//========================자유 게시판===============================
 	@RequestMapping(value="/bbs/FreebbsList.do")
	public String freebbs(Model model,Authentication auth) {
 		
		   Map map = new HashMap();
		   String id = ((UserDetails) auth.getPrincipal()).getUsername();
		   map.put("id", id);
	      
	      List<Map> freeBBSList=bbsService.selectAllFreeBBS();
	      
	      for(Map bbsMap:freeBBSList) {
	    	  
	    	  String bbsno=bbsMap.get("BBSNO").toString();
	    	  map.put("bbsno", bbsno);
	    	  
	    	  String imgCount=bbs_img.thisBBSImgCount(map);
	    	  List<Map> imgList=bbs_img.selectThisBBSImgList(map);
	    	  String likeCount=bbsService.countThisBBSLike(map);
	    	  String iLikeIt=bbsService.likeCheck(map);
	    	  String countComment=bbsService.countComment(map);
	    	  List<Map> comment=bbsService.comment(map);
	    	  
	    	  bbsMap.put("imgCount", imgCount);
	    	  bbsMap.put("imgList", imgList);
	    	  bbsMap.put("likeCount", likeCount);
	    	  bbsMap.put("iLikeIt", iLikeIt );
	    	  bbsMap.put("countComment", countComment);
	    	  bbsMap.put("comment", comment);
	    	  
	      }
	      
	      model.addAttribute("id",id);
	      model.addAttribute("freeBBSList",freeBBSList);System.out.println(freeBBSList);
	      
		return "/bbs/freebbsList.tiles";
	}
 	
 	
	@RequestMapping(value="/bbs/WriteFreebbs.do",method = RequestMethod.GET)
	public String writefreebbs() {
		return "/bbs/writeFreebbs.tiles";
	}
	
	
	@RequestMapping(value="/bbs/WriteNewFreeBBS.do")
	public String writeNewFreeBBS(@RequestParam("cma_file") List<MultipartFile> upload,@RequestParam Map map,HttpServletRequest req,Authentication auth) {
		
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		
		map.put("content", map.get("content").toString());
		bbsService.insertFreeBBS(map);
			
		BBSDTO thisBBS=bbsService.selectFreeBBSNOForThisBBSImg(map);
		map.put("bbsno",thisBBS.getBbsNo());
				
		if(!upload.isEmpty()) {
			
			String path = req.getSession().getServletContext().getRealPath("/images");
			File pathFile = new File(path+File.separator +id+File.separator+"BBS"+File.separator+thisBBS.getBbsNo());
			if(!pathFile.exists()) {
				pathFile.mkdirs();
			}
			
			for(MultipartFile freeBBSImg: upload) {
				
				String bbsImg=freeBBSImg.getOriginalFilename().toString();
				map.put("bbsImg",bbsImg);
				System.out.println("게시판 첨부 이미지 파일 이름:"+bbsImg);
				bbs_img.insertBBSImg(map);
				
				File file = new File(path+File.separator +id+File.separator+"BBS"+File.separator+thisBBS.getBbsNo()+File.separator + bbsImg);
				try {
					freeBBSImg.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	  
	    return "/bbs/freebbsList.tiles";
	}////
		
	
	@RequestMapping(value = "/bbs/UpdateProcessFreeBBS.do")
	public String updateProcessFreeBBS(@RequestParam("cma_file") List<MultipartFile> upload,@RequestParam Map map,HttpServletRequest req,Authentication auth) {
	
		map.put("contents", map.get("content").toString());
		bbsService.updateThisBBS(map);
		
		String bbsno=(String) map.get("bbsno");
		Map thisBBS = bbsService.selectOneFreeBBS(map);
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		
		String img = bbs_img.thisBBSImgCount(map);
		int imgCount = Integer.parseInt(img);
		int updateImgCount=0;
		for(MultipartFile count : upload) {
			updateImgCount++;
		}
		
		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path+File.separator +id+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO"));
		
		List<Map> imgList=bbs_img.selectThisBBSImgList(map);
		String[] newImgList=req.getParameterValues("imgNo");
		int i=0;
		if(updateImgCount==imgCount) {//사진 수 그대로일 때
			for(String no:newImgList) {
				System.out.println(no+"번의 수정된 이미지:"+upload.get(i).getOriginalFilename().toString());
				String bbsImg=upload.get(i).getOriginalFilename().toString();
				map.put("imgno", no);
				map.put("img", upload.get(i).getOriginalFilename().toString());
				bbs_img.updateBBSImg(map);
				File file = new File(path+File.separator +id+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
				try {
					upload.get(i).transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				i++;
			}
		}else if(updateImgCount>imgCount) {//사진 수 늘어났을 때
			for(String newNo:newImgList) {
				for(Map no:imgList) {
					if(no.get("IMGNO").toString()==newNo) {
						System.out.println(newNo+"번("+no.get("IMGNO")+")의 수정된 이미지:"+upload.get(i).getOriginalFilename().toString());
						String bbsImg=upload.get(i).getOriginalFilename().toString();
						map.put("imgno", newNo);
						map.put("img", upload.get(i).getOriginalFilename().toString());
						bbs_img.updateBBSImg(map);
						File file = new File(path+File.separator +id+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
						try {
							upload.get(i).transferTo(file);
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						i++;
					}
				}
			}
			for(int j=imgCount;j<=updateImgCount;j++) {
				System.out.println(j);
				System.out.println("새로 추가 할"+(j+1)+"번째 이미지:"+upload.get(j).getOriginalFilename().toString());
				map.put("img", upload.get(j).getOriginalFilename().toString());
				bbs_img.insertBBSImg(map);
				String bbsImg = upload.get(j).getOriginalFilename().toString();
				File file = new File(path+File.separator +id+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
				try {
					upload.get(j).transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else {//사진 수 줄었을 때
			for(Map no:imgList) {
				String imgNo=no.get("IMGNO").toString();
				boolean tORf=Arrays.stream(newImgList).anyMatch(imgNo::equals);
				if(!tORf) {
					map.put("imgno", imgNo);
					bbs_img.deleteBBSImg(map);
				}else {
					map.put("imgno", imgNo);
					System.out.println(imgNo+"번의 수정된 이미지:"+upload.get(i).getOriginalFilename().toString());
					String bbsImg=upload.get(i).getOriginalFilename().toString();
					map.put("img", upload.get(i).getOriginalFilename().toString());
					bbs_img.updateBBSImg(map);
					File file = new File(path+File.separator +id+File.separator+"BBS"+File.separator+thisBBS.get("BBSNO")+File.separator + bbsImg);
					try {
						upload.get(i).transferTo(file);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					i++;
				}
			}
		}
		
		return "/bbs/freebbsList.tiles";
	}
 
	
	//==============================게시글 좋아요==============================
	@RequestMapping(value="/LikeBBSChange.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String likeBBSChange(Authentication auth,@RequestParam Map map) {

		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		map.put("bbsno",map.get("bbsno").toString());
		
		String re=map.get("re").toString();

		if(re.equals("On")) {
			bbsService.insertLikeBBS(map);
		}else {
			bbsService.deleteLikeBBS(map);
		}
		
		String likeCount=bbsService.countThisBBSLike(map);

		return JSON.toString(likeCount);
	}///////////////////////////////////////////
   
   
	//==============================댓글 입력]
	@RequestMapping(value="/CommentInsert.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String commentInsert(Authentication auth,@RequestParam Map map) {
    	  System.out.println("댓글 입력");
    	  map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
    	  map.put("bbsno", map.get("bbsno").toString());
    	  map.put("comment", map.get("comment").toString());
    	  bbsService.commentInsert(map);
    	  
    	  List<Map> comments=bbsService.comment(map);
    	  //String countComment=bbsService.countComment(map);
    	  //Map record=new HashMap();
    	  //record.put("countComment", countComment);
    	  //comments.add(record);
    	  
    	  return JSONArray.toJSONString(comments);
	}///////////////////////////////////////////
      

	@RequestMapping(value="/CommentUpdate.do",produces = "text/html; charset=UTF-8")
	@ResponseBody  //ajax쓸때 필요
	public String commentUpdate(Authentication auth,@RequestParam Map map) {
		System.out.println("여기로 들어왔나?");
		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		map.put("bbsno", map.get("bbsno").toString());
		map.put("commentNo", map.get("commentNo").toString());
		map.put("comment", map.get("comment").toString());
		bbsService.commentUpdate(map);
		
		List<Map> comments=bbsService.comment(map);
  	  
		return JSONArray.toJSONString(comments);
		
	}
	
	
	@RequestMapping(value="/CommentDelete.do",produces = "text/html; charset=UTF-8")
	@ResponseBody  //ajax쓸때 필요
	public String commentDelete(Authentication auth,@RequestParam Map map) {
       
		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		map.put("commentNo", map.get("commentNo").toString());
		map.put("bbsno", map.get("bbsno").toString());

		bbsService.commentDelete(map);
		
		List<Map> comments=bbsService.comment(map);
		//String countComment=bbsService.countComment(map);
		//Map record=new HashMap();
		//record.put("countComment", countComment);
		//comments.add(record);
		System.out.println(comments);
		return JSONArray.toJSONString(comments);
		
	}
   
	
}