package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.BBSDTO;
import com.moegga.app.service.BBSService;
import com.moegga.app.service.MeetingViewService;

@Repository("MeetingViewDAO")
public class MeetingViewDAO implements MeetingViewService{

   @Resource(name="template")
   private SqlSessionTemplate meetingViewTemplate;


   

   
   //===========모임 상세보기==============
   @Override
   public List<Map> meetingView() {
   
      return meetingViewTemplate.selectList("meetingView");
   }

   @Override
   public List<Map> meetingRole() {
      
      return meetingViewTemplate.selectList("meetingRole");
   }
   //===========모임 상세보기 끝==============

   @Override
   public List<Map> meetingMemberCount() {
      return meetingViewTemplate.selectList("meetingMemberCount");
      
   }
   
   

   
}