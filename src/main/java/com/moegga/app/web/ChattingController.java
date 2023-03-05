package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.websocket.Transformation;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.ChattingDTO;
import com.moegga.app.service.ChattingService;
import com.moegga.app.service.MessageDTO;

@Controller
public class ChattingController {

	@Resource(name = "chattingService")
	ChattingService chattingService;
	
	/*그룹 채팅 목록*/
	
	@RequestMapping(value="/ChattingList.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String chattingList() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal();
		String currentUser = user.getUsername();
		
		/*현재 사용자 이름 가져오기*/
		String nickname = chattingService.getNickname(currentUser);
		
		/* 채팅 목록 가져오기 */
		List<ChattingDTO> chattingList = chattingService.chattingList(currentUser);
		
		/*채팅방 참여 유무*/
		int isChatMember = chattingService.isChatMember(currentUser);
		
		Map<String, String> result = new HashMap<String, String>();
		
		result.put("nickname", nickname);
		result.put("isChatMember", Integer.toString(isChatMember));
		
		List<Map> collections = new Vector<Map>();
		
		String chatno = "";
		
		if(isChatMember != 0) {
			for(ChattingDTO dto : chattingList) {
				result = new HashMap<String, String>();
				result.put("chatno", Integer.toString(dto.getChatno()));
				
				chatno = Integer.toString(dto.getChatno());
				
				result.put("meetingname", dto.getMeetingName());
				result.put("meetingno", Integer.toString(dto.getMeetingno()));
				result.put("bannerImg", dto.getBannerImg());
				result.put("chattingName", dto.getChattingName());
				result.put("id", currentUser);
				result.put("nickname", nickname);
				
				/* 가장 최근 메시지 가져오기 */
				List<MessageDTO> currentMsgInfo = chattingService.currentMsgInfo(chatno);
				
				if(!currentMsgInfo.isEmpty()) {
					for(MessageDTO msgDTO : currentMsgInfo) {
						result.put("currentContent", msgDTO.getContent());
						result.put("postdate", msgDTO.getPostdate());
						result.put("division", Integer.toString(msgDTO.getDivision()));
						
						collections.add(result);
					}
				}
				else {
					collections.add(result);
				}
				
			}
			
		}
		else if(isChatMember == 0) {
			collections.add(result);
		}
		
		return JSONArray.toJSONString(collections);
	}
	
	
	/* 채팅 메시지 insert */
	@RequestMapping(value="/ChattingMsgInsert.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public void chattingMsgInsert(@RequestParam("message") String message, @RequestParam("cno") int cno) {
		System.out.println("insert 들어옴");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) authentication.getPrincipal();
		String currentUser = user.getUsername();
		
		int roleno = chattingService.selectRoleno(currentUser);
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("message", message);
		result.put("cno", Integer.toString(cno));
		result.put("currentUser", currentUser);
		result.put("roleno", Integer.toString(roleno));
		
		chattingService.chattingMsgInsert(result);
		
		String name = chattingService.getName(roleno);
		
	}
	
	
	/*그룹 채팅 내역 출력용 */
	@RequestMapping(value="/ChattingMessageList.do",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String meetingChat(@RequestParam("cno") String cno) {
		
		List<MessageDTO> chattingMessageList = chattingService.chattingMessageList(cno);
		
		Map<String, String> result = new HashMap<String, String>();
		
		List<Map> collections = new Vector<Map>();
		for(MessageDTO dto : chattingMessageList) {
			result = new HashMap<String, String>();
			result.put("messageno", Integer.toString(dto.getMeesageno()));
			result.put("content", dto.getContent());
			result.put("chatno", Integer.toString(dto.getChatno()));
			result.put("postdate", dto.getPostdate());
			result.put("nickname", dto.getName());
			result.put("id", dto.getId());
			result.put("division", Integer.toString(dto.getDivision()));
			result.put("profileimg", dto.getProfileImg());
			
			collections.add(result);
			
		}
		System.out.println(JSONArray.toJSONString(collections));

		return JSONArray.toJSONString(collections);
		
	}
	
	
	@RequestMapping(value="/FileMessageSend.do", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String fileMessageSend(
		@RequestParam("cno") int cno, MultipartHttpServletRequest mtfReq, HttpServletRequest req, Authentication auth) throws IllegalStateException, IOException {
		System.out.println("FileMessageSend.do 들어왔다");
		
		System.out.println("cno: " + cno);
		
		MultipartFile mf = mtfReq.getFile("file");
		
		String path = req.getSession().getServletContext().getRealPath("/images");
		
		String originFileName = mf.getOriginalFilename();
		
		String currentUser = ((UserDetails) auth.getPrincipal()).getUsername();
		
		System.out.println("originFileName : " + originFileName);
		System.out.println("path : " + path);
		
		Map map = new HashMap();
		
		int roleno = chattingService.selectRoleno(currentUser);
		
		map.put("filename", originFileName);
		map.put("roleno", roleno);
		map.put("cno", cno);
		
		System.out.println("file insert 성공");
		
		String safeFile = path + File.separator + "chat_no" + cno + File.separator + originFileName;
		
		try {
			mf.transferTo(new File(safeFile));
			chattingService.insertFileMessage(map);
		} catch(IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		return safeFile;
	}
	
}
