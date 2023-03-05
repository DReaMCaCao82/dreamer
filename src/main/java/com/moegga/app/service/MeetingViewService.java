package com.moegga.app.service;

import java.util.List;
import java.util.Map;



public interface MeetingViewService {
   
   

   
   //=====모임 상세보기=======
   List<Map> meetingView();

   List<Map> meetingRole();

   List<Map> meetingMemberCount();
   
   //=====모임 상세보기 끝=======
}