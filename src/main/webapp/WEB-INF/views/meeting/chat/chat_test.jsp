<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>채팅방 테스트</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="<c:url value="/resources/css/animate.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/magnific-popup.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/css/flaticon.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">

<!--
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	-->

</head>
<body>


	<div id="center-text">
		<h2>ChatBox UI</h2>
		<p>Message send and scroll to bottom enabled</p>
	</div>
	<div id="body">

		<div id="chat-circle" class="btn btn-raised">
			<div id="chat-overlay"></div>
			<i class="material-icons">speaker_phone</i>
		</div>

		<div class="chat-box">
			<div class="chat-box-header">
				ChatBot <span class="chat-box-toggle"><i
					class="material-icons">close</i></span>
			</div>
			<div class="chat-box-body">
				<div class="chat-box-overlay"></div>
				<div class="chat-logs"></div>
				<!--chat-log -->
			</div>
			<div class="chat-input">
				<form>
					<input type="text" id="chat-input" placeholder="Send a message..." />
					<button type="submit" class="chat-submit" id="chat-submit">
						<i class="material-icons">send</i>
					</button>
				</form>
			</div>
		</div>

	</div>


	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
	<script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<c:url value="/resources/js/google-map.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

	
	<script>
	$(function() {
		  var INDEX = 0; 
		  $("#chat-submit").click(function(e) {
		    e.preventDefault();
		    var msg = $("#chat-input").val(); 
		    if(msg.trim() == ''){
		      return false;
		    }
		    generate_message(msg, 'self');
		    var buttons = [
		        {
		          name: 'Existing User',
		          value: 'existing'
		        },
		        {
		          name: 'New User',
		          value: 'new'
		        }
		      ];
		    setTimeout(function() {      
		      generate_message(msg, 'user');  
		    }, 1000)
		    
		  })
		  
		  function generate_message(msg, type) {
		    INDEX++;
		    var str="";
		    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
		    str += "          <span class=\"msg-avatar\">";
		    str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
		    str += "          <\/span>";
		    str += "          <div class=\"cm-msg-text\">";
		    str += msg;
		    str += "          <\/div>";
		    str += "        <\/div>";
		    $(".chat-logs").append(str);
		    $("#cm-msg-"+INDEX).hide().fadeIn(300);
		    if(type == 'self'){
		     $("#chat-input").val(''); 
		    }    
		    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);    
		  }  
		  
		  function generate_button_message(msg, buttons){    
		    /* Buttons should be object array 
		      [
		        {
		          name: 'Existing User',
		          value: 'existing'
		        },
		        {
		          name: 'New User',
		          value: 'new'
		        }
		      ]
		    */
		    INDEX++;
		    var btn_obj = buttons.map(function(button) {
		       return  "              <li class=\"button\"><a href=\"javascript:;\" class=\"btn btn-primary chat-btn\" chat-value=\""+button.value+"\">"+button.name+"<\/a><\/li>";
		    }).join('');
		    var str="";
		    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg user\">";
		    str += "          <span class=\"msg-avatar\">";
		    str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
		    str += "          <\/span>";
		    str += "          <div class=\"cm-msg-text\">";
		    str += msg;
		    str += "          <\/div>";
		    str += "          <div class=\"cm-msg-button\">";
		    str += "            <ul>";   
		    str += btn_obj;
		    str += "            <\/ul>";
		    str += "          <\/div>";
		    str += "        <\/div>";
		    $(".chat-logs").append(str);
		    $("#cm-msg-"+INDEX).hide().fadeIn(300);   
		    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);
		    $("#chat-input").attr("disabled", true);
		  }
		  
		  $(document).delegate(".chat-btn", "click", function() {
		    var value = $(this).attr("chat-value");
		    var name = $(this).html();
		    $("#chat-input").attr("disabled", false);
		    generate_message(name, 'self');
		  })
		  
		  $("#chat-circle").click(function() {    
		    $("#chat-circle").toggle('scale');
		    $(".chat-box").toggle('scale');
		  })
		  
		  $(".chat-box-toggle").click(function() {
		    $("#chat-circle").toggle('scale');
		    $(".chat-box").toggle('scale');
		  })
		  
		})
	
	
	
	</script>


</body>
</html>