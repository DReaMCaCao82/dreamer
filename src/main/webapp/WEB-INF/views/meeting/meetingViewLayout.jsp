<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>모이까</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>">
    
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
    
    <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
    
    <!--
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/th
    emes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	-->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<%-- 	<script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script> --%>
  </head>
<body>

	<!-- top -->
	<tiles:insertAttribute name="top"/>
	
	<!-- title -->
	<tiles:insertAttribute name="meetingtop"/>
	
	<!-- content -->
	<tiles:insertAttribute name="content"/>
	
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
	
</body>
</html>