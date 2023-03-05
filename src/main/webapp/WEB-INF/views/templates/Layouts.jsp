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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>

</head>
<body>
	<!--top부분 시작-->
	<tiles:insertAttribute name="top"/>
	<!--top부분 끝 -->
	
	<!--body부분 시작-->
	<tiles:insertAttribute name="body"/>
	
	<!--플로팅 메뉴 부분 시작-->
		
	<!--============== 플러팅 메뉴 버튼 ==================-->
	<div id="menu-circle" class="btn btn-raised">
		<div id="chat-overlay"></div>
		<i class="material-icons" style="margin-left: -9px">MENU</i>
	</div>
	<!--============== 플러팅 메뉴 버튼 끝 ==============-->

	<!--============== 세부 메뉴 ==============-->
	<div class="menu" style="height: 220px;">
		<div class="menu-body" style="height: 220px;">
			<span class="menu-exit pull-right"> <i class="material-icons">X</i>
			</span>
			<div id="write-circle" class="btn btn-raised"
				style="margin-bottom: 90px">
				<div id="chat-overlay"></div>
				<i class="material-icons" style="margin-left: -10px;">Write</i>
			</div>
<!-- 			<div id="chatbot-circle" class="btn btn-raised"
				style="margin-bottom: 90px">
				<div id="chat-overlay"></div>
				<a href="#" style="color: #FF7A5C"><i class="material-icons"
					style="margin-left: -15px;">Chatbot</i></a>
			</div> -->
			<div id="chat-circle" class="btn btn-raised">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.username" var="user_id" />
				</sec:authorize>
				<input type="hidden" id="user_id" value="${user_id}">
				<div id="chat-overlay"></div>
				<i class="material-icons" style="margin-left: -15px;">Chatting</i>
			</div>
		</div>
	</div>
	<!--============== 세부 메뉴 끝 ==============-->


	<!--=============== 챗봇 UI ===============-->
<!-- 	<!--=============== 챗봇 채팅방 ===============
	<div class="chatbot-box">
		<div class="chatbot-box-header">
			<span class="title"> <i class="material-icons">Chatbot</i>
			</span> <span class="chatbot-box-exit"> <i class="material-icons">X&nbsp;</i>
			</span>
		</div>
		<div class="chatbot-box-body">
			<div class="chat-box-overlay"></div>
			<form id="frm">
				<div class="chatbot-logs">
					<div id='cb-msg-0"' class='chat-msg user'>
						<span class='msg-avatar'></span>
				        <div class='text'>
				           <div class='cm-msg-text' style="font-size: 0.8em">안녕하세요 모이까 챗봇입니다😄<br/> 무엇을 도와드릴까요?
								<br/>1.공연장 대관을 원하신다면😏
								<br/>👉공연장/공연장 검색해줘
								<br/>2.동네 구경을 원하신다면🙆
								<br/>👉동네/동네구경
								<br/>3.펀딩중인 모임들이 궁금하시다면🤗
								<br/>👉펀딩	
								
								
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="chatbot-input"
			style="background-color: white; width: auto; heigh: auto">
			<div id='chatbot_message_input'
				style="width: 20.5em; height: auto; background-color: white; border: none; vertical-align: middle">
				<input type="text" id="query"
					style="overflow: auto; width: 280px; height: 80px; border: none;"
					autofocus="autofocus" />id="chatbot_message"
				<button class="chatbot-submit" id="chatbot-submit" style="margin-bottom: 20px">
					<i class="material-icons" style="width: 5em">send</i>
				</button>
			</div>
		</div>
	</div>
	
	=============== 챗봇 채팅방 END =============== -->


	<!--=============== 채팅 UI ===============-->
	<!--=============== 채팅 목록 ===============-->

	<div class="chat-list-box">
		<div class="chat-list-box-header">
			<span class="title"> <i class="material-icons">Chatting
					List</i>
			</span> <span class="chat-list-box-exit pull-right"> <i
				class="material-icons">X</i>
			</span>
		</div>
		<div class="chat-list-box-body">
			<div class="chat-box-overlay"></div>
			<div class="chat-background" id="list">
				<div class="item" id="chatting_list"></div>
			</div>
		</div>
	</div>
	<!--=============== 채팅 목록 끝 ===============-->


	<!--=============== 채팅방 ===============-->
	<div class="chat-box">
		<div class="chat-box-header">
			<span class="title"> <i class="material-icons"
				id="chatting_name"></i>
			</span> <span class="chat-box-exit"> <i class="material-icons">X&nbsp;</i>
			</span>
		</div>
		<div class="chat-box-body">
			<div class="chat-box-overlay"></div>
			<form id="frm">
				<div class="chat-logs"></div>
			</form>

		</div>
		<div class="chat-input"
			style="background-color: white; width: auto; heigh: auto">
			<div id='message_input'
				style="width: 20.5em; height: auto; background-color: white; border: none; vertical-align: middle">
				<div class="filebox preview-image"
					style="float: left; width: 350px; height: 150px; background-color: white">
					<input type="text" id="message"
						style="overflow: auto; width: 280px; height: 80px; border: none;"
						autofocus="autofocus" />
					<button class="chat-submit" id="chat-submit">
						<i class="material-icons" style="width: 5em">send</i>
					</button>

					<form id="uploadForm" action="<c:url value='/FileMessageSend.do'/>" enctype="multipart/form-data" method="post">


						<!-- <input type="hidden" class="upload-name" value="파일 선택" disabled="disabled" /> -->
						<!-- <label for="ex_file">업로드</label> -->
						<label for="input-file" id="input-file-label"> <img
							src="/resources/images/file_icon_circle.png"
							style="width: 26px; height: 26dpx;" />
						</label> <input type="file" id="input-file" class="upload-hidden" />

					</form>
				</div>
			</div>
		</div>
	</div>

	<section>
		<div class="modal fade" id="imageModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Download</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- <img class="imageDown_modal" src='resources/images/image_1.jpg'> -->
					</div>
					<div class="modal-footers">
						<hr style="margin-top: -5px" />
						<button type="button" class="btn btn-primary" id="download_image"
							style="float: right; margin: 0 20px 20px 0">다운로드</button>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!--=============== 채팅방 ===============-->
	
	<!-- <script src="<c:url value='resources/js/chatbot.js'/>"></script> -->
	<script>
		$(document).ready(function() {
		
			var loading ='<div id="cb-msg-loading" class="chat-msg user">'
			loading +='<span class="msg-avatar"></span>'
			loading +='<div class="text">'
			loading +='<div class="cm-msg-text">'
			loading +='<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="resources/images/loading.gif" style="margin-top: 7px "/>'
			loading +='</div></div></div>'
			
		
			

/* 		 $(window).ajaxStart(function(){
			 $('.chatbot-logs').append(loading)
			 $('.chatbot-logs').stop().animate({scrollTop : $('.chatbot-logs')[0].scrollHeight}, 0);
		    
		 }).ajaxStop(function(){
		
			 $('#cb-msg-loading').remove()
		
		 }); */
		

			$(function() {
				
/* 				function getSession(data) {
					var session=data.session
					console.log('챗봇 클릭'); //chatbot-box
					console.log(session);
					$("#chatbot-circle").toggle('scale');
					$(".chatbot-box").toggle('scale');
					$("#query").on('keypress',function(e) {

					    if (e.keyCode == 13){
					        //e.preventDefault();
					        var query = $(this).val()
					        console.log(query)
					        if (!query) {//텍스트를 입력하지 않는 경우
					          return
					        }

					        INDEX++;
					        var str = "";

					        str += "<div id='cb-msg-"+INDEX_cb+"' class='chat-msg "+"self"+"'>";

					        str += "          <span class='msg-avatar'>";
					        str += "          </span>";
					        str += "		  <div class='text'>";
					        str += "          <div class='cm-msg-text'>";
					        //str += ${query};
					        str += query;
					        str += "          </div>";

					        str += "        </div>";

					        $(".chatbot-logs").append(str);

					        $("#cb-msg-" + INDEX).hide().fadeIn(300);

					        $("#query").val('');

					        $(".chatbot-logs").stop().animate({scrollTop : $(".chatbot-logs")[0].scrollHeight}, 0);


					        //chat-container에 사용자의 응답 추가
					        chatbot_sendMessage(query,session)
					    }
					});
					
				};
				//=========== 챗봇 구현 부분 =========================================				
				$("#chatbot-circle").click(function() {
					
					 $.ajax(
							 {url:"http://localhost:8282/",
							data:{'message': '인덱스'},
							type:'post',
							global:false,
							dataType :'json',
							success:getSession});
				});
				
				var INDEX_cb = 0;
				function chatbot_sendMessage(message,session) {
					console.log('입력메시지:',message)
					console.log('세션',session)
			        $.ajax({url:"http://localhost:8282/message",data:{'message': message,'session':session},type:'post',success:receiveResponse})

			        //flask서버로부터 응답을 받으면 receiveResponse콜백함수가 호출됨
			        function receiveResponse(data) {//data는 flask로부터 받은 응답 {'message':'다이얼로그플로우가 보내준값'}
			          //chat-container에 bot의 응답 추가

			          // ######## UI 적용 해보는 중 ###########
			            INDEX++;
			            var str = "";

			            str += "<div id='cb-msg-"+INDEX_cb+"' class='chat-msg "+"user"+"'>";

			            str += "          <span class='msg-avatar'>";
			            str += "          </span>";
			            str += "		  <div class='text'>";
			            str += "          <div class='cm-msg-text'>";
			            //str += ${data.message};
			            str += data.message;
			            str += "          </div>";


			            str += "        </div>";

			            $(".chatbot-logs").append(str);

			            $("#cb-msg-" + INDEX).hide().fadeIn(300);

			            $(".chatbot-logs").stop().animate({scrollTop : $(".chatbot-logs")[0].scrollHeight}, 0);
			        }
			    }
				
				$(".chatbot-box-exit").click(function() {
					$("#chatbot-circle").toggle('scale');
					$(".chatbot-box").toggle('scale');
				}); */

				
				/*=========== 채팅 구현 부분 =========================================*/
				/* 전송버튼 클릭 시 */
				var INDEX = 0;
				var wsocket;
				var nickname;
				var id;
				var cno;
				var msg_name;
				var profileimg;
				var msg_id;

				var fileTarget = $('.filebox .upload-hidden');
				const file = {name : 'undefined'};
				
				$("#chat-submit").click(function(e) {
					e.preventDefault();
					var msg = $("#message").val();
					$.ajax({
						url : "<c:url value='/ChattingMsgInsert.do' />",
						//dataType:"json",
						async : false,
						data : {'message' : msg,'cno' : cno},
						success : function() {
							sendMessage();
							// 기존 메시지 클리어
							$('#message').empty();
							// 포커스 주기
							$('#message').focus();
						}
					});

					var buttons = [ {
						name : 'Existing User',
						value : 'existing'
					}, {
						name : 'New User',
						value : 'new'
					} ];
				});
				
				
				/* 메시지 입력 후 전송 버튼 클릭 아닌 엔터키 처리 */
				$('#message').on('keypress',function(e) {
					console.log("e.keyCode : %s,e.which : %s",e.keyCode,e.which);
					var keyValue = e.keyCode ? e.keyCode: e.which;
					if (keyValue == 13) {//엔터입력
						//sendMessage();
						e.preventDefault();
						var msg = $("#message").val();
						$.ajax({
							url : "<c:url value='/ChattingMsgInsert.do' />",
							//dataType:"json",
							async : false,
							data : {'message' : msg,'cno' : cno},
							success : function() {
								sendMessage();
								// 기존 메시지 클리어
								$('#message').empty();
								// 포커스 주기
								$('#message').focus();
							}
						});

						var buttons = [
							{name : 'Existing User',value : 'existing'},
							{name : 'New User',value : 'new'} ];
					}
				});

				
				function generate_button_message(msg, buttons) {

					INDEX++;
					var btn_obj = buttons.map(function(button) {
						return "              <li class=\"button\"><a href=\"javascript:;\" class=\"btn btn-primary chat-btn\" chat-value=\""+button.value+"\">"
								+ button.name
								+ "<\/a><\/li>";
					}).join('');

					var str = "";
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
					$("#cm-msg-" + INDEX).hide().fadeIn(300);
					$(".chat-logs").stop().animate({scrollTop : $(".chat-logs")[0].scrollHeight}, 1000);
					$("#message").attr("disabled", true);
				}

				/* toggle) 플러팅 메뉴 버튼 -> 세부 메뉴 */
				$("#menu-circle").click(function() {
					if($('#user_id').val() != '') {
						$("#menu-circle").toggle('scale');
						$(".menu").toggle('scale');						
					} else {
						alert('로그인이 필요한 서비스입니다');
					}
				});

				/* toggle) 세부메뉴 X -> 플러팅 메뉴 버튼 */
				$(".menu-exit").click(function() {
					$("#menu-circle").toggle('scale');
					$(".menu").toggle('scale');
				});

				/* 채팅 목록 출력 */
				$("#chat-circle").click(function() {
					var id = $("#user_id").val();
					$.ajax({
						url : "<c:url value='/ChattingList.do'/>",
						dataType : 'json',
						success : function(data) {
							successAjaxChatList(data);
							$(".chat-list-box").toggle('scale');
							$("#chat-circle").toggle('scale');
						},
						error : function(error) {
							console.log("상태코드:",request.status);
							console.log("서버로부터 받은 HTML:",request.responseText);
							console.log("에러:",error);
						}
					});
				});

				/*채팅방 -> 채팅목록*/
				$(".chat-box-exit").click(function() {
					$.ajax({
						url : "<c:url value='/ChattingList.do'/>",
						dataType : 'json',
						success : function(data) {
							//console.log('채팅 목록 출력: ', data);
							successAjaxChatList(data);
							$(".chat-list-box").toggle('scale');
							$(".chat-box").toggle('scale');
						},
						error : function(error) {
							console.log("상태코드:",request.status);
							console.log("서버로부터 받은 HTML:",request.responseText);
							console.log("에러:",error);
						}
					});
				});

				var chat_name;
				var chatting_msg_func = 0;
				var successAjaxChatList = function(data) {
					//console.log('서버로부터 받은 데이터:', JSON.stringify(data));
					var chattingList = "";

					$.each(data,function(index, element) {
						var nowDate = new Date();
						var date = new Date(element["postdate"]);
						var year = date.getFullYear();
						var month = date.getMonth();
						var day = date.getDate();
						var hours = date.getHours();
						var minutes = date.getMinutes();
						var ampm = (hours>12) ? "오후" : "오전";
						
						var postdate = "";
						
						hours = hours % 12;
						hours = hours ? hours : 12;
						minutes = minutes < 10 ? '0'+minutes : minutes;
						
						if(year == nowDate.getFullYear() && month == nowDate.getMonth() && day == nowDate.getDate()) {
							postdate = ampm + " " + hours + ":" + minutes;
						}
						else if(year == nowDate.getYear() && month == nowDate.getMonth() && day < nowDate.getDate()) {
							postdate = "어제";
						}
						else if(year < nowDate.getYear() || month < nowDate.getMonth() || day < nowDate.getDate()) {
							postdate = year + "-" + ('0'+(month+1)).slice(-2) + "-" + day;
						}
						
						if (element['isChatMember'] == 0) {
							chattingList += "<div class='chat-group-no'>";
							chattingList += "<span>현재 가입한 모입이 없거나 그룹 채팅방이 없습니다</span>";
							chattingList += "</div>";
						} else {
							chattingList += "<div class='chat-group'>";
							chattingList += "<span class='msg-avatar'>";
							//chattingList += "<img class='profile-img' src='resources/images/person1.jpg'>";
							var url = "<c:url value='images/"+element["id"]+"/"+element["meetingname"]+"/"+element["bannerImg"]+"'/>"
							chattingList += "<img class='profile-img' src='"+url+"'>";
							chattingList += "</span>";
							chattingList += "<div class='chat-content'>";
							chattingList += "<span id='chat-name'>" + element["chattingName"] + "</span>";
							if (element["currentContent"] != null) {
								if (element["division"] == 1) {
									chattingList += "<span class='pull-right' id='send-msg-time'>" + postdate + "</span><br/>";
									chattingList += "<span id='current-msg'>" + element["currentContent"] + "</span>";
								} else {
									chattingList += "<span class='pull-right' id='send-msg-time'>" + postdate + "</span><br/>";
									chattingList += "<span id='current-msg'>사진을 보냈습니다</span>";
								}

							}
							chattingList += "</div></div>";
						}
						id = element["id"];
						cno = element["chatno"];
						nickname = element["nickname"];
						chat_name = element["chattingName"];
					});

					$("#chatting_list").html(chattingList);

					/*채팅목록 -> 채팅방*/
					$(".chat-group").click(function() {

						$('#message').focus();
						if (chatting_msg_func == 0) {
							chatting_msg();
						}

						$(".chat-logs").html("");
						$('#chatting_name').html("");
						$.ajax({
							url : "<c:url value='/ChattingMessageList.do'/>",
							data : {'cno' : cno},
							dataType : 'json',
							async : false,
							type : 'post',
							success : function(data) {
								$.each(data,function(index,element) {							
									msg_name = element['nickname'];
									profileimg = element['profileimg'];
									if (element["division"] == 1) {
										if (element["id"] == id) {
											msg_id = id;
											appendMessage(element["content"], 'self');
										} else {
											msg_id = element['id'];
											appendMessage(element["content"], 'user');
										}
									} else {
										if (element["id"] == id) {
											msg_id = element['id'];
											appendFile(element["content"], 'self');
										} else {
											msg_id = element['id'];
											appendFile(element["content"], 'user');
										}
									}
								});
							},
							error : function(error) {
								console.log("상태코드:",request.status);
								console.log("서버로부터 받은 HTML:",request.responseText);
								console.log("에러:",error);
							}
						});

						$('#chatting_name').append(chat_name);

						$(".chat-list-box").toggle('scale');
						$(".chat-box").toggle('scale');
					});
				}

				/* 채팅하는 부분 구현 */
				var chatting_msg = function() {
					chatting_msg_func = 1;
					//console.log('chatting_msg: 들어옴');
					wsocket = new WebSocket(
					"ws://" + location.host + "<c:url value='/chat-ws.do'/>");
					console.log('chatting_msg: /chat-ws.do');
					console.log('wsocket : ', wsocket);
					wsocket.onopen = open;

					wsocket.onclose = function() {
						//appendMessage('연결이 끊어졌어요');
						console.log(id + ' 연결이 끊어졌어요');
					}
					wsocket.addEventListener('message',
							receiveMessage);
					wsocket.onerror = function(e) {
						console.log('에러발생: ', e);
					}
				}

				/* <<< 함수정의 >>> */
				/* 서버에 연결되었을 때 호출되는 콜백함수 */
				var open = function() {
					//서버로 연결한 사람의 정보(닉네임) 전송
					//msg:kim가(이) 입장했어요
					//사용자가 입력한 닉네임 저장
					wsocket.send("'" + nickname + "'" + "님이 입장했어요");
					//appendMessage('연결되었어요');
					console.log(id + ' 연결되었어요');
				}

				
				/* 메시지를 DIV 태그에 뿌려주기 위한 함수 */
				var appendMessage = function(msg, type) {
					INDEX++;
					var str = "";

					str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
					if (type != null) {
						str += "          <span class=\"msg-avatar\">";
						if (type == 'user') {
							if(profileimg == null) {
								str += "        <img  class='profile-img' style='margin-top:10px' src='" + "<c:url value='/images/user.png'/>"+"' >";
							}
							else { 
								str += "        <img  class='profile-img' style='margin-top:10px' src='" + "<c:url value='/images/"+ msg_id +"/" + profileimg + "'/>"+"' >";
							}
							str += "		<span style='font-size:0.5em;margin-left:5px;margin-bottom:2px'>"
							
									+ msg_name + "</span>";
						}
						str += "          <\/span>";
						str += "		  <div class='text'>";
						str += "          <div class=\"cm-msg-text\">";
						str += msg;
						str += "          <\/div>";
					} else {
						str += "		  <div class='center'>";
						str += "		  <span style='font-size:0.8em'>"
								+ msg + "</span>";
						str += "		  </div>";
					}

					str += "        <\/div>";

					$(".chat-logs").append(str);

					$("#cm-msg-" + INDEX).hide().fadeIn(300);
					if (type == 'self') {
						$("#message").val('');
					}
					$(".chat-logs").stop().animate({scrollTop : $(".chat-logs")[0].scrollHeight}, 0);
				}

				/* 이미지를 DIV 태그에 뿌려주기 위한 함수 */
				var appendFile = function(filename, type) {
					INDEX++;
					var str = "";

					str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
					if (type != null) {
						str += "          <span class=\"msg-avatar\">";
						if (type == 'user') {
							if(profileimg == null) {
								str += "        <img  class='profile-img' style='margin-top:10px' src='" + "<c:url value='/images/user.png'/>"+"' >";
							}
							else { 
								str += "        <img  class='profile-img' style='margin-top:10px' src='" + "<c:url value='/images/"+ msg_id +"/" + profileimg + "'/>"+"' >";
							}
							str += "		<span style='font-size:0.5em;margin-left:5px;margin-bottom:2px'>" + msg_name + "</span>";
						}
						str += "          <\/span>";
						str += "		  <div class='text'>";
						str += "          <div class=\"cm-msg-text\">";
						str += "				<img class='msgImg' src='" + "<c:url value='/images/chat_no"+ cno + "/" + filename + "'/>" + "'/></div><div class='clearBoth'></div>";
						str += "          <\/div>";
					}
					str += "        <\/div>";

					$(".chat-logs").append(str);

					$("#cm-msg-" + INDEX).hide().fadeIn(300);

					if (type == 'self') {
						$("#message").val('');
					}
					$(".chat-logs").stop().animate({scrollTop : $(".chat-logs")[0].scrollHeight}, 0);

					/*========================== 이미지 다운로드 모달 ==========================*/

					$("#cm-msg-" + INDEX).click(function() {
						//$('.msgImg').click(function(){
						$(".modal-body").html("");
						var imgStr = "";
						var imgStr = "<img class='imageDown_modal' src='"
								+ "<c:url value='/images/chat_no"+ cno + "/" + filename + "'/>" + "'/>";
						$(".modal-body").append(imgStr);
						$("#imageModal").modal("show");
						$("#download_image").attr("onclick",
										"location.href='<c:url value='/FileUpDown/Download.do?cno=" + cno + "&filename=" + filename + "'/>'");
					});
				}

				/* 서버에서 메시지를 받을 때마다 호출되는 함수 */
				var receiveMessage = function(e) { // e = message 이벤트 객체
					var receiveData = e.data;

					if (receiveData.substring(0, 4) == 'msg:') {
						msg_name = receiveData.substring(4).split(':')[0];
						msg = receiveData.substring(4).split(':')[1].substring(0);
						appendMessage(msg, 'user');
					}

					else if (receiveData.substring(0, 4) == 'img:') {
						console.log('receiveData::',receiveData);
						var url = URL.createObjectURL(new Blob([ receiveData ]));

						msg_name = receiveData.substring(4).split(':')[0];
						filename = receiveData.substring(4).split(':')[1].substring(0);

						console.log("url: ", url);
						console.log("receiveData: ",receiveData);
						console.log("filename: ", filename);
						appendFile(filename, 'user');
					}
				}

				/* 서버로 메시지 전송하는 함수 */
				function sendMessage() {
					// 서버로 메시지 전송
					wsocket.send("msg:" + nickname + ':' + $('#message').val());
					// DIV(대화영역)에 메시지 출력
					appendMessage($('#message').val(), 'self');
					// 기존 메시지 클리어
					$('#message').empty();
					// 포커스 주기
					$('#message').focus();
				}

				function sendFile(url, filename) {
					// 서버로 메시지 전송
					wsocket.send("img:" + nickname + ':' + filename);
					// DIV(대화영역)에 메시지 출력
					appendFile(filename, 'self');
					// 기존 메시지 클리어
					$('#send_image').attr('src', '');
					// 포커스 주기
					$('#message').focus();

				}
				

				/* toggle) 채팅 목록 버튼 X -> 세부메뉴 */
				$(".chat-list-box-exit").click(function() {
					$(".chat-list-box").toggle('scale');
					$("#chat-circle").toggle('scale');
				});

				/* 이미지 전송 구현 */
				fileTarget.on('change', function() {
					file.name = $(this)[0].files[0].name;
					console.log('filename: ', file.name);
				});

				$(this).siblings('.upload-name').val(file.name);

				$("#chat-submit").click(function(e) {
					var form = $('#uploadForm');
					var formData = new FormData(form[0]);
					formData.append("file",jQuery('#input-file')[0].files[0]);

					console.log("formData",formData);
					
					$.ajax({
						url : "<c:url value='/FileMessageSend.do?cno=" + cno + "' />",
						type : 'POST',
						enctype : 'multipart/form-data',
						processData : false,
						contentType : false,
						data : formData,
						success : function(data) {
							console.log('성공: ',data);
							sendFile(data,file.name);
						},
						error : function(error) {
							console.log("상태코드:",request.status);
							console.log("서버로부터 받은 HTML:",request.responseText);
							console.log("에러:",error);
						}
					});
				});
				

				/* 이미지 보내기 전 미리보기 */
				var imgTarget = $('.preview-image .upload-hidden');
				imgTarget.on('change',function() {
					var parent = $(this).parent();
					parent.children('.upload-display').remove();
					if (window.FileReader) { //image 파일만 
						if (!$(this)[0].files[0].type.match(/image\//))
							return;
						var reader = new FileReader();
						var src;
						reader.onload = function(e) {
							src = e.target.result;
							parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" id="send_image" class="upload-thumb"></div></div>');
						}
						reader.readAsDataURL($(this)[0].files[0]);

					} else {
						$(this)[0].select();
						$(this)[0].blur();
						var imgSrc = document.selection.createRange().text;
						parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
						var img = $(this).siblings('.upload-display').find('img');
						img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
					}
				});
			});
		});
		
	</script>
	<!--플로팅 메뉴 부분 끝-->


	<!--body부분 끝 -->

	<!--footer부분 시작-->
	<tiles:insertAttribute name="footer" />
	<!--footer부분 끝 -->

</body>
</html>
