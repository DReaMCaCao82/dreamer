package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.TownDTO;

@Repository("bbs_imgDAO")
public class BBS_ImgDAO {

	@Resource(name="template")
	private SqlSessionTemplate bbs_imgTemplate;

	public List<Map> selectThisBBSImgList(Map map) {
		// TODO Auto-generated method stub
		return bbs_imgTemplate.selectList("selectThisBBSImgList",map);
	}

	public int insertBBSImg(Map map) {
		// TODO Auto-generated method stub
		return bbs_imgTemplate.insert("insertBBSImg", map);
	}

	public String thisBBSImgCount(Map map) {
		// TODO Auto-generated method stub
		return bbs_imgTemplate.selectOne("thisBBSImgCount", map);
	}

	public int updateBBSImg(Map map) {
		// TODO Auto-generated method stub
		return bbs_imgTemplate.update("updateBBSImg", map);
	}

	public int deleteBBSImg(Map map) {
		// TODO Auto-generated method stub
		return bbs_imgTemplate.delete("deleteBBSImg", map);
	}

	public List<Map> selectThisMeetingBBSImgList(Map map) {
		// TODO Auto-generated method stub
		return bbs_imgTemplate.selectList("selectThisMeetingBBSImgList", map);
	}

	
	

}
