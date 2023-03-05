package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.BBS_ImgService;
import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.MemberService;
import com.moegga.app.service.TownDTO;
import com.moegga.app.service.TownService;

@Service("bbs_imgService")
public class BBS_ImgServiceImpl implements BBS_ImgService {
	
	@Resource(name="bbs_imgDAO")
	BBS_ImgDAO dao;

	@Override
	public List<Map> selectThisBBSImgList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectThisBBSImgList(map);
	}

	@Override
	public int insertBBSImg(Map map) {
		// TODO Auto-generated method stub
		return dao.insertBBSImg(map);
	}

	@Override
	public String thisBBSImgCount(Map map) {
		// TODO Auto-generated method stub
		return dao.thisBBSImgCount(map);
	}

	@Override
	public int updateBBSImg(Map map) {
		// TODO Auto-generated method stub
		return dao.updateBBSImg(map);
	}

	@Override
	public int deleteBBSImg(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteBBSImg(map);
	}

	@Override
	public List<Map> selectThisMeetingBBSImgList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectThisMeetingBBSImgList(map);
	}

	

	
	
	

}
