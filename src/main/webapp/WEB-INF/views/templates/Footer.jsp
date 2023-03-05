<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
h3 {
	margin-top: 10px
}

.foot {
	height: 400px;
}

.jumbotron {
	padding: 1rem 1rem;
	margin-bottom: 2rem;
	background-color: #e9ecef;
	border-radius: 0.3rem;
}

ul li {
	list-style-type: none;
	text-align: center;
	display: inline-block;
	margin-left: 20px;
	margin-top: 15px;
}

.mb-5, .my-5 {
	margin-bottom: 1rem !important;
}
</style>


<!-- =============================푸터====================================== -->
<footer class="ftco-footer">
	<!-- h3 class="text-secondary">MOEGGA</h3> -->
	<div class="container">
		<div class="row mb-5">
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2 logo">
						<a href="#">Connect</a>
					</h2>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4 ml-md-4">
					<h2 class="ftco-heading-2">Extra Links</h2>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4 ml-md-4">
					<h2 class="ftco-heading-2">Legal</h2>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						<a href="#">Company</a>
					</h2>
				</div>
			</div>
			<div class="col-sm-12 col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						<a data-toggle="modal" href="javascript:isLogin()">Have a Questions?</a>
					</h2>
					<!-- 문의하기 -->
					<div class="block-23 mb-3">
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


<!-- <script src="<c:url value="/resources/js/jquery.min.js"/>"></script> -->
<script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
<script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>

<!-- 구글지도API 사용 안함. 혹시 이 줄 살아나면 지워주시길. 꼭!
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
 -->



<script src="<c:url value="/resources/js/main.js"/>"></script>


<script>
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






<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

