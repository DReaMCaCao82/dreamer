package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moegga.app.service.CategoryDTO;
import com.moegga.app.service.CategoryService;
import com.moegga.app.service.InterestsService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;
import com.moegga.app.service.impl.TownDAO;

@Controller
public class JoinController {
	@Resource(name = "memberService") //원래클래스 이름 MemberServiceImpl
	MemberService member;
	@Resource(name = "townService")
	TownService town;
	@Resource(name = "categoryService")
	CategoryService category;
	@Resource(name = "interestsService")
	InterestsService interests;

	@RequestMapping("/JoinAddInformation.do")
	public String joinAddInformation(@RequestParam Map map, Model model) {

		model.addAttribute("user_id", map.get("user_id"));
		member.join(map);
		
		
	
		map.put("id", map.get("user_id"));
		map.put("mainCategory", map.get("mainCategory1"));
		map.put("subCategory", map.get("subCategory1"));
		System.out.println("선택한 관심분야 : "+map.get("mainCategory1")+" > "+map.get("subCategory1"));
		
		int secondCategoryNo = 0;
		int thirdCategoryNo = 0;

		int firstCategoryNo = category.selectCategoryNo(map);
		map.put("categoryNo", firstCategoryNo);
		interests.insertInterests(map);

		if (map.get("mainCategory2") == null) {

		} else {
			map.put("mainCategory", map.get("mainCategory2"));
			map.put("subCategory", map.get("subCategory2"));
			secondCategoryNo = category.selectCategoryNo(map);
			map.put("categoryNo", secondCategoryNo);
			interests.insertInterests(map);
		}

		if (map.get("mainCategory3") == null) {

		} else {
			map.put("mainCategory", map.get("mainCategory3"));
			map.put("subCategory", map.get("subCategory3"));
			thirdCategoryNo = category.selectCategoryNo(map);
			map.put("categoryNo", thirdCategoryNo);
			interests.insertInterests(map);
		}
		model.addAttribute("notice", "<script>alert('회원가입이 완료되었어요 !')</script>");
		return "member/joinAddInformation";
	}

	@RequestMapping("/insertImg.do")

	public String insertImg(@RequestParam("file") MultipartFile upload, @RequestParam Map map, HttpServletRequest req,
			Model model) {

		map.put("pr", map.get("pr").toString().replace("\n", "<br/>"));
		map.put("about_me", map.get("about_me").toString().replace("\n", "<br/>"));
		String id = map.get("user_id").toString();
		map.put("id", id);
		map.put("img", upload.getOriginalFilename().toString());
		map.put("addr", map.get("addr"));

		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path+File.separator + id);

	      if(!pathFile.exists()) {
	         pathFile.mkdirs();
	      }

		File file = new File(path + File.separator + id + File.separator + upload.getOriginalFilename());
		try {
			upload.transferTo(file);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		member.updateInfo(map);
		town.insertAddr(map);

		return "index.tiles";
	}
}
