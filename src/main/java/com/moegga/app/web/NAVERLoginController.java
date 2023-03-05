package com.moegga.app.web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.KakaoService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.impl.MemberDAO;
import com.moegga.app.service.impl.TownDAO;
import com.sun.xml.internal.ws.util.StringUtils;
import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.model.OAuth2AccessToken;


@Controller
public class NAVERLoginController {
    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    @Resource(name = "memberService")
	MemberService member;

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        System.out.println("여기 들어오나? 4");
        /* 생성한 인증 URL을 View로 전달 */
        return "/member/login";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/moegga", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
    	
    	System.out.println("여기는 callback");
    	OAuth2AccessToken oauthToken;
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	//1. 로그인 사용자 정보를 읽어온다.
    	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
    	
    	/* apiResult json 구조
    	{"resultcode":"00",
    	"message":"success",
    	"response":{"id":"32215295","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
     	*/
    	
    	//2. String형식인 apiResult를 json형태로 바꿈
    	JSONParser parser = new JSONParser();
    	Object obj = parser.parse(apiResult);
    	JSONObject jsonObj = (JSONObject) obj;
    	
    	//3. 데이터 파싱
    	//Top레벨 단계 _response 파싱
    	JSONObject response_obj = (JSONObject)jsonObj.get("response");
    	
    	//response의 nickname값 파싱
    	String id = (String)response_obj.get("id");
    	String name = (String)response_obj.get("name");
    	String gender = (String)response_obj.get("gender");
    	String mobile = (String)response_obj.get("mobile");
    	String birthyear = (String)response_obj.get("birthyear");
    	String password="navernaver";
    	
    	Map map = new HashMap();
    	map.put("id", id);
    	MemberDTO oneMember=member.selectOneById(map);
    	
    	if(oneMember==null) {
    		
    		System.out.println("가입 안한 회원이니 네이버에서 받아온 정보+회원가입 마저 진행");
    		model.addAttribute("id", id);
    		model.addAttribute("pwd", password);
    		model.addAttribute("name", name);
    		model.addAttribute("gender", gender);
    		
    		String[] phone=mobile.split("-");
    		String phoneNum=phone[0]+phone[1]+phone[2];
    		model.addAttribute("tel", phoneNum);
    		
    		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy");
    		Date currentTime = new Date();
    		String mTime = mSimpleDateFormat.format (currentTime);
    		int age=Integer.parseInt(mTime)-Integer.parseInt(birthyear);
    		model.addAttribute("age", age);
	
    		return "/member/join";

    	}else if(oneMember.getId().equals(id)&&oneMember.getPwd().equals(password)) {
    		
    		System.out.println("네이버 아이디로 가입한 회원은 로그인 처리");
    		model.addAttribute("id", id);
    		model.addAttribute("pwd", password);
    		model.addAttribute("name", name);

    	}
    	return "/member/login";
    	//4.파싱 닉네임 세션으로 저장
    	//session.setAttribute("sessionId",nickname); //세션 생성
    	//model.addAttribute("result", apiResult);
    }
   
    
	//로그아웃
//	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
//	public String logout(HttpSession session)throws IOException {
//		System.out.println("여기는 logout");
//		session.invalidate();
//		return "redirect:index.jsp";
//	}

    
}




