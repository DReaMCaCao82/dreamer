<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인</title>
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

<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/style.css">

</head>
<body>

<!-- TOP -->
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


<!-- =========== 상단 메뉴 =========== -->
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
				<li class="nav-item"><a href="<c:url value='/town/AllOfMeeting.do'/>" class="nav-link">동네 둘러보기</a></li>
	            <li class="nav-item"><a href="<c:url value='/bbs/MeetingBBS.do'/>" class="nav-link">게시글</a></li>
				<li class="nav-item"><a href="<c:url value='/performance/PerformanceList.do'/>" class="nav-link">공연</a></li>
				<li class="nav-item"><a href="<c:url value='/FundingList.do'/>" class="nav-link">펀딩</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- =========== 상단 메뉴 END =========== -->


<!-- 로그인 페이지 -->
	<div class="container-fluid px-md-12  pt-5 ">
		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">
					<div class="col-md-7 pt-3">
						<div class="contact-wrap w-100 p-md-4 p-4">
							<form id="frm" class="contactForm">
								<div class="row">

									<c:if test="${empty pwd }" var="notNaver">
										<div class="offset-md-1 col-md-8" style="display: block;">
											<div class="form-group">
												<label class="label" for="id" style="font: bold;">아이디</label>
												<input type="text" class="form-control" name="id" id="id">
	
											</div>
										</div>
										<div class="offset-md-1 col-md-8">
											<div class="form-group">
												<label class="label" for="password">비밀번호</label> <input
													type="password" class="form-control" name="pwd" id="pwd">
	
											</div>
										</div>
										<div class="offset-md-1 col-md-8 pt-3">
											<div class="form-group">
												<input id="loginBtn" type="button" value="로그인"
													class="btn btn-primary btn-block">
											</div>
										</div>
										<div class="offset-md-1 col-md-8 pt-3">
											<span style="font-size: 0.8em">아직 회원이 아니신가요?</span> 
											<a href="<c:url value='/Join.do'/>" style="font-size: 0.8em">회원가입</a>
										</div>
										<div class="offset-md-1 col-md-8 pt-3">
											<div id="naver_id_login" style="float: left; margin-top: 1%">
												<span style="font-size: 0.8em">네이버ID로 로그인하기</span></br>
												<a href="${url}"><img src='<c:url value="/resources/images/naverLogin.png"/>' style="height:auto; width:100%;"></a>
											</div>
								
										</div>
									</c:if>
									
									<c:if test="${not notNaver }">
										<div class="offset-md-1 col-md-8" style="display: block;">
											<div class="form-group">
												<label class="label" for="id" style="font: bold;">반갑습니다</label>
												<p>" ${name } " 님</p>
												<label class="label" for="id" style="font: bold;">네이버 아이디로 로그인 하시겠어요?</label>
												<input type="hidden" class="form-control" name="id" id="id" value="${id }">
												<input type="hidden" class="form-control" name="pwd" id="pwd" value="${pwd }">
											</div>
										</div>
										<div class="offset-md-1 col-md-8 pt-3">
											<div class="form-group">
												<input id="loginBtn" type="button" value="로그인"
													class="btn btn-primary btn-block">
											</div>
										</div>
	
								   </c:if>

								</div>
							</form>
							
						</div>
					</div>

				</div>
			</div>
			<!-- 로고 가운데 배치용 -->
			<div class="col-md-4 d-flex"></div>
		</div>



	</div>

	
	
<!-- footer -->
	<footer class="ftco-footer">
	<!-- h3 class="text-secondary">MOEGGA</h3> -->
	<div class="container">
		<div class="row mb-5">
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2 logo">
						<a href="#">Connect</a>
					</h2>
					<p>Far far away, behind the word mountains, far from the
						countries.</p>
					<ul class="ftco-footer-social list-unstyled mt-2">
						<li class="ftco-animate"><a href="#"><span
								class="fa fa-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="fa fa-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="fa fa-instagram"></span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4 ml-md-4">
					<h2 class="ftco-heading-2">Extra Links</h2>
					<ul class="list-unstyled">
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Affiliate
								Program</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Business
								Services</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Education
								Services</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Gift
								Cards</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4 ml-md-4">
					<h2 class="ftco-heading-2">Legal</h2>
					<ul class="list-unstyled">
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Join
								us</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Blog</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Privacy
								&amp; Policy</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Term
								&amp; Conditions</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						<a href="#">Company</a>
					</h2>
					<ul class="list-unstyled">
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>About
								Us</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Blog</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Contact</a></li>
						<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>Careers</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						<a data-toggle="modal" href="javascript:isLogin()">Have a Questions?</a>
					</h2>
					<!-- 문의하기 -->
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon fa fa-map marker"></span><span
								class="text">203 Fake St. Mountain View, San Francisco,
									California, USA</span></li>
							<li><a href="#"><span class="icon fa fa-phone"></span><span
									class="text">+2 392 3929 210</span></a></li>
							<li><a href="#"><span
									class="icon fa fa-paper-plane pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid px-0 py-5 bg-black">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<p class="mb-0" style="color: rgba(255, 255, 255, .5);">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						한국 소프트웨어 인재 개발원 | This template is made with <i
							class="fa fa-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib.com</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>



<!-- ==========modal contact form ================= -->
<div class="modal fade" id="modalContactForm" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">문의사항</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<form class="form-horizontal" method="post" id="modalForm"
				action="javascript:report();">

				<input type="hidden" id="user_id" name="user_id" value="${user_id}" />
				<div class="modal-body mx-3">
					<div class="md-form mb-5">
						<i class="fas fa-user prefix grey-text"></i> <label
							data-error="wrong" data-success="right" for="form34">제목</label> <input
							type="text" id="form34" class="form-control validate"
							name="title">
					</div>
					<div class="md-form">
						<i class="fas fa-pencil prefix grey-text"></i> <label
							data-error="wrong" data-success="right" for="form8">문의내용</label>
						<textarea type="text" id="form8" class="md-textarea form-control"
							rows="7" name="contents"></textarea>
					</div>

				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="submit" class="btn btn-success">Send</button>
				</div>

			</form>
		</div>
	</div>
</div>


<!-- loader -->

<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>



<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
 -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.stellar.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.animateNumber.min.js"></script>
<script src="resources/js/scrollax.min.js"></script>
<script src="resources/js/main.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<script>
	//회원가입 버튼 클릭
	$('#loginBtn').click(function() {

		//form태그의 action속성 및 method속성 설정
		$('#frm').prop({
			action : '<c:url value="/loginProcess.do"/>',
			method : 'post'
		});
		//폼객체의 submit()함수로 서버로 전송
		$('#frm').submit();
	});
	
	
	//enter 눌러서 로그인하기
	$("#frm").keypress(function(e){
		if(e.keyCode==13){
			$('#loginBtn').click();
		}
	});
	
	

	

	//푸터 관련==============================================================
	function isLogin() {
		
		$.ajax({
			url : "<c:url value='IsLogin.do'/>",
			dataType : 'json',
			success : function(data) {
				if (data.isLogin == 'YES')//로그인 되었다면
					//목록페이지로 이동
					$('#modalContactForm').modal("show");
				else {//로그인 안되었다면
					alert("로그인 후 이용하세요");
					location.replace("<c:url value='/login.do'/>");

				}

			},
			error : function(e) {
				console.log(e);
			}

		});

	}///////////

	function report() {

		if (window.confirm("정말로 문의하시겠습니까?")) {
			$.ajax({
				url : "<c:url value="/Questions.do"/>",
				type : 'post',
				dataType : "text",
				data : $("#modalForm").serialize(),
				success : function(data) {
					alert(data);
					$('#modalContactForm').modal("hide");
				}
			});
		}
	}
</script>
</body>
</html>