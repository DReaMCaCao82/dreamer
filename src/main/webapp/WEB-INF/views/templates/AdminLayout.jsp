<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- title왼쪽의 아이콘 표시용 -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<c:url value="/resources/assets/images/favicon.png"/>">
<!-- Custom CSS -->
<link href="<c:url value="/resources/assets/extra-libs/c3/c3.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/libs/chartist/dist/chartist.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css"/>"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<c:url value="/resources/dist/css/style.min.css"/>"rel="stylesheet">
<script
	src="<c:url value="/resources/assets/libs/jquery/dist/jquery.min.js"/>"></script>
</head>
<body>

	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
	<!--top부분 시작-->
	<tiles:insertAttribute name="admintop"/>
	<!--top부분 끝 -->
	<!--body부분 시작-->
	<tiles:insertAttribute name="adminbody"/>
	<!--body부분 끝 -->
	</div>
	<!--footer부분 시작-->
	<tiles:insertAttribute name="adminfooter"/>
	<!--footer부분 끝 -->
</body>
</html>