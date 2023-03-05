package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface BBS_ImgService {

	List<Map> selectThisBBSImgList(Map map);

	int insertBBSImg(Map map);

	String thisBBSImgCount(Map map);

	int updateBBSImg(Map map);

	int deleteBBSImg(Map map);

	List<Map> selectThisMeetingBBSImgList(Map map);


	

}
