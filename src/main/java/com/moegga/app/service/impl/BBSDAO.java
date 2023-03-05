package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.BBSDTO;
import com.moegga.app.service.BBSService;

@Repository("BBSDAO")
public class BBSDAO implements BBSService{

   @Resource(name="template")
   private SqlSessionTemplate bbsTemplate;


   
   @Override
   public List<Map> selectList(Map map) {
      
      return bbsTemplate.selectList("BBSSelectList",map);
   }

   @Override
   public int insert(Map map) {
      
      return bbsTemplate.insert("BBSInsert",map);
      
   }
   
   
   public int getTotalRecord(Map map) {
      System.out.println("들어옴");
      return bbsTemplate.selectOne("BBSGetTotalRecord",map);
   }


   @Override
   public BBSDTO selectOne(Map map) {
      
      return bbsTemplate.selectOne("BBSSelectOne",map);
   }

   @Override
   public int delete(Map map) {
   
      return 0;
   }

   @Override
   public int update(Map map) {
      
      return bbsTemplate.update("BBSUpdate",map);
   
   }

   
   //내 문의함
   @Override
   public List<Map> myselectList(Map map) {
       System.out.println("DAO들어옴");
      return bbsTemplate.selectList("BBSMySelectList",map);
   }
   
   
   //===========모임 게시판 목록==============

	@Override
	public int insertMeetingBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.insert("insertMeetingBBS", map);
	}

	@Override
	public BBSDTO selectMbbsByMeetingNoForThisBBSImg(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("selectMbbsByMeetingNoForThisBBSImg", map);
	}

	@Override
	public List<Map> selectAllMeetingBBS() {
		// TODO Auto-generated method stub
		return bbsTemplate.selectList("selectAllMeetingBBS");
	}

	@Override
	public String countThisBBSLike(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("countThisBBSLike", map);
	}

	@Override
	public String likeCheck(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("likeCheck", map);
	}

	@Override
	public String countComment(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("countComment", map);
	}

	@Override
	public List<Map> comment(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectList("comment", map);
	}

	@Override
	public int insertLikeBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.insert("insertLikeBBS", map);
	}

	@Override
	public int deleteLikeBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.delete("deleteLikeBBS", map);
	}

	@Override
	public int commentInsert(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.insert("commentInsert", map);
	}

	@Override
	public int commentUpdate(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.update("commentUpdate", map);
	}

	@Override
	public int commentDelete(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.delete("commentDelete", map);
	}

	@Override
	public List<Map> selectAllFreeBBS() {
		// TODO Auto-generated method stub
		return bbsTemplate.selectList("selectAllFreeBBS");
	}

	@Override
	public int insertFreeBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.insert("insertFreeBBS", map);
	}

	@Override
	public BBSDTO selectFreeBBSNOForThisBBSImg(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("selectFreeBBSNOForThisBBSImg", map);
	}

	@Override
	public Map selectOneMeeetingBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("selectOneMeeetingBBS", map);
	}

	@Override
	public int updateThisBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.update("updateThisBBS", map);
	}

	@Override
	public int deleteThisBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.delete("deleteThisBBS", map);
	}

	@Override
	public Map selectOneFreeBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("selectOneFreeBBS", map);
	}

	@Override
	public Map selectThisBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectOne("selectThisBBS", map);
	}

	@Override
	public List<Map> selectThisMeetingBBS(Map map) {
		// TODO Auto-generated method stub
		return bbsTemplate.selectList("selectThisMeetingBBS", map);
	}


}
