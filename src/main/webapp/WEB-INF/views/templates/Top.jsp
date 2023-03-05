<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	
<div class="container-fluid pt-2">
<c:if test="${empty userId }" var="isNotKakaoLogin">
	<sec:authorize access="isAuthenticated()">
		<div class="offset-8 col-md-4">

			<a href="<c:url value="/logout.do"/>">
				<span style="font-size: 0.5em;color: #F2B705" class="border-bottom">로그아웃 </span>
			</a>&nbsp;&nbsp; 
			<a href="<c:url value='/Mypage.do'/>">
				<span style="font-size: 0.5em;color: #F2B705" class="border-bottom">마이페이지</span>
			</a>
		</div>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<div class="offset-8 col-md-4">

			<a href="<c:url value='/login.do'/>">
				<span style="font-size: 0.5em;color: #F2B705" class="border-bottom">로그인</span>
				<img src='<c:url value="/resources/images/naver.png"/>' style="height:15px; width:14px; margin-bottom:-4px;">
			</a> 
			<a href="<c:url value='/Join.do'/>">
				<span style="font-size: 0.5em;color: #F2B705" class="border-bottom">회원가입</span>
			</a>


		</div>
	</sec:authorize>
	</c:if>
	<c:if test="${not isNotKakaoLogin }">
	<div class="offset-8 col-md-4">

			<a href="<c:url value="/kakaoLogout"/>"><span
				style="font-size: 0.5em;color: #F2B705" class="border-bottom">로그아웃 </span></a>
				&nbsp;&nbsp; <a href="<c:url value='#'/>"><span
				style="font-size: 0.5em;color: #F2B705" class="border-bottom">카카오톡 로그인</span></a>
		</div>
	</c:if>



</div>

<div class="container-fluid px-md-12  pt-2 ">

	<div class="row justify-content-between">
		<div class="col-md-8 order-md-last">
			<div class="row">
				<div class="col-md-6 text-center">
					<a class="navbar-brand" href="<c:url value="/"/>"><h1>드  림</h1><span></span>
						<small>꿈꾸는사람들</small></a>

				</div>
				<div class="d-md-flex justify-content-end mb-md-0 mb-3"></div>
			</div>
		</div>
		<!-- 로고 가운데 배치용 -->
		<div class="col-md-4 d-flex"></div>
	</div>
</div>

<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container-fluid">
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="fa fa-bars"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav m-auto">
				<li class="nav-item" id="townMenu" onclick="changeMenu('town')">
					<a href="<c:url value='/town/AllOfMeeting.do'/>" class="nav-link">동네 둘러보기</a>
				</li>
	            <li class="nav-item" id="bbsMenu" onclick="changeMenu('bbs')">
	            	<a href="<c:url value='/bbs/MeetingBBS.do'/>" class="nav-link">게시글</a>
	            </li>
				<li class="nav-item" id="performanceMenu" onclick="changeMenu('performance')">
					<a href="<c:url value='/performance/PerformanceList.do'/>" class="nav-link">공연</a>
				</li>
				<li class="nav-item" id="fundingMenu" onclick="changeMenu('funding')">
					<a href="<c:url value='/FundingList.do'/>" class="nav-link">펀딩</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- END nav -->


<script>

//카테고리를 클릭했을 때 menu에 따라 카테고리의 스타일을 변경합니다
function changeMenu(menu){
    console.log(menu);
    var townMenu = document.getElementById('townMenu');
    var bbsMenu = document.getElementById('bbsMenu');
    var performanceMenu = document.getElementById('performanceMenu');
    var fundingMenu = document.getElementById('funding');
    
    if (menu == 'town') {
    
        townMenu.className = 'nav-item active';
        bbsMenu.className = 'nav-item';
        performanceMenu.className = 'nav-item';
        fundingMenu.className = 'nav-item';
        
    } else if (menu == 'bbs') { 
    
        townMenu.className = 'nav-item';
        bbsMenu.className = 'nav-item active';
        performanceMenu.className = 'nav-item';
        fundingMenu.className = 'nav-item';
        
    } else if (menu == 'performance') {
     
        townMenu.className = 'nav-item';
        bbsMenu.className = 'nav-item';
        performanceMenu.className = 'nav-item active';
        fundingMenu.className = 'nav-item';
        
    } else if (menu == 'funding') {
     
        townMenu.className = 'nav-item';
        bbsMenu.className = 'nav-item';
        performanceMenu.className = 'nav-item';
        fundingMenu.className = 'nav-item active';
 
    }
}

</script>