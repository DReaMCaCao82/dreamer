package com.moegga.app.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.moegga.app.service.AdminService;
import com.moegga.app.service.BBSDTO;
import com.moegga.app.service.BBSService;
import com.moegga.app.service.MeetingViewService;

@Service("meetingViewService")
public class MeetingViewServiceImpl implements MeetingViewService {
   
   @Resource(name="MeetingViewDAO")
   private MeetingViewDAO dao;

   
   //==============모임 게시판 목록================
   @Override
   public List<Map> meetingView() {
      
      return dao.meetingView();
   }
   
   @Override
   public List<Map> meetingRole() {
      
      return dao.meetingRole();
   }
   
   @Override
   public List<Map> meetingMemberCount() {
      
      return dao.meetingMemberCount();
   }
   
   
   
   //==============모임 게시판 목록 끝================
   
}