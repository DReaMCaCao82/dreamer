package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.BBSDTO;
import com.moegga.app.service.BBSService;

@Service("bbsService")
public class BBSServiceImpl implements BBSService {
   
   @Resource(name="BBSDAO")
   private BBSDAO dao;

   @Override
   public List<Map> selectList(Map map) {
      
      return dao.selectList(map);
   }

   @Override
   public int getTotalRecord(Map map) {
    System.out.println("들어옴");
      return dao.getTotalRecord(map);
   }

   @Override
   public BBSDTO selectOne(Map map) {
      System.out.println("selectOne 들어옴");
      return dao.selectOne(map);
   }

   @Override
   public int insert(Map map) {
      
      return    dao.insert(map);
   }

   @Override
   public int delete(Map map) {
      
      return 0;
   }

   @Override
   public int update(Map map) {
      
      return dao.update(map);
   }
   
   
   //==============모임 게시판 목록================

	@Override
	public List<Map> myselectList(Map map) {
		
		return dao.myselectList(map);
	}


	@Override
	public int insertMeetingBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.insertMeetingBBS(map);
	}

	@Override
	public BBSDTO selectMbbsByMeetingNoForThisBBSImg(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMbbsByMeetingNoForThisBBSImg(map);
	}

	@Override
	public List<Map> selectAllMeetingBBS() {
		// TODO Auto-generated method stub
		return dao.selectAllMeetingBBS();
	}

	@Override
	public String countThisBBSLike(Map map) {
		// TODO Auto-generated method stub
		return dao.countThisBBSLike(map);
	}

	@Override
	public String likeCheck(Map map) {
		// TODO Auto-generated method stub
		return dao.likeCheck(map);
	}

	@Override
	public String countComment(Map map) {
		// TODO Auto-generated method stub
		return dao.countComment(map);
	}

	@Override
	public List<Map> comment(Map map) {
		// TODO Auto-generated method stub
		return dao.comment(map);
	}

	@Override
	public int insertLikeBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.insertLikeBBS(map);
	}

	@Override
	public int deleteLikeBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteLikeBBS(map);
	}

	@Override
	public int commentInsert(Map map) {
		// TODO Auto-generated method stub
		return dao.commentInsert(map);
	}

	@Override
	public int commentUpdate(Map map) {
		// TODO Auto-generated method stub
		return dao.commentUpdate(map);
	}

	@Override
	public int commentDelete(Map map) {
		// TODO Auto-generated method stub
		return dao.commentDelete(map);
	}

	@Override
	public List<Map> selectAllFreeBBS() {
		// TODO Auto-generated method stub
		return dao.selectAllFreeBBS();
	}

	@Override
	public int insertFreeBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.insertFreeBBS(map);
	}

	@Override
	public BBSDTO selectFreeBBSNOForThisBBSImg(Map map) {
		// TODO Auto-generated method stub
		return dao.selectFreeBBSNOForThisBBSImg(map);
	}

	@Override
	public Map selectOneMeeetingBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOneMeeetingBBS(map);
	}

	@Override
	public int updateThisBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.updateThisBBS(map);
	}

	@Override
	public int deleteThisBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteLikeBBS(map);
	}

	@Override
	public Map selectOneFreeBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.selectOneFreeBBS(map);
	}

	@Override
	public Map selectThisBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.selectThisBBS(map);
	}

	@Override
	public List<Map> selectThisMeetingBBS(Map map) {
		// TODO Auto-generated method stub
		return dao.selectThisMeetingBBS(map);
	}


}
