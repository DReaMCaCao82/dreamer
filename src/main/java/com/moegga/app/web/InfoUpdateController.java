package com.moegga.app.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.moegga.app.service.CategoryService;
import com.moegga.app.service.InterestsDTO;
import com.moegga.app.service.InterestsService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;
import com.moegga.app.service.impl.MemberDAO;
import com.moegga.app.service.impl.TownDAO;

@Controller
public class InfoUpdateController {
	@Resource(name = "memberService")
	MemberService member;
	@Resource(name = "townService")
	TownService town;
	@Resource(name = "categoryService")
	CategoryService category;
	@Resource(name = "interestsService")
	InterestsService interests;

	@RequestMapping("/CheckPwdForInfoUpdate.do")
	public String checkPwdForInfoUpdate(@RequestParam Map map, Model model, Authentication auth) {
		String id = ((UserDetails) auth.getPrincipal()).getUsername();
		map.put("id", id);
		List<Map> categoryList = category.selectCategory(map);
		MemberDTO dto = member.selectOneById(map);
		TownDTO townDTO = town.selectTownById(map);
		System.out.println("카테고리 크기 : "+categoryList);
		
		model.addAttribute("dto", dto);
		model.addAttribute("townDTO", townDTO);
		model.addAttribute("categoryList",categoryList);

		return "mypage/infoUpdate";
	}

	@RequestMapping("/UpdatePwd.do")
	public String updatePwd(@RequestParam Map map, Model model, Authentication auth) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();

		map.put("id", id);

		map.put("newpwd", map.get("newPwd"));
		member.updatePwd(map);
		model.addAttribute("updatePwdComplete", "<script>alert('비밀번호가 수정 되었어요!')</script>");
		return "index.tiles";
	}

	@RequestMapping("/Withdraw.do")
	public String withdraw(@RequestParam Map map, Model model, Authentication auth, HttpServletRequest req) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();

		map.put("id", id);

		member.deleteAll(map);
		model.addAttribute("deleteAll", "<script>alert('계정이 탈퇴되었어요!')</script>");
		return "redirect:/logout.do";
	}

	@RequestMapping("/InfoUpdate.do")
	public String infoUpdate(@RequestParam Map map, Model model, Authentication auth, HttpServletRequest req) {

		String id = ((UserDetails) auth.getPrincipal()).getUsername();

		map.put("id", id);

		TownDTO dto = town.selectTownById(map);

		if (dto == null) {
			town.insertAddr(map);
		} else {
			town.updateAddr(map);
		}
		List<InterestsDTO> interestsList =interests.selectInterestsList(map);
		System.out.println("관심분야 개수 : "+interestsList.size());
	
		for(int i=0; i<interestsList.size(); i++) {
			map.put("interestsNo"+(i+1), interestsList.get(i).getInterestsNo());
			
		}
	
		if(interestsList.size()==3) {
			System.out.println("원래 있던 관심분야 개수3");
			if(map.get("mainCategory3")==null) {
				if(map.get("mainCategory2")==null) {
					System.out.println("관심분야 3개에서 1개로 : 관심분야 2와3 삭제, 관심분야 1만 업데이트");
					map.put("interestsNo", map.get("interestsNo3"));
					interests.deleteInterests(map);
					map.put("interestsNo", map.get("interestsNo2"));
					interests.deleteInterests(map);
					
					map.put("mainCategory",map.get("mainCategory1"));
					map.put("subCategory",map.get("subCategory1"));
					int categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo1"));
					interests.updateInterests(map);
					
				}else {
					System.out.println("관심분야 3개에서 2개로 : 관심분야 3 삭제, 관심분야 1, 2 업데이트");
					map.put("interestsNo", map.get("interestsNo3"));
					interests.deleteInterests(map);
					map.put("mainCategory",map.get("mainCategory1"));
					map.put("subCategory",map.get("subCategory1"));
					int categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo1"));
					interests.updateInterests(map);
					map.put("mainCategory",map.get("mainCategory2"));
					map.put("subCategory",map.get("subCategory2"));
					categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo2"));
					interests.updateInterests(map);
				}
			}else {
				System.out.println("관심분야 3개그대로 :  관심분야 1, 2, 3 업데이트");
				map.put("mainCategory",map.get("mainCategory1"));
				map.put("subCategory",map.get("subCategory1"));
				int categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				map.put("interestsNo", map.get("interestsNo1"));
				interests.updateInterests(map);
				map.put("mainCategory",map.get("mainCategory2"));
				map.put("subCategory",map.get("subCategory2"));
				categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				map.put("interestsNo", map.get("interestsNo2"));
				interests.updateInterests(map);
				map.put("mainCategory",map.get("mainCategory3"));
				map.put("subCategory",map.get("subCategory3"));
				categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				map.put("interestsNo", map.get("interestsNo3"));
				interests.updateInterests(map);
			}
		}else if(interestsList.size()==2) {
			System.out.println("원래 있던 관심분야 개수2");
			if(map.get("mainCategory3")==null) {
				if(map.get("mainCategory2")==null) {
					System.out.println("관심분야 2개에서 1개로 : 관심분야 2 삭제, 관심분야 1만 업데이트");
					map.put("interestsNo", map.get("interestsNo2"));
					interests.deleteInterests(map);
					map.put("mainCategory",map.get("mainCategory1"));
					map.put("subCategory",map.get("subCategory1"));
					int categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo1"));
					interests.updateInterests(map);
					
				}else {
					System.out.println("관심분야 2개 그대로 : 관심분야 1, 2 업데이트");
					map.put("mainCategory",map.get("mainCategory1"));
					map.put("subCategory",map.get("subCategory1"));
					int categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo1"));
					interests.updateInterests(map);
					map.put("mainCategory",map.get("mainCategory2"));
					map.put("subCategory",map.get("subCategory2"));
					categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo2"));
					interests.updateInterests(map);
				}
			}else {
				System.out.println("관심분야 2개에서 3개로 : 관심분야 3 추가, 관심분야 1, 2 업데이트");
				map.put("mainCategory",map.get("mainCategory3"));
				map.put("subCategory",map.get("subCategory3"));
				int categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				interests.insertInterests(map);
				map.put("mainCategory",map.get("mainCategory1"));
				map.put("subCategory",map.get("subCategory1"));
				categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				map.put("interestsNo", map.get("interestsNo1"));
				interests.updateInterests(map);
				map.put("mainCategory",map.get("mainCategory2"));
				map.put("subCategory",map.get("subCategory2"));
				categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				map.put("interestsNo", map.get("interestsNo2"));
				interests.updateInterests(map);
			}
		}else {
			System.out.println("원래 있던 관심분야 개수1");
			if(map.get("mainCategory3")==null) {
				if(map.get("mainCategory2")==null) {
					System.out.println("관심분야 1개 그대로 : 관심분야 1만 업데이트");
					map.put("mainCategory",map.get("mainCategory1"));
					map.put("subCategory",map.get("subCategory1"));
					int categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo1"));
					interests.updateInterests(map);
				}else {
					System.out.println("관심분야 1개에서 두개로 : 관심분야 2 추가, 관심분야 1 업데이트");
					map.put("mainCategory",map.get("mainCategory2"));
					map.put("subCategory",map.get("subCategory2"));
					int categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					interests.insertInterests(map);
					map.put("mainCategory",map.get("mainCategory1"));
					map.put("subCategory",map.get("subCategory1"));
					categoryNo=category.selectCategoryNo(map);
					map.put("categoryNo", categoryNo);
					map.put("interestsNo", map.get("interestsNo1"));
					interests.updateInterests(map);
				}
			}else {
				System.out.println("관심분야 1개에서 3개로 : 관심분야 2,3 추가, 관심분야 1 업데이트");
				map.put("mainCategory",map.get("mainCategory2"));
				map.put("subCategory",map.get("subCategory2"));
				int categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				interests.insertInterests(map);
				map.put("mainCategory",map.get("mainCategory3"));
				map.put("subCategory",map.get("subCategory3"));
				categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				interests.insertInterests(map);
				map.put("mainCategory",map.get("mainCategory1"));
				map.put("subCategory",map.get("subCategory1"));
				categoryNo=category.selectCategoryNo(map);
				map.put("categoryNo", categoryNo);
				map.put("interestsNo", map.get("interestsNo1"));
				interests.updateInterests(map);
			}
		}
		
		//member.infoUpdate(map);

		return "forward:/Mypage.do";
	}

	@RequestMapping(value = "/ProfileUpdate.do")
	public String insertAppealImg(@RequestParam("file") MultipartFile upload,@RequestParam Map map,HttpServletRequest req,
			Authentication auth) throws IllegalStateException, IOException {
		String id = ((UserDetails) auth.getPrincipal()).getUsername();

		String path = req.getSession().getServletContext().getRealPath("/images");
		File pathFile = new File(path+File.separator + id);
	      if(!pathFile.exists()) {
	         pathFile.mkdirs();
	      }
		map.put("id", id);
		File file = new File(path + File.separator + id + File.separator + upload.getOriginalFilename());
		
		MemberDTO dto = member.selectOneById(map);
	
		map.put("img", upload.getOriginalFilename());
		map.put("pr", map.get("pr"));
		
		map.put("about_me", map.get("about_me"));
		
		

		if (dto.getProfileimg() == null) {
			if(upload.getOriginalFilename().equals("")) {
				
				member.updateInfo(map);
			}else {
				
				member.updateInfo(map);
				upload.transferTo(file);
			}
		}else {
			if(upload.getOriginalFilename().equals("")) {
				if(map.get("delete").equals("delete")) {
					
					member.updateInfo(map);
					
				}else {
					map.put("img",dto.getProfileimg());
					member.updateInfo(map);
				}
			}else {
				member.updateInfo(map);
				upload.transferTo(file);
			}
		}


		/*
		 * map.put("id", id); map.put("img", upload.getOriginalFilename());
		 * 
		 * try { upload.transferTo(file); member.insertAppealImg(map); } catch
		 * (IllegalStateException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); }
		 */
		return "forward:/Mypage.do";
	}

}
