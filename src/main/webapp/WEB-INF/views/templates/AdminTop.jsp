<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
   <header class="topbar" data-navbarbg="skin6">
         <nav class="navbar top-navbar navbar-expand-md">
            <!-- 로고 -->
            <div class="navbar-header" data-logobg="skin6">
               <!-- 작은 화면용 -->
               <a class="nav-toggler waves-effect waves-light d-block d-md-none"
                  href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
               <div class="navbar-brand">
                  <!-- Logo icon -->
                  <a href="<c:url value='/Admin/Main.do'/>"> <b class="logo-icon"> <!-- Dark Logo icon -->
                        <img
                        src="<c:url value="/resources/assets/images/logo-icon.png"/>"
                        alt="homepage" class="dark-logo" /> <!-- Light Logo icon --> <img
                        src="<c:url value="/resources/assets/images/logo-icon.png"/>"
                        alt="homepage" class="light-logo" />
                  </b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
                        <!-- dark Logo text -->
                        <p class="dark-logo">AdminPage</p>
                  </span>
                  </a>
               </div>
               <!-- 작은 화면용 -->
               <a class="topbartoggler d-block d-md-none waves-effect waves-light"
                  href="javascript:void(0)" data-toggle="collapse"
                  data-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent" aria-expanded="false"
                  aria-label="Toggle navigation"><i class="ti-more"></i></a>
            </div>
            <!-- ============================================================== -->
            <!-- End Logo -->

            <!-- Topbar -->
            <div class="navbar-collapse collapse" id="navbarSupportedContent">
               <!-- ============================================================== -->
               <!-- toggle and nav items -->
               <!-- ============================================================== -->
               <ul class="navbar-nav float-right ml-auto mr-3 pr-1">
                  <!-- Notification -->
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle pl-md-3 "
                     href="javascript:void(0)" id="bell" role="button"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span><i data-feather="bell" class="svg-icon"></i></span> <span
                        class="badge badge-primary notify-no rounded-circle">5</span>
                  </a>
                     <div
                        class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
                        <ul class="list-style-none">
                           <li>
                              <div class="message-center notifications position-relative">
                                 <!-- Message -->
                                 <a href="javascript:void(0)"
                                    class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                    <div class="btn btn-danger rounded-circle btn-circle">
                                       <i data-feather="airplay" class="text-white"></i>
                                    </div>
                                    <div class="w-75 d-inline-block v-middle pl-2">
                                       <h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
                                       <span class="font-12 text-nowrap d-block text-muted">Just
                                          see the my new admin!</span> <span
                                          class="font-12 text-nowrap d-block text-muted">9:30
                                          AM</span>
                                    </div>
                                 </a>
                                 <!-- Message -->
                                 <a href="javascript:void(0)"
                                    class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                    <span
                                    class="btn btn-success text-white rounded-circle btn-circle"><i
                                       data-feather="calendar" class="text-white"></i></span>
                                    <div class="w-75 d-inline-block v-middle pl-2">
                                       <h6 class="message-title mb-0 mt-1">Event today</h6>
                                       <span
                                          class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                          a reminder that you have event</span> <span
                                          class="font-12 text-nowrap d-block text-muted">9:10
                                          AM</span>
                                    </div>
                                 </a>
                                 <!-- Message -->
                                 <a href="javascript:void(0)"
                                    class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                    <span class="btn btn-info rounded-circle btn-circle"><i
                                       data-feather="settings" class="text-white"></i></span>
                                    <div class="w-75 d-inline-block v-middle pl-2">
                                       <h6 class="message-title mb-0 mt-1">Settings</h6>
                                       <span
                                          class="font-12 text-nowrap d-block text-muted text-truncate">You
                                          can customize this template as you want</span> <span
                                          class="font-12 text-nowrap d-block text-muted">9:08
                                          AM</span>
                                    </div>
                                 </a>
                                 <!-- Message -->
                                 <a href="javascript:void(0)"
                                    class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                    <span class="btn btn-primary rounded-circle btn-circle"><i
                                       data-feather="box" class="text-white"></i></span>
                                    <div class="w-75 d-inline-block v-middle pl-2">
                                       <h6 class="message-title mb-0 mt-1">Pavan kumar</h6>
                                       <span class="font-12 text-nowrap d-block text-muted">Just
                                          see the my admin!</span> <span
                                          class="font-12 text-nowrap d-block text-muted">9:02
                                          AM</span>
                                    </div>
                                 </a>
                              </div>
                           </li>
                           <li>
	                           <a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);">
	                           <strong>Check all notifications</strong>
	                           <i class="fa fa-angle-right"></i>
	                           </a>
                           </li>
                        </ul>
                     </div></li>
                  <!-- End Notification -->
                  <!-- ============================================================== -->
                  <!-- create new -->
                  <!-- ============================================================== -->
                  <li class="nav-item dropdown">
                  	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                     role="button" data-toggle="dropdown" aria-haspopup="true"
                     aria-expanded="false"> 
                     <i data-feather="settings" class="svg-icon"></i>
                  </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                     </div></li>
               </ul>
               <!-- ============================================================== -->
               <!-- Right side toggle and nav items -->
               <!-- ============================================================== -->
               <ul class="navbar-nav float-right">
                  <!-- ============================================================== -->

                  <!-- User profile -->
                  <!-- ============================================================== -->
                  <li class="nav-item dropdown">
                  	<a class="nav-link dropdown-toggle" href="javascript:void(0)"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <img src="<c:url value="/resources/assets/images/users/1.jpg"/>"
                        	alt="user" class="rounded-circle" width="40" /> 
                        <span class="ml-2 d-none d-lg-inline-block">
                        	<span>Hello,</span>
                           <span class="text-dark">${name}Admin</span>
                           <i data-feather="chevron-down" class="svg-icon"></i>
                        </span>
                  	 </a>
                     <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                        <a class="dropdown-item" href="javascript:void(0)">
                        	<i data-feather="user" class="svg-icon mr-2 ml-1"></i> My Profile</a>
                        <a class="dropdown-item" href="javascript:void(0)">
                        	<i data-feather="credit-card" class="svg-icon mr-2 ml-1"></i> My
                           Balance</a> <a class="dropdown-item" href="javascript:void(0)"><i
                           data-feather="mail" class="svg-icon mr-2 ml-1"></i> Inbox</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)"><i
                           data-feather="settings" class="svg-icon mr-2 ml-1"></i> Account
                           Setting</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)"><i
                           data-feather="power" class="svg-icon mr-2 ml-1"></i> Logout</a>
                        <div class="dropdown-divider"></div>
                        <div class="pl-4 p-3">
                           <a href="javascript:void(0)" class="btn btn-sm btn-info">View
                              Profile</a>
                        </div>
                     </div></li>
                  <!-- ============================================================== -->
                  <!-- User profile and search -->
                  <!-- ============================================================== -->
               </ul>
            </div>
         </nav>
      </header>
      <!-- ============================================================== -->
      <!-- End Topbar header -->

      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <aside class="left-sidebar" data-sidebarbg="skin6">
         <!-- Sidebar scroll-->
         <div class="scroll-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
               <ul id="sidebarnav">
                  <li class="sidebar-item"><a class="sidebar-link sidebar-link"
                     href="<c:url value="/Admin/Main.do"/>" aria-expanded="false"><i
                        data-feather="home" class="feather-icon"></i><span
                        class="hide-menu">HOME</span></a></li>
                  <li class="list-divider"></li>

                  <li class="nav-small-cap"><span class="hide-menu">MENU</span></li>
                  <li class="sidebar-item"><a class="sidebar-link has-arrow"
                     href="javascript:void(0)" aria-expanded="false"><i
                        data-feather="file-text" class="feather-icon"></i><span
                        class="hide-menu"> 회원관리 </span></a>
                     <ul aria-expanded="false"
                        class="collapse  first-level base-level-line">
                        <li class="sidebar-item"><a href="<c:url value='/Admin/Member/Member.do'/>"
                           class="sidebar-link"><span class="hide-menu"> 회원 조회
                           </span></a></li>
                        <li class="sidebar-item"><a href="<c:url value='/Admin/Member/SuspendMember.do'/>"
                           class="sidebar-link"><span class="hide-menu"> 정지 회원
                                 조회 </span></a></li>
                        <!-- 
                        <li class="sidebar-item"><a href="form-checkbox-radio.html"
                           class="sidebar-link"><span class="hide-menu"> 휴면/탈퇴
                                 회원 조회 </span></a></li>   -->
                     </ul></li>
                  <li class="sidebar-item"><a class="sidebar-link has-arrow"
                     href="javascript:void(0)" aria-expanded="false"><i
                        data-feather="file-text" class="feather-icon"></i><span
                        class="hide-menu"> 모임관리 </span></a>
                     <ul aria-expanded="false"
                        class="collapse  first-level base-level-line">
                        <li class="sidebar-item"><a href="<c:url value='/Admin/Meeting/Meeting.do'/>"
                           class="sidebar-link"><span class="hide-menu"> 모임 조회
                           </span></a></li>
                        <li class="sidebar-item"><a href="<c:url value='/Admin/Meeting/SuspendMeeting.do'/>"
                           class="sidebar-link"><span class="hide-menu"> 정지
                                 모임 조회 </span></a></li>
                     </ul></li>
                  <li class="sidebar-item"><a class="sidebar-link has-arrow"
                     href="javascript:void(0)" aria-expanded="false"><i
                        data-feather="file-text" class="feather-icon"></i><span
                        class="hide-menu">신고 </span></a>
                     <ul aria-expanded="false"
                        class="collapse  first-level base-level-line">
                        <li class="sidebar-item"><a href="<c:url value="/Admin/Accusation/BBS.do"/>"
                           class="sidebar-link"><span class="hide-menu"> 신고 게시글
                                 관리 </span></a></li>
                        <li class="sidebar-item"><a href="<c:url value="/Admin/Accusation/Meeting.do"/>"
                           class="sidebar-link"><span class="hide-menu"> 신고 모임
                                 관리 </span></a></li>
                     </ul></li>
                  <li class="sidebar-item"><a class="sidebar-link sidebar-link"
                     href="<c:url value='/QuestionsAdminlist.do'/>" aria-expanded="false"><i
                        data-feather="sidebar" class="feather-icon"></i><span
                        class="hide-menu"> 문의 관리 </span></a></li>
                  <li class="sidebar-item"><a class="sidebar-link sidebar-link"
                     href="<c:url value="/Admin/Analysis.do"/>" aria-expanded="false"><i
                        data-feather="sidebar" class="feather-icon"></i><span
                        class="hide-menu">통계정보 상세보기 </span></a></li>
                     <li class="sidebar-item"><a class="sidebar-link has-arrow"
                     href="javascript:void(0)" aria-expanded="false"><i
                        data-feather="file-text" class="feather-icon"></i><span
                        class="hide-menu"> 펀딩관리 </span></a>
                     <ul aria-expanded="false"
                        class="collapse  first-level base-level-line">
                        <li class="sidebar-item"><a href="<c:url value='/FundingAdminlist.do'/>"
                           class="sidebar-link"><span class="hide-menu">승인 대기 목록
                           </span></a></li>
                        <li class="sidebar-item"><a href="<c:url value='/FundingAdminStartlist.do'/>"
                           class="sidebar-link"><span class="hide-menu"> 진행중인 펀딩
                                 모임 조회 </span></a></li>
                        <li class="sidebar-item"><a href="<c:url value='/FundingAdminStoplist.do'/>"
                           class="sidebar-link"><span class="hide-menu"> 정지된 펀딩
                                 모임 조회 </span></a></li>         
                     </ul></li>
                  <li class="sidebar-item"><a class="sidebar-link sidebar-link"
                     href="<c:url value='/Categorylist.do'/>" aria-expanded="false"><i
                        data-feather="sidebar" class="feather-icon"></i><span
                        class="hide-menu"> 카테고리 관리 </span></a></li>
                  <li class="sidebar-item"><a class="sidebar-link sidebar-link"
                     href="<c:url value="/Admin/Notice/List.do"/>" aria-expanded="false"><i
                        data-feather="sidebar" class="feather-icon"></i><span
                        class="hide-menu"> 공지사항 관리 </span></a></li>
                  <li class="list-divider"></li>
               </ul>
            </nav>
            <!-- End Sidebar navigation -->
         </div>
         <!-- End Sidebar scroll-->
      </aside>
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->