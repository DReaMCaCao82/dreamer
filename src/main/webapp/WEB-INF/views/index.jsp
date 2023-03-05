<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!-- =========== 메인 이미지 및 설명 부분 =========== -->
<section class="hero-wrap"
	style="background-image: url('resources/images/sky1.png');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-center">
			<div class="col-md-8 ftco-animate d-flex align-items-end">
				<div class="text w-100">
					<h1 class="mb-4" style="color: white;">꿈을 꾸는 사람들의 공간</h1>
					<p class="mb-4" style="color: white;">
					당신의 꿈을 펼칠 공간이 되어드릴게요.</br>
					혼자서 그저 꾸어만 왔던 당신의 소중한 꿈을 이곳에서 이뤄봐요!</br>
					현실이 될 거에요. 우리와 함께하는 이 곳에서라면!</p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-no-pt mt-5 mt-md-0">
	<div class="container">
		<div class="row">
			<div class="col-md-3 d-flex align-items-stretch ftco-animate">
				<div class="services-2 text-center">
					<div class="icon-wrap">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon_fantasy">
								<img
									src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik0yNTYsOTMuMjk3Yy0xNC4wMjEsMC0yNy41MTYsNC4yMTgtMzkuMDI1LDEyLjE5OGMtMy40MDIsMi4zNTktNC4yNjIsNy4wNS0xLjkyMSwxMC40NzgNCgkJCWMyLjM0MiwzLjQyOCw2Ljk5OCw0LjI5NCwxMC40LDEuOTM2YzkuMDA0LTYuMjQzLDE5LjU2Ni05LjU0MywzMC41NDYtOS41NDNjMjkuNzU0LDAsNTMuOTYsMjQuMzg4LDUzLjk2LDU0LjM2NQ0KCQkJYzAsMjkuOTc3LTI0LjIwNiw1NC4zNjYtNTMuOTYsNTQuMzY2Yy0yOS43NTQsMC01My45Ni0yNC4zODktNTMuOTYtNTQuMzY2YzAtOC44NDMsMi4wMzgtMTcuMjczLDYuMDU3LTI1LjA1NQ0KCQkJYzEuOTA2LTMuNjkyLDAuNDgyLTguMjQxLTMuMTgyLTEwLjE2MWMtMy42NjUtMS45MTktOC4xNzgtMC40ODYtMTAuMDg1LDMuMjA2Yy01LjA2Nyw5LjgxMi03Ljc0NiwyMC44ODEtNy43NDYsMzIuMDENCgkJCUMxODcuMDg1LDIwMS4wMTgsMjE4LDIzMi4xNjYsMjU2LDIzMi4xNjZzNjguOTE1LTMxLjE0OCw2OC45MTUtNjkuNDM1QzMyNC45MTUsMTI0LjQ0NSwyOTQsOTMuMjk3LDI1Niw5My4yOTd6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik01MTEuNDI2LDUwMS41NzFsLTczLjgwNC0xNzguNjY1Yy0xLjE2LTIuODA5LTMuODgzLTQuNjM5LTYuOTAzLTQuNjM5aC03My41NDcNCgkJCWMxNC4zMDUtMTkuNDk4LDI2LjIxMi0zOC45MTksMzUuNTExLTU3Ljk4OGMxNi40OC0zMy43OTQsMjQuODM1LTY2LjYxMywyNC44MzUtOTcuNTQ3QzQxNy41MTcsNzMuMDAxLDM0NS4wNjEsMCwyNTYsMA0KCQkJUzk0LjQ4Myw3My4wMDEsOTQuNDgzLDE2Mi43MzFjMCwzMC45MzQsOC4zNTUsNjMuNzU0LDI0LjgzNSw5Ny41NDdjOS4yOTgsMTkuMDY5LDIxLjIwNSwzOC40OTEsMzUuNTExLDU3Ljk4OEg4MS4yODINCgkJCWMtMy4wMiwwLTUuNzQ0LDEuODMxLTYuOTAzLDQuNjM5TDI0LjA4Nyw0NDQuNjUxYy0xLjU4NywzLjg0MiwwLjIxNyw4LjI1Miw0LjAzLDkuODVjMC45NCwwLjM5NCwxLjkxMiwwLjU4MSwyLjg3LDAuNTgxDQoJCQljMi45MywwLDUuNzExLTEuNzQ2LDYuOTA2LTQuNjQxbDcuMTc2LTE3LjM3Mmg1MC45MDZsLTI2LjM4LDYzLjg2MkgxOC42OWw3LjY0Ny0xOC41MTNjMS41ODctMy44NDItMC4yMTctOC4yNTItNC4wMy05Ljg1DQoJCQljLTMuODE1LTEuNjAxLTguMTkxLDAuMjE5LTkuNzc3LDQuMDZMMC41NzUsNTAxLjU3MWMtMC45NjEsMi4zMjUtMC43MDUsNC45ODEsMC42ODMsNy4wNzVjMS4zODYsMi4wOTUsMy43MiwzLjM1NCw2LjIyLDMuMzU0DQoJCQloNDk3LjA0NGMyLjQ5OSwwLDQuODM0LTEuMjU5LDYuMjIxLTMuMzU0QzUxMi4xMyw1MDYuNTUyLDUxMi4zODcsNTAzLjg5Niw1MTEuNDI2LDUwMS41NzF6IE0xMDkuNDM5LDE2Mi43MzENCgkJCWMwLTgxLjQyMiw2NS43NDctMTQ3LjY2MywxNDYuNTYxLTE0Ny42NjNTNDAyLjU2MSw4MS4zMSw0MDIuNTYxLDE2Mi43MzFjMCwzNC4xNDMtMTEuNzc1LDg4LjcwMy02Ni4yNDUsMTU4LjIzMQ0KCQkJYy0wLjA1NSwwLjA2NS0wLjEwNCwwLjEzNC0wLjE1NiwwLjIwMWMtMi43ODIsMy41NDctNS42NzIsNy4xMzItOC42ODEsMTAuNzU3Yy0yOS45MzIsMzYuMDYyLTYwLjIyMiw2Mi4zOTUtNzEuNDgsNzEuNzUxDQoJCQljLTExLjIyNS05LjMyNC00MS4zNzItMzUuNTI1LTcxLjI4My03MS41MThjLTMuMDg0LTMuNzExLTYuMDQyLTcuMzgtOC44ODktMTEuMDFjLTAuMDQ2LTAuMDU4LTAuMDg5LTAuMTE4LTAuMTM3LTAuMTc1DQoJCQlDMTIxLjIyMiwyNTEuNDQ1LDEwOS40MzksMTk2Ljg4NywxMDkuNDM5LDE2Mi43MzF6IE04Ni4yNjksMzMzLjMzNWg1MC45MDdsLTE4LjU2OCw0NC45NDhINjcuNzAyTDg2LjI2OSwzMzMuMzM1eg0KCQkJIE0xMjkuOTk3LDQ5Ni45MzJsNDYuNzQxLTExMy4xNDhsMTMzLjAxNCwxMTMuMTQ4SDEyOS45OTd6IE0zMzIuOTM1LDQ5Ni45MzJMMzMyLjkzNSw0OTYuOTMybC0xNTQuMzUyLTEzMS4zDQoJCQljLTEuODIyLTEuNTUxLTQuMjctMi4xMzItNi41ODQtMS41NjZjLTIuMzE2LDAuNTY1LTQuMjI4LDIuMjEtNS4xNDMsNC40MjdsLTUzLjA1NywxMjguNDM4SDg1Ljc5NWwyOC4yOTYtNjguNTAyDQoJCQljMC45NjEtMi4zMjUsMC43MDUtNC45OC0wLjY4My03LjA3NWMtMS4zODYtMi4wOTUtMy43MjEtMy4zNTQtNi4yMjEtMy4zNTRINTEuMjk2bDEwLjE4Mi0yNC42NWg2Mi4xMTgNCgkJCWMzLjAyLDAsNS43NDQtMS44MzEsNi45MDMtNC42MzlsMjIuODc2LTU1LjM3N2gxMi45NzhjMi4yNTMsMi44Myw0LjU0Myw1LjY2MSw2Ljg5NCw4LjQ5MQ0KCQkJYzM4LjU4NSw0Ni40Myw3Ni41NzgsNzYuMjM5LDc4LjE3Nyw3Ny40ODZjMS4zNDgsMS4wNTEsMi45NjIsMS41NzUsNC41NzYsMS41NzVzMy4yMjktMC41MjUsNC41NzYtMS41NzUNCgkJCWMwLjg3OS0wLjY4NSwxMi43NTctMTAuMDA5LDI5LjY3My0yNS45Nmg4NC42ODFjNC4xMywwLDcuNDc4LTMuMzczLDcuNDc4LTcuNTM0cy0zLjM0OC03LjUzNC03LjQ3OC03LjUzNGgtNjkuMjY5DQoJCQljMTAuMzY4LTEwLjUwMywyMS43LTIyLjc0OSwzMy4wOTMtMzYuNDU3YzIuMzUxLTIuODMsNC42NDItNS42Niw2Ljg5NC04LjQ5MWg4MC4wODNsMTguNTY3LDQ0Ljk0OGgtMzkuNDU3DQoJCQljLTQuMTMsMC03LjQ3OCwzLjM3My03LjQ3OCw3LjUzNHMzLjM0Nyw3LjUzNCw3LjQ3OCw3LjUzNGg0NS42ODFsMTAuMTgyLDI0LjY1aC0xNTQuMDdjLTMuMTIxLDAtNS45MTMsMS45NTItNy4wMDYsNC44OTgNCgkJCWMtMS4wOTEsMi45NDYtMC4yNTMsNi4yNjUsMi4xMDQsOC4zMjZsNzUuMTMzLDY1LjcwN0gzMzIuOTM1eiBNMzk5LjY4MSw0OTYuOTMybC03My4wMjQtNjMuODYySDQ2Ni45M2wyNi4zODEsNjMuODYySDM5OS42ODF6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo="
									style="width: 70px; height: 70px; margin: 30px 0 0 0" />
							</span>
						</div>
					</div>
					<h2>
						<a href="#">주변에서 모임 찾기</a>
					</h2>
					<p>자신이 설정한 동네의 주변의 관심 모임에 가입하거나 사람들과 모임을 만들 수 있어요</p>
				</div>
			</div>
			<div class="col-md-3 d-flex align-items-stretch ftco-animate">
				<div class="services-2 text-center">
					<div class="icon-wrap">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-history">
								<img
									src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBpZD0ib3V0bGluZSIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIGhlaWdodD0iNTEyIj48cGF0aCBkPSJNNDQ4LDQ5NmEyNC4wMjc1LDI0LjAyNzUsMCwwLDAsMjQtMjRWNDBhMjQuMDI3NSwyNC4wMjc1LDAsMCwwLTI0LTI0SDY0QTI0LjAyNzUsMjQuMDI3NSwwLDAsMCw0MCw0MFY0NzJhMjQuMDI3NSwyNC4wMjc1LDAsMCwwLDI0LDI0Wk02NCwzMkg0NDhhOC4wMDkxNyw4LjAwOTE3LDAsMCwxLDgsOFY2NEg1NlY0MEE4LjAwOTE3LDguMDA5MTcsMCwwLDEsNjQsMzJaTTU2LDQ3MlY4MEg0NTZWNDcyYTguMDA5MTcsOC4wMDkxNywwLDAsMS04LDhINjRBOC4wMDkxNyw4LjAwOTE3LDAsMCwxLDU2LDQ3MloiLz48Y2lyY2xlIGN4PSI4MCIgY3k9IjQ4IiByPSI4Ii8+PGNpcmNsZSBjeD0iMTA0IiBjeT0iNDgiIHI9IjgiLz48Y2lyY2xlIGN4PSIxMjgiIGN5PSI0OCIgcj0iOCIvPjxwYXRoIGQ9Ik05NiwzMTJINDE2YTguMDAwMzksOC4wMDAzOSwwLDAsMCw4LThWMTIwYTguMDAwMzksOC4wMDAzOSwwLDAsMC04LThIOTZhOC4wMDAzOSw4LjAwMDM5LDAsMCwwLTgsOFYzMDRBOC4wMDAzOSw4LjAwMDM5LDAsMCwwLDk2LDMxMlptMTQ0LTg0LjMwNTE4YTMxLjg3ODQyLDMxLjg3ODQyLDAsMCwwLDIzLjU4MzUsMy4zODk2NUExMS45OTI0OCwxMS45OTI0OCwwLDAsMSwyNDAsMjI4Wk0yNTYsMjE2YTE2LjAxODMzLDE2LjAxODMzLDAsMCwxLTE2LTE2di00LjY4NjUyTDI1MS4zMTM0OCwxODRIMjcydjE2QTE2LjAxODMzLDE2LjAxODMzLDAsMCwxLDI1NiwyMTZabTIzLjQ3ODUyLTU2Ljg0NDczTDI3NS4wNTU5MSwxNjhIMjQ4YTguMDAyMzUsOC4wMDIzNSwwLDAsMC01LjY1NzIzLDIuMzQyNzdMMjQwLDE3Mi42ODU1NVYxNjhhMTYuMDE4MzMsMTYuMDE4MzMsMCwwLDEsMTYtMTZoMTkuMDU1NjZhNC45NDUsNC45NDUsMCwwLDEsNC40MjI4Niw3LjE1NTI3Wk0yNTIsMjU2YTI4LjAzMTQ2LDI4LjAzMTQ2LDAsMCwwLDI4LTI4di00aDI1LjQ0ODI0YTMyLjA3MTI3LDMyLjA3MTI3LDAsMCwxLDMwLjg3MywyMy41ODAwOGw1LjQyODIyLDE5LjkwNEwzMjAsMjc2LjE4NDA4VjI1NkgzMDR2NDBIMjExLjgxNTkybDExLjYxMTgxLTI5LjAyOTMtMTQuODU1NDYtNS45NDE0LTYuNjA5ODcsMTYuNTI0OS0zMS41ODY5MS0xMC41Mjg4MSw1LjMwMzIyLTE5LjQ0NTMxQTMyLjA3MTI3LDMyLjA3MTI3LDAsMCwxLDIwNi41NTE3NiwyMjRIMjI0djRBMjguMDMxNDYsMjguMDMxNDYsMCwwLDAsMjUyLDI1NlptNjgsMzcuNDE2LDI1Ljk4NjgyLTEwLjM5NDc4TDM0OS41MjYzNywyOTZIMzIwWk0xNjYuMTU4OTQsMjgyLjQ4NjMzbDI5Ljg1MDM0LDkuOTUwMTlMMTk0LjU4NCwyOTZIMTYyLjQ3MzYzWk0xMDQsMTI4SDQwOFYyOTZIMzY2LjEwOTg2bC0xNC4zNTMtNTIuNjI4OTFBNDguMTA1MjEsNDguMTA1MjEsMCwwLDAsMzA1LjQ0ODI0LDIwOEgyODYuOTg3M0EzMS45NTI3NSwzMS45NTI3NSwwLDAsMCwyODgsMjAwVjE3Ny44ODg2N2w1Ljc5LTExLjU3OTFBMjAuOTQ1MTcsMjAuOTQ1MTcsMCwwLDAsMjc1LjA1NTY2LDEzNkgyNTZhMzIuMDM2NjcsMzIuMDM2NjcsMCwwLDAtMzIsMzJ2MzJhMzEuOTUyNzUsMzEuOTUyNzUsMCwwLDAsMS4wMTI3LDhIMjA2LjU1MTc2YTQ4LjEwNTIxLDQ4LjEwNTIxLDAsMCwwLTQ2LjMwODYsMzUuMzcxMDlMMTQ1Ljg5MDE0LDI5NkgxMDRaIi8+PHBhdGggZD0iTTEyMi4zNDI3NywzOTcuNjU3MjNhOC4wMDE4MSw4LjAwMTgxLDAsMCwwLDExLjMxNDQ2LDBsMjcuMDI5MjktMjcuMDI5M0EyNC45NzM3NywyNC45NzM3NywwLDAsMCwxMjgsMzMzLjAyMzQ0YTI0Ljk3MzM4LDI0Ljk3MzM4LDAsMCwwLTMyLjY4NjUyLDM3LjYwNDQ5Wk0xMTIuOTcwNywzNDRhOC45MTA4LDguOTEwOCwwLDAsMSw2LjM0Mjc4LDIuNjI3OTNsMy4wMjkyOSwzLjAyOTNhOC4wMDMsOC4wMDMsMCwwLDAsMTEuMzE0NDYsMGwzLjAyOTI5LTMuMDI5M2E4Ljk3LDguOTcsMCwxLDEsMTIuNjg1NTUsMTIuNjg1NTVMMTI4LDM4MC42ODY1MmwtMjEuMzcyMDctMjEuMzczQTguOTcsOC45NywwLDAsMSwxMTIuOTcwNywzNDRaIi8+PGNpcmNsZSBjeD0iMTg0IiBjeT0iMzc2IiByPSI4Ii8+PGNpcmNsZSBjeD0iMjA4IiBjeT0iMzc2IiByPSI4Ii8+PGNpcmNsZSBjeD0iMjMyIiBjeT0iMzc2IiByPSI4Ii8+PHBhdGggZD0iTTEyOCw0MTZhMjQsMjQsMCwxLDAsMjQsMjRBMjQuMDI3NSwyNC4wMjc1LDAsMCwwLDEyOCw0MTZabTAsMzJhOCw4LDAsMSwxLDgtOEE4LjAwOTE3LDguMDA5MTcsMCwwLDEsMTI4LDQ0OFoiLz48cmVjdCB4PSIxNzYiIHk9IjQzMiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ii8+PHJlY3QgeD0iMjA4IiB5PSI0MzIiIHdpZHRoPSI4MCIgaGVpZ2h0PSIxNiIvPjwvc3ZnPgo="
									style="width: 70px; height: 70px; margin: 30px 0 0 0" />
							</span>
						</div>
					</div>
					<h2>
						<a href="#">우리의 이야기 공유</a>
					</h2>
					<p>모임의 다양한 활동들과 소중한 일상을 게시글로 작성해 다른 사람들과 공유하고 응원해요</p>
				</div>
			</div>
			<div class="col-md-3 d-flex align-items-stretch ftco-animate">
				<div class="services-2 text-center">
					<div class="icon-wrap">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-heart"> <img
								src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTkyLjUgNDAyaC00NmMtNC4xNDIgMC03LjUgMy4zNTgtNy41IDcuNXMzLjM1OCA3LjUgNy41IDcuNWg0NmM0LjE0MiAwIDcuNS0zLjM1OCA3LjUtNy41cy0zLjM1OC03LjUtNy41LTcuNXoiLz48cGF0aCBkPSJtMjE2LjUgNDAyaC00NmMtNC4xNDIgMC03LjUgMy4zNTgtNy41IDcuNXMzLjM1OCA3LjUgNy41IDcuNWg0NmM0LjE0MiAwIDcuNS0zLjM1OCA3LjUtNy41cy0zLjM1OC03LjUtNy41LTcuNXoiLz48cGF0aCBkPSJtMzQwLjUgNDAyaC00NmMtNC4xNDMgMC03LjUgMy4zNTgtNy41IDcuNXMzLjM1NyA3LjUgNy41IDcuNWg0NmM0LjE0MyAwIDcuNS0zLjM1OCA3LjUtNy41cy0zLjM1Ny03LjUtNy41LTcuNXoiLz48cGF0aCBkPSJtNDY0LjUgNDAyaC00NmMtNC4xNDMgMC03LjUgMy4zNTgtNy41IDcuNXMzLjM1NyA3LjUgNy41IDcuNWg0NmM0LjE0MyAwIDcuNS0zLjM1OCA3LjUtNy41cy0zLjM1Ny03LjUtNy41LTcuNXoiLz48cGF0aCBkPSJtNDgyIDUyaDEyLjVjOS42NDkgMCAxNy41LTcuODUxIDE3LjUtMTcuNXYtMTdjMC05LjY0OS03Ljg1MS0xNy41LTE3LjUtMTcuNWgtNDc3Yy05LjY0OSAwLTE3LjUgNy44NTEtMTcuNSAxNy41djE3YzAgOS42NDkgNy44NTEgMTcuNSAxNy41IDE3LjVoMTIuNXYyNjkuMDQ4Yy0xMS41MjggMy4yNzQtMjAgMTMuODg5LTIwIDI2LjQ1MnYyMC44OTdjLTYuMjU5IDguMDQ3LTEwIDE4LjE0My0xMCAyOS4xMDN2MTA3YzAgNC4xNDIgMy4zNTggNy41IDcuNSA3LjVoMTI0LjI1IDEyNC4yNSAxMjQuMjUgMTI0LjI1YzQuMTQzIDAgNy41LTMuMzU4IDcuNS03LjV2LTEwN2MwLTEwLjk2LTMuNzQxLTIxLjA1Ni0xMC0yOS4xMDN2LTIwLjg5N2MwLTEyLjU2My04LjQ3Mi0yMy4xNzgtMjAtMjYuNDUyem0tNzIuODY2IDI2OGMxLjMzNC0zOC4wNzcgMTIuODE4LTc0Ljg2NSAzMy40MzItMTA3aDI0LjQzNHYxMDd6bTU3Ljg2Ni0xMjJoLTI0LjkxOGMtMzEuMTkyLTM4LjkzMS01MS4wMzktODUuNTU2LTU3LjQ0OC0xMzUuMDc5bC0xLjQxNC0xMC45MjFoODMuNzh6bS0zMzguMjItMTQ2LTEuNDEzIDEwLjkyYy0yLjU1MiAxOS43MTgtNy4yODYgMzkuMTkxLTE0LjA3IDU3Ljg3OC0xLjQxNCAzLjg5NC41OTcgOC4xOTUgNC40OTEgOS42MDkuODQ1LjMwNyAxLjcwOC40NTIgMi41NTkuNDUyIDMuMDY2IDAgNS45NDQtMS44OTQgNy4wNS00Ljk0MyA3LjE1OC0xOS43MTggMTIuMTUzLTQwLjI2NSAxNC44NDYtNjEuMDcxbDEuNjYyLTEyLjg0NWgxNTMuOTM4YzQuMTQzIDAgNy41LTMuMzU4IDcuNS03LjVzLTMuMzU3LTcuNS03LjUtNy41aC0yODAuMzQzYy0xLjM3OCAwLTIuNS0xLjEyMi0yLjUtMi41di0xN2MwLTEuMzc4IDEuMTIyLTIuNSAyLjUtMi41aDQ3N2MxLjM3OSAwIDIuNSAxLjEyMiAyLjUgMi41djE3YzAgMS4zNzgtMS4xMjEgMi41LTIuNSAyLjVoLTE2MS42MmMtNC4xNDMgMC03LjUgMy4zNTgtNy41IDcuNXMzLjM1NyA3LjUgNy41IDcuNWgzNS4yMTVsMS42NjMgMTIuODQ2YzYuNjg2IDUxLjY1OCAyNy4yMjQgMTAwLjMzNiA1OS40ODkgMTQxLjEyOC0yMS43MzUgMzQuMzAyLTMzLjc5NCA3My40OTEtMzUuMTIgMTE0LjAyNWgtNDEuMTI3di0yLjVjMC0xNS4xNjQtMTIuMzM3LTI3LjUtMjcuNS0yNy41aC01LjV2LTg3LjM5M2wyMy4xOTYgMjMuMTk2YzEuNDY1IDEuNDY0IDMuMzg1IDIuMTk3IDUuMzA0IDIuMTk3czMuODM5LS43MzIgNS4zMDQtMi4xOTdjMi45MjktMi45MjkgMi45MjktNy42NzggMC0xMC42MDZsLTY4LjE5Ny02OC4xOTZoLjg5M2MxMi40MDYgMCAyMi41LTEwLjA5MyAyMi41LTIyLjVzLTEwLjA5NC0yMi41LTIyLjUtMjIuNWgtMzAuMjNjLTQuOTkxLTQuMDYtMTEuMzUtNi41LTE4LjI3LTYuNS0xNS45OTEgMC0yOSAxMy4wMDktMjkgMjlzMTMuMDA5IDI5IDI5IDI5YzYuOTIgMCAxMy4yOC0yLjQ0IDE4LjI3LTYuNWg4LjEyM2w0MC42MDcgNDAuNjA3djEwMi4zOTNoLTUuNWMtMTUuMTYzIDAtMjcuNSAxMi4zMzYtMjcuNSAyNy41djIuNWgtMTguNzcxbC04LjQzLTc3LjU1NmM3LjU3NC0xLjkyNCAxMy4yMDEtOC43OCAxMy4yMDEtMTYuOTQ0di0xMGMwLTkuNjQ5LTcuODUxLTE3LjUtMTcuNS0xNy41aC0xNS4zODljLTQuMTQyIDAtNy41IDMuMzU4LTcuNSA3LjVzMy4zNTggNy41IDcuNSA3LjVoMTUuMzg5YzEuMzc4IDAgMi41IDEuMTIyIDIuNSAyLjV2MTBjMCAxLjM3OC0xLjEyMiAyLjUtMi41IDIuNWgtNC4wMzFjLS4wMDcgMC0uMDE1IDAtLjAyMiAwaC01OC44OTdjLS4wMDQgMC0uMDA4IDAtLjAxMiAwaC00LjAzOGMtMS4zNzggMC0yLjUtMS4xMjItMi41LTIuNXYtMTBjMC0xLjM3OCAxLjEyMi0yLjUgMi41LTIuNWgxNi41NzRjNC4xNDIgMCA3LjUtMy4zNTggNy41LTcuNXMtMy4zNTgtNy41LTcuNS03LjVoLTE2LjU3NGMtOS42NDkgMC0xNy41IDcuODUxLTE3LjUgMTcuNXYxMGMwIDguMTY0IDUuNjI3IDE1LjAyIDEzLjIwMSAxNi45NDRsLTguNDMgNzcuNTU2aC00Mi44OThjLTEuMzI2LTQwLjUzNC0xMy4zODUtNzkuNzI0LTM1LjEyMS0xMTQuMDI2IDExLjU0NC0xNC42IDIxLjY4NC0zMC4zNTUgMzAuMTgzLTQ2LjkwNSAxLjg5Mi0zLjY4NS40MzktOC4yMDYtMy4yNDYtMTAuMDk4cy04LjIwNi0uNDM4LTEwLjA5OCAzLjI0NmMtOC4zMTYgMTYuMTk1LTE4LjMxIDMxLjU3MS0yOS42OTUgNDUuNzg0aC0yNC44OTZ2LTE0Ni4wMDF6bTE5Ni43MiAyNTNjNi44OTMgMCAxMi41IDUuNjA3IDEyLjUgMTIuNXYyLjVoLTUxdi0yLjVjMC02Ljg5MyA1LjYwNy0xMi41IDEyLjUtMTIuNXptLTczLjUtMTgwLjVjMCA3LjcyLTYuMjggMTQtMTQgMTRzLTE0LTYuMjgtMTQtMTQgNi4yOC0xNCAxNC0xNCAxNCA2LjI4IDE0IDE0em0xNC4wMTEtNy41aDIwLjQ4OWM0LjEzNiAwIDcuNSAzLjM2NCA3LjUgNy41cy0zLjM2NCA3LjUtNy41IDcuNWgtMjAuNDg5Yy42NDItMi4zOTQuOTg5LTQuOTA3Ljk4OS03LjVzLS4zNDctNS4xMDYtLjk4OS03LjV6bS0zNi4yNCAxMjYgMy4zNyAzMWgtNTIuMjgxbDMuMzctMzF6bS01MC41NDIgNDZoNTUuNTQybDMuMzcgMzFoLTYyLjI4MXptLTEzNC4yMjktNzZoMjQuNDM1YzIwLjYxNCAzMi4xMzUgMzIuMDk3IDY4LjkyMyAzMy40MzEgMTA3aC01Ny44NjZ6bS0zMCAxODQuNWMwLTE3LjkyIDE0LjU4LTMyLjUgMzIuNS0zMi41aDQ0LjI1YzE3LjkyIDAgMzIuNSAxNC41OCAzMi41IDMyLjV2OTkuNWgtMTA5LjI1em0xMjQuMjUgMGMwLTE3LjkyIDE0LjU4LTMyLjUgMzIuNS0zMi41aDQ0LjI1YzE3LjkyIDAgMzIuNSAxNC41OCAzMi41IDMyLjV2OTkuNWgtMTA5LjI1em0zNTcuNzUgOTkuNWgtMTA5LjI1di0yNi44NzhjMC00LjE0Mi0zLjM1Ny03LjUtNy41LTcuNXMtNy41IDMuMzU4LTcuNSA3LjV2MjYuODc4aC0xMDkuMjV2LTk5LjVjMC0xNy45MiAxNC41NzktMzIuNSAzMi41LTMyLjVoNDQuMjVjMTcuOTIxIDAgMzIuNSAxNC41OCAzMi41IDMyLjV2MzcuNTg1YzAgNC4xNDIgMy4zNTcgNy41IDcuNSA3LjVzNy41LTMuMzU4IDcuNS03LjV2LTM3LjU4NWMwLTE3LjkyIDE0LjU3OS0zMi41IDMyLjUtMzIuNWg0NC4yNWMxNy45MjEgMCAzMi41IDE0LjU4IDMyLjUgMzIuNXptLTEwLTE0OS41djguMTc5Yy02LjcwMS0zLjYyLTE0LjM2NC01LjY3OS0yMi41LTUuNjc5aC00NC4yNWMtMTYuNzgyIDAtMzEuNTQ4IDguNzU2LTQwIDIxLjkzMi04LjQ1Mi0xMy4xNzYtMjMuMjE4LTIxLjkzMi00MC0yMS45MzJoLTQ0LjI1Yy0xNi43ODIgMC0zMS41NDggOC43NTYtNDAgMjEuOTMyLTguNDUyLTEzLjE3Ni0yMy4yMTgtMjEuOTMyLTQwLTIxLjkzMmgtNDQuMjVjLTE2Ljc4MiAwLTMxLjU0OCA4Ljc1Ni00MCAyMS45MzItOC40NTItMTMuMTc2LTIzLjIxOC0yMS45MzItNDAtMjEuOTMyaC00NC4yNWMtOC4xMzYgMC0xNS43OTkgMi4wNTktMjIuNSA1LjY3OXYtOC4xNzljMC02Ljg5MyA1LjYwNy0xMi41IDEyLjUtMTIuNWg0MzdjNi44OTMgMCAxMi41IDUuNjA3IDEyLjUgMTIuNXoiLz48L2c+PC9zdmc+"
								style="width: 70px; height: 70px; margin: 35px 0 0 0" />
							</span>
						</div>
					</div>
					<h2>
						<a href="#">꿈의 실현</a>
					</h2>
					<p>모임을 통해 진행한 프로젝트를 공연이나 전시회, 라이브 방송 등을 통해 사람들에게 보여주세요</p>
				</div>
			</div>
			<div class="col-md-3 d-flex align-items-stretch ftco-animate">
				<div class="services-2 text-center">
					<div class="icon-wrap">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-model">
							<img
								src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik00MjIuNTAzLDI3MC42MTNjLTQuMTE1LDAtNy40NTEsMy4zMzYtNy40NTEsNy40NTFjMCw1LjIxNy00LjI0NCw5LjQ2MS05LjQ2MSw5LjQ2MWMtNS4yMTYsMC05LjQ2MS00LjI0NC05LjQ2MS05LjQ2MQ0KCQkJYzAtNC4xMTYtMy4zMzYtNy40NTEtNy40NTEtNy40NTFzLTcuNDUxLDMuMzM2LTcuNDUxLDcuNDUxYzAsMTMuNDM0LDEwLjkzLDI0LjM2MywyNC4zNjMsMjQuMzYzDQoJCQljMTMuNDMzLDAsMjQuMzYzLTEwLjkzLDI0LjM2My0yNC4zNjNDNDI5Ljk1NCwyNzMuOTQ3LDQyNi42MTgsMjcwLjYxMyw0MjIuNTAzLDI3MC42MTN6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik00OTIuNDQ0LDI3MS44M2wtMjAuOTcyLTYuNzE4Yy0yLjY4Ni0wLjg2MS00LjgwMy0zLjAwNS01LjY2Mi01LjczNmMtNC40Mi0xNC4wNTMtMTEuMDktMjcuMjQ2LTE5LjgyNS0zOS4yMTQNCgkJCWMtMy45ODEtNS40NTUtOC40MDgtMTAuNjY0LTEzLjI0NC0xNS42MjNjMy4wOTQtMTMuNTczLDQuNzc2LTI4LjkzNCw0LjU1OC00Mi4yMDVjLTAuMzEyLTE4Ljk4NS00LjEwNi0zMC4xMi0xMS41OTgtMzQuMDQ0DQoJCQljLTQuMDM1LTIuMTE2LTE2LjMxNS04LjU0NC04Mi43ODIsMjEuODgyYy0xLjU3NCwwLjcyLTMuMDQ0LDEuNjA3LTQuNDA1LDIuNjIzYy00LjQ4MS0xLjIwNC05LjA2MS0yLjMxOC0xMy42NjktMy4zMTgNCgkJCWMtMC41NTUtMC4xMjEtMS4xMjctMC4yMjgtMS42ODYtMC4zNDZjNS4zODYtMTEuNzY2LDguNTMxLTI0LjU0NSw5LjEyMi0zNy43MzdjMC4xODQtNC4xMTItMi45OTktNy41OTQtNy4xMTEtNy43NzcNCgkJCWMtNC4xMDEtMC4yMDQtNy41OTQsMi45OTgtNy43NzcsNy4xMWMtMC45NzEsMjEuNjkxLTkuOTY5LDQyLjEtMjUuMzM1LDU3LjQ2N2MtOS4xODEsOS4xODEtMTkuOTMxLDE1Ljg1LTMxLjM4OCwyMC4wNQ0KCQkJYy0xOS44NjktMi43ODgtNDAuMTA3LTIuNzg4LTU5Ljk3NiwwYy0xMS40NTgtNC4yLTIyLjIwNy0xMC44NjktMzEuMzg4LTIwLjA1Yy0xNi4zOTQtMTYuMzk0LTI1LjQyMy0zOC4xOTEtMjUuNDIzLTYxLjM3Ng0KCQkJYzAtMjMuMTg2LDkuMDI5LTQ0Ljk4MiwyNS40MjMtNjEuMzc2YzE2LjM5NC0xNi4zOTUsMzguMTkyLTI1LjQyNCw2MS4zNzYtMjUuNDI0YzIzLjE4NCwwLDQ0Ljk4Miw5LjAyOSw2MS4zNzYsMjUuNDI0DQoJCQljNi41ODgsNi41ODgsMTIuMDMyLDE0LjEwNiwxNi4xODEsMjIuMzQzYzEuODUxLDMuNjc2LDYuMzMyLDUuMTU2LDEwLjAwNywzLjMwNGMzLjY3Ni0xLjg1LDUuMTU1LTYuMzMxLDMuMzA0LTEwLjAwNg0KCQkJYy00Ljg2My05LjY1OS0xMS4yNC0xOC40NjYtMTguOTUzLTI2LjE4Yy0xOS4yMDktMTkuMjA5LTQ0Ljc0OS0yOS43ODgtNzEuOTE0LTI5Ljc4OGMtMjcuMTY1LDAtNTIuNzA1LDEwLjU3OS03MS45MTQsMjkuNzg4DQoJCQljLTE5LjIwOSwxOS4yMS0yOS43ODgsNDQuNzQ5LTI5Ljc4OCw3MS45MTRzMTAuNTc5LDUyLjcwNSwyOS43ODgsNzEuOTE0YzUuNTQxLDUuNTQxLDExLjU2OSwxMC4zMDYsMTcuOTQ1LDE0LjI5OA0KCQkJYzAuMDAyLDAsMC4wMDQtMC4wMDEsMC4wMDYtMC4wMDFjLTQuNjMzLDEuMjA0LTkuMjMxLDIuNTU2LTEzLjc3OCw0LjA3NmMtMy45MDMsMS4zMDUtNi4wMDksNS41MjYtNC43MDQsOS40Mw0KCQkJYzEuMzA0LDMuOTAzLDUuNTI3LDYuMDA5LDkuNDI5LDQuNzA1YzQwLjYzNi0xMy41ODUsODUuMzk2LTEzLjU4NSwxMjYuMDMyLDBjMC43ODQsMC4yNjIsMS41OCwwLjM4NiwyLjM2MywwLjM4Ng0KCQkJYzMuMTE3LDAsNi4wMjMtMS45NzIsNy4wNjYtNS4wOTFjMS4zMDUtMy45MDMtMC44MDEtOC4xMjUtNC43MDQtOS40M2MtNC41NDctMS41Mi05LjE0NS0yLjg3My0xMy43NzgtNC4wNzYNCgkJCWMwLjAwMiwwLDAuMDA0LDAuMDAxLDAuMDA2LDAuMDAxYzYuMzc3LTMuOTkyLDEyLjQwNC04Ljc1NywxNy45NDUtMTQuMjk4YzQuOTAyLTQuOTAyLDkuMjI5LTEwLjI1NSwxMi45ODYtMTUuOTQ0DQoJCQljMi4wNTQsMC4zOTksNC4wOTMsMC44MTcsNi4xMDIsMS4yNTNjMi42NzYsMC41ODEsNS4zNCwxLjIwNSw3Ljk4LDEuODZjLTAuMDgzLDAuMzI0LTAuMTY4LDAuNjQ3LTAuMjM3LDAuOTc2DQoJCQljLTMuNjM0LDE3LjI0NS0zLjM5OCwzMi40OTcsMC43MDEsNDUuMzNjMy42ODQsMTEuNTM1LDEwLjMzMywyMC44OCwxOS43NiwyNy43NzdjMTEuMTExLDguMTI4LDI0LjUyNSwxMS42MzksMzYuNjc2LDExLjYzOQ0KCQkJYzkuMTQ1LDAsMTcuNTc2LTEuOTksMjMuNzY4LTUuNDk3YzcuMDA0LTMuOTY3LDEyLjg3Mi0xMi4zMjYsMTcuNTE3LTI0Ljg3NmMyLjE0NywyLjUwNiw0LjE4Miw1LjA3Myw2LjEsNy43MDENCgkJCWM3Ljc3NywxMC42NTQsMTMuNzE0LDIyLjM5NiwxNy42NDYsMzQuODk4YzIuMzA5LDcuMzQzLDguMDQxLDEzLjEyMSwxNS4zMzIsMTUuNDU4bDIwLjk3Miw2LjcxOA0KCQkJYzUuNTAzLDEuNzYzLDkuMiw2LjgyOCw5LjIsMTIuNjA2djM0Ljc3NWMwLDUuNzc4LTMuNjk3LDEwLjg0My05LjIsMTIuNjA2bC0zMy43ODksMTAuODIzDQoJCQljLTUuNDA2LDEuNzMzLTkuOTgxLDUuNDQ4LTEyLjg4MiwxMC40NjJjLTEzLjI3NSwyMi45NDItMzQuMTQ2LDQxLjkyNy02Mi4wMzcsNTYuNDI4Yy0zLjIyMiwxLjY3Ny01LjQ1NCw0LjY3Ni02LjEyNiw4LjIzDQoJCQlsLTEwLjgyMiw1Ny4zMDNjLTAuMjk5LDEuNTc5LTEuNjgyLDIuNzI0LTMuMjg5LDIuNzI0aC0zNS4xODdjLTEuNjA3LDAtMi45OS0xLjE0Ni0zLjI4OS0yLjcyNGwtNS45OTQtMzEuNjY5DQoJCQljLTEuMTgtNi4yMzEtNy4wMjQtMTAuMzctMTMuMzE0LTkuNDE3Yy0xNS4xNTcsMi4yOTItMzAuNzc1LDMuNDUzLTQ2LjQxOCwzLjQ1M2MtMTEuNjM4LDAtMjMuMTI3LTAuNjQ5LTM0LjE1LTEuOTMNCgkJCWMtNi4wOTUtMC43MDEtMTEuNzczLDMuNDU0LTEyLjkxMiw5LjQ3MmwtNS42OTYsMzAuMDkxYy0wLjI5OSwxLjU3OS0xLjY4MiwyLjcyNC0zLjI4OSwyLjcyNGgtMzUuMTg3DQoJCQljLTEuNjA3LDAtMi45OS0xLjE0Ni0zLjI5My0yLjc0OGwtMTAuNDItNTQuMTIyYy0wLjY3MS0zLjQ4Ny0yLjg2MS02LjQ1Mi02LjAxMi04LjEzNUM5Ni4yNSw0MDEuNTk1LDcxLjEyLDM1OS4xOTEsNzEuMTIsMzA0LjM1MQ0KCQkJYzAtMjcuNzA4LDYuMDYyLTUyLjIwOSwxOC4wMTctNzIuODI1YzExLjE1Ni0xOS4yMzksMjcuNDUtMzUuMTQ2LDQ4LjQyOS00Ny4yODFjMy41NjItMi4wNjEsNC43NzktNi42MTksMi43MTktMTAuMTgyDQoJCQljLTIuMDYtMy41NjItNi42MTgtNC43NzctMTAuMTgxLTIuNzE5Qzg5LjQyNSwxOTQuODc2LDY0Ljg5LDIzMS4xOCw1OC4xMzUsMjc3LjI5di0wLjAwMWMtMC43MTctMC4wNjUtMS40MzUtMC4xMjctMi4xNS0wLjIwMQ0KCQkJYzAuMTMtNC45NzUtMC43Ny05Ljk5NS0yLjczLTE0Ljg2N2MtNC4zMjMtMTAuNzQ2LTEzLjIwMy0xOC41MDItMjIuNjI0LTE5Ljc1OWMtNy40MjQtMC45OTQtMTQuNDg5LDIuMTU4LTE5LjM5Miw4LjYzNg0KCQkJYy03LjEwOSw5LjM5NC01Ljk1LDE2LjgyOC0zLjcyNywyMS40MWMzLjc1Myw3LjczMywxMy40LDEzLjIwMywyOS40MDksMTYuNjQyYy0wLjQ0LDAuNjU5LTAuOTI0LDEuMzIxLTEuNDU0LDEuOTg2DQoJCQljLTkuNDU5LDExLjg2My0yMC42MDMsMTQuNDg2LTI3LjgzOSwxNC43MzNDMy4zOTIsMzA2LjAxMiwwLDMwOS40MTMsMCwzMTMuNjUydjAuMDM2YzAsNC4xODEsMy4yOTksNy41OTEsNy40NzYsNy43ODINCgkJCWMwLjUzNSwwLjAyNSwxLjA5NCwwLjAzOCwxLjY3NiwwLjAzOGM5LjE1NiwwLDIzLjg1MS0zLjM3NywzNy45NjktMjEuMDhjMi4yMjktMi43OTQsNC4wNDUtNS43NDIsNS40NDEtOC43ODgNCgkJCWMxLjQwNiwwLjE1OSwyLjc1NywwLjI5NSw0LjA1MSwwLjQxNWMwLTAuMDAzLDAtMC4wMDUsMC4wMDEtMC4wMDhjLTAuMjU0LDQuMDM4LTAuMzk1LDguMTM1LTAuMzk1LDEyLjMwNA0KCQkJYzAsMzEuMDI4LDcuMzk3LDU4LjY5MywyMS45ODQsODIuMjNjMTMuNDUsMjEuNywzMi43MDcsMzkuNDY4LDU3LjI1NSw1Mi44M2wxMC4xMyw1Mi42MTZjMS42MjksOC42MDgsOS4xNywxNC44NTYsMTcuOTMxLDE0Ljg1Ng0KCQkJaDM1LjE4N2M4Ljc2MSwwLDE2LjMwMi02LjI0OCwxNy45MzEtMTQuODU2bDUuMTUtMjcuMjA4YzEwLjY5NiwxLjEzMywyMS43NywxLjcwNywzMi45NjUsMS43MDdjMTUuMzYsMCwzMC43MDItMS4wNyw0NS42NTQtMy4xODINCgkJCWw1LjQyOSwyOC42ODVjMS42Myw4LjYwOCw5LjE3MSwxNC44NTUsMTcuOTMxLDE0Ljg1NWgzNS4xODdjOC43NjEsMCwxNi4zMDItNi4yNDgsMTcuOTMyLTE0Ljg1OWwxMC41MzctNTUuNzkxDQoJCQljMjkuNzY4LTE1Ljc0MSw1Mi4yMDYtMzYuNDE5LDY2LjcwNC02MS40NzVjMS4wNDUtMS44MDYsMi42NTQtMy4xMzEsNC41My0zLjczMmwzMy43ODgtMTAuODIzDQoJCQlDNTA0LjE0MSwzNTYuNDU1LDUxMiwzNDUuNjg2LDUxMiwzMzMuNDAzdi0zNC43NzVDNTEyLDI4Ni4zNDYsNTA0LjE0MSwyNzUuNTc3LDQ5Mi40NDQsMjcxLjgzeiBNNDIxLjI3OCwxODMuMjczDQoJCQljLTIuODY4LDI0LjUyNi0xMC41NjEsNDUuNTA2LTE4LjI5MSw0OS44ODRjLTguNzg2LDQuOTc3LTI5LjA3MSw1LjkzOC00NC4zMDEtNS4yMDNjLTE1LjI0OC0xMS4xNTQtMjAuMzIzLTMxLjIxMi0xNC42NzgtNTguMDA2DQoJCQljMC0wLjAwMSwwLTAuMDAxLDAtMC4wMDFjMC41NjctMi42OTEsMi40NzktNS4wMTksNS4xMTQtNi4yMjVjMzcuMzA0LTE3LjA3Niw1OC44MTEtMjIuNjYxLDY2LjgwMS0yMi42NjENCgkJCWMxLjIwNiwwLDIuMTA0LDAuMTI3LDIuNzAyLDAuMzYxQzQyMS4wMjUsMTQzLjk4LDQyNC4xNzMsMTU4LjUyMSw0MjEuMjc4LDE4My4yNzN6IE0yMC45MjEsMjY2LjAwMQ0KCQkJYy0wLjc3MS0xLjU5LDEuMDQ5LTQuMzg1LDIuMjAzLTUuOTExYzEuODI5LTIuNDE2LDMuNTE0LTIuOTEsNC43ODctMi45MWMwLjI2OSwwLDAuNTIsMC4wMjIsMC43NSwwLjA1Mw0KCQkJYzMuNDI2LDAuNDU3LDguMjI2LDQuMjI3LDEwLjc2OSwxMC41NDhjMC41OTksMS40ODgsMS4zNzcsMy45NTMsMS41NTksNy4wMjdDMzAuNjc0LDI3Mi42NzEsMjIuNjYsMjY5LjU5LDIwLjkyMSwyNjYuMDAxeiIvPg0KCTwvZz4NCjwvZz4NCjxnPg0KCTxnPg0KCQk8cGF0aCBkPSJNMjM3LjkxOCw5OC4yNzdWNzEuNjEzYzkuMTk1LDAuNjU3LDEyLjYxMSw0Ljg2LDE1Ljc2Myw0Ljg2YzMuOTQxLDAsNS43OC00Ljk5MSw1Ljc4LTcuNDg3DQoJCQljMC02LjQzNy0xMi42MTEtOS4xOTUtMjEuNTQzLTkuNDU4VjU1Ljk4YzAtMS41NzYtMS45NzEtMy4wMjEtMy45NDEtMy4wMjFjLTIuMjM0LDAtMy44MSwxLjQ0NS0zLjgxLDMuMDIxdjMuODA5DQoJCQljLTEyLjQ3OSwxLjMxNC0yNC45NTgsNy44ODItMjQuOTU4LDI0LjQzM2MwLDE2LjgxNCwxMy4xMzYsMjEuNTQzLDI0Ljk1OCwyNS43NDZ2MzAuODY5DQoJCQljLTEzLjM5OS0xLjA1MS0xNi45NDUtMTAuMjQ2LTIxLjI4LTEwLjI0NmMtMy4yODQsMC02LjA0Miw0LjMzNS02LjA0Miw3LjQ4OGMwLDYuNDM2LDExLjAzNCwxNS4yMzcsMjcuMzIyLDE1LjVoMHY0LjA3Mg0KCQkJYzAsMS41NzYsMS41NzcsMy4wMjEsMy44MSwzLjAyMWMxLjk3MSwwLDMuOTQxLTEuNDQ1LDMuOTQxLTMuMDIxdi00LjQ2NmMxNC4xODctMS45NzEsMjMuOTA3LTEwLjkwMywyMy45MDctMjcuMDYNCgkJCUMyNjEuODI1LDEwOC4yNjEsMjQ5LjM0NiwxMDIuNDgsMjM3LjkxOCw5OC4yNzd6IE0yMzAuOTU1LDk1Ljc4MmMtNi45NjItMi42MjctMTIuNjEtNS4zODUtMTIuNjEtMTIuODcyDQoJCQljMC02LjgzMSw1LjI1NC0xMC4xMTUsMTIuNjEtMTEuMDM0Vjk1Ljc4MnogTTIzNy4xMjksMTQwLjU3NHYtMjcuNzE2YzYuNDM2LDIuNzU4LDExLjU1OSw2LjQzNiwxMS41NTksMTQuNzExDQoJCQlDMjQ4LjY4OCwxMzUuMDU4LDI0NC4yMjIsMTM5LjI2MSwyMzcuMTI5LDE0MC41NzR6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo="
								style="width: 70px; height: 70px; margin: 35px 0 0 0" />
							</span>
						</div>
					</div>
					<h2>
						<a href="#">후원을 통한 성장</a>
					</h2>
					<p>펀딩을 통해 우리의 목표를 더욱 발전시키고 성장할 수 있어요 서로서로 응원하고 응원받아요</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- =========== 메인 이미지 및 설명 부분 END =========== -->


<!-- =========== 모임 생성하러 가기 =========== -->
<section
	class="ftco-counter ftco-section ftco-no-pt ftco-no-pb img bg-beige"
	id="section-counter">
	<div class="container">
		<div class="row text-center">
			<div style="margin: 50px auto">
				<div class="text align-items-center">
					<h3 class="text">
						우리 동네 사람들과 함께 할 모임 보러가기 <a
							href="<c:url value='/town/AllOfMeeting.do'/>"><input
							type="button" class="btn btn-primary ml-3" value="Go"></a>
					</h3>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- =========== 모임 생성하러 가기 END =========== -->


<!-- =========== 모임 추천 서비스 ===========
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">모임</span>
				<h2>이런 모임은 어때요?</h2>
			</div>
		</div>

		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top:50px">

				<ol class="carousel-indicators"></ol>


			<div class="carousel-inner" style="max-width: 100%; height: 500px;"></div>
		</div>

	</div>
</section>
=========== 모임 추천 서비스 END ===========


===================== 곧 시작되는 공연 ======================
<section class="ftco-section ftco-no-pt">
	<div class="container-fluid px-md-4">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">공연</span>
				<h2>곧 시작되는 공연</h2>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${upcomming_performance}" var="uf">
				<div class="col-md-6 col-lg-4 d-flex">
					<div class="book-wrap d-lg-flex">
						<div id="perform_mainImg" class="img d-flex justify-content-end" 
							style="background-image: url('<c:url value="/images/${uf['OPERATOR']}/${uf['MEETINGNAME']}/Performance/${uf['MAIN_IMG']}"/>')">
							<div class="in-text">
								<a href="<c:url value="/MeetingViewCon.do?meetingNo=${uf['MEETINGNO']}"/>" class="icon d-flex align-items-center justify-content-center"
									data-toggle="tooltip" data-placement="left" title="자세히 보기">
									<span class="flaticon-search"></span>
								</a>
							</div>
						</div>
						<div class="text p-4">
							<p class="mb-2">
								<span class="price">${uf['MEETINGNAME']}</span>
							</p>
							<h2>
								<a href="#">${uf['TITLE']}</a>
							</h2>
							<span class="position">${uf['PERFORM_DATE_FORMAT']}&nbsp;${uf['PERFORM_TIME']}</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
===================== 곧 시작되는 공연 END ======================


===================== 현재 인기있는 게시글 =====================
<section class="ftco-section testimony-section ftco-no-pb">
	<div class="img img-bg border"
		style="background-image: url(resources/images/bg_4.jpg);"></div>
	<div class="post-overlay"></div>
	<div class="container">
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
				<span class="subheading" style="color: #FF7A5C">게시글</span>
				<h2 class="mb-3" style="color: black">현재 인기있는 게시글</h2>
			</div>
		</div>
		<div class="row ftco-animate">
			<div class="col-md-12">
				<div class="carousel-testimony owl-carousel ftco-owl">
					<c:forEach items="${popularBBS}" var="pBBS">
						<div class="item">
							<div class="testimony-wrap box-size py-4">
								<div class="quotation-icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left">
								</div>
								<div class="img">
									<div class="post-img" style="background-image: url('<c:url value="images/bbs/bbsno${pBBS['BBSNO']}/${pBBS['BBS_IMG']}"/>')"></div>
								</div>
								<div class="text">
									<div class="d-flex " style="width:auto;height:100px">
										<div >
											<p class="meeting-name pull-left">${pBBS['MEETINGNAME']}</p><br/>
											<span class="name" style="font-size:0.9em">${pBBS['CONTENTS']}</span>
										</div>
									</div>
									<small class="mb-2 pull-right post-date" style="margin-top:0px">${pBBS['BBSPOSTDATE']}</small>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>
 ===================== 현재 인기있는 게시글 END ===================



===================== 현재 진행 중인 펀딩 =======================
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center" style="margin-bottom:50px">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">펀딩</span>
				<h2>현재 진행 중인 펀딩</h2>
			</div>
		</div>
		<div class="row d-flex">
			<c:forEach items="${proceed_funding}" var="pf">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry justify-content-end">
						<div class="text text-center">
							<a href="<c:url value='/funding/MeetingViewFun.do?meetingNo=${pf["MEETINGNO"]}'/>" class="block-20 img"
								style="background-image: url('<c:url value='/images/${pf["OPERATOR"]}/${pf["MEETINGNAME"]}/${pf["BANNERIMG"] }'/>');">
							</a>
							<div class="meta text-center mb-2 d-flex align-items-center justify-content-center">
								<div>
									<span class="day">${pf["FDAY"]}</span>
									<span class="mos">${pf["FMONTH"]}</span>
									<span class="yr">${pf["FYEAR"]}</span>
								</div>
							</div>
							<h3 class="heading mb-3">
								<a href="<c:url value='/funding/MeetingViewFun.do?meetingNo=${pf["MEETINGNO"]}'/>">${pf["MEETINGNAME"]}</a>
							</h3>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
====================== 현재 진행 중인 펀딩 END ========================= -->

${updatePwdComplete} ${deleteAll}
<!-- 레이어 팝업창 소스 -->
<script src="resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<c:forEach items="${notice}" var="item" varStatus="status">
	<div class="popup" id="notice${item['NOTICENO']}"
		style="display:none; position:absolute; top:${(status.count-1)*100+150}px; left:${(status.count-1)*150+100}px; width:470px; height:445px; border:1px solid #ccc; background-color:#ffffff; z-index:100">
		<div
			style="background-color: #DDDDDD; padding-bottom: 10px; padding-top: 10px; text-align: center;">
			<span><Strong>${item['TITLE']}</Strong></span>
		</div>
		<div
			style="overflow-y: scroll; padding: 10px; width: 469px; height: 363px;">
			${item['CONTENT']}</div>
		<div
			style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;">
			<span class="pop_bt_nomore"
				onClick="close_pop_allday(true, ${item['NOTICENO']});"> 오늘
				더이상 열지 않기 </span> | <span class="close_popup"
				onClick="close_pop_allday(false, ${item['NOTICENO']});"> 닫기 </span>
		</div>
	</div>
</c:forEach>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
</sec:authorize>
<input type="hidden" id="user_id" value="${user_id}" />


<script>
      //Cookie Setting
        function setCookie(cookie_name, value, days) {
           var exdate = new Date();
           exdate.setDate(exdate.getDate() + days);
           // 설정 일수만큼 현재시간에 만료값으로 지정
           var cookie_value = escape(value) + ((days == null) ? '' : '; path=/;  expires=' + exdate.toUTCString());
           document.cookie = cookie_name + '=' + cookie_value;
         }
 		
        //팝업 Close 기능
        function close_pop_allday(flag, notice_no) {
           _this = $(this);
           var popupString = "notice"+notice_no;
 
             if ( flag == true ) {
            //쿠키세팅(그냥닫기 오늘안보기)
                setCookie("notice"+notice_no,"end",1);
                $("#notice"+notice_no).hide();
             }else{
        //false로 들어오면 그냥 숨기기만
                 $("#notice"+notice_no).hide();
             }
        };
          //팝업 쿠키확인후 보여주기
         <c:if test="${null ne notice}">
             <c:forEach var="popup" items = "${notice}" varStatus="status">
             
                 var notice_no = ${popup['NOTICENO']};
                 if ($.cookie('notice'+notice_no) != "end"){
                     //쿠키없는거만 보여주기
                     $("#notice"+notice_no).show();
                     $("#notice"+notice_no).draggable();
                 }
             </c:forEach>
         </c:if>
         
    /*──────────────────────────────────── 모임 추천 서비스 부분 ─────────────────────────────────────────────*/
    $.ajax({
    	url:'http://192.168.0.14:9090/recommends?low=1&high=5&user=${user_id}&count=3',
    	//url:'http://'+location.host+':9090/recommends?low=1&high=5&user=${user_id}&count=3',
    	success:function(data){
    		recommend(data);
    	}
    });
    
	function recommend(data) {
		console.log("recommend안");
		var meetingno = '';
		for(i=0; i<data.items.length; i++){
			meetingno += "item"+i+"="+data.items[i].item+"&";
		}
		$.ajax({
			url: "<c:url value='/RecommendMeeting.do?'/>",
			data: meetingno.substring(0, meetingno.length-1),
			contentType: "application/json; charset=utf-8",
			success: function(meeting){
  				var obj = JSON.parse(meeting);
				console.log("meeting::",obj[0].meetingNo);
				appendRecommend(obj);
			},
			error:function(e){console.log("에러메시지",e)}
		});
		
    }
	
	
	function appendRecommend(meeting){
		console.log("::meeting::\n",meeting);
		
		for(i=0; i<meeting.length; i++) {
			var li = "";
			var ob = "";
			if(i==0) {
			ob += '<a href="<c:url value="/MeetingViewMain.do?meetingNo='+meeting[i].meetingNo+'" />"/><div class="carousel-item active" style="height: 450px">';
			li = '<li data-target="#carouselExampleCaptions" class="active" data-slide-to="'+i+1+'" style="background-color:#FF7A5C"></li>'
			}
			else {
				ob += '<div class="carousel-item">';
				li = '<li data-target="#carouselExampleCaptions" data-slide-to="'+i+1+'" style="background-color:#FF7A5C" ></li>'
			}
			var url = "<c:url value='/images/"+meeting[i].operator+"/"+meeting[i].meetingName+"/"+meeting[i].bannerImg+"'/>";
			console.log("url:",url);
			ob += '<div class="col-md-6 wrap-about pl-md-2 py-2" style="float: right;">';
			ob += '<div class="heading-section">';
			ob += '<p style="font-size:0.8em;color:#FF7A5C">'+meeting[i].mainCategory + ' | ' + meeting[i].subCategory+'</p>';
			ob += '<h2 id="meetingName'+i+'" class="btn mb-4" style="margin-bottom:2px !important;font-size:35px;font-weight:bold;color:black">';
			if($('#user_id').val()!='') {
				ob += '<a href="<c:url value="/MeetingViewMain.do?meetingNo='+meeting[i].meetingNo+'" />">' + meeting[i].meetingName+'</a></h2>';;
			}
			else {
				ob += meeting[i].meetingName+'</a></h2>';
			}
			ob += '<p style="font-size:0.8em;">' + meeting[i].town +'</p>';
			ob += '<hr/><p>'+meeting[i].meetingDescription+'</p>';
			
			ob += '<a href="<c:url value="/MeetingView.do?meetingNo='+meeting[i].meetingNo+'" />" id="meetingDetailView'+i+'" class="btn btn-primary pull-right" style="margin:45% 10px 0 10px;display:none"></a></div></div>';
			
			ob += '<img class="d-block w-100" src="'+url+'" style="max-width: 45%; height: 400px;">'
			ob += '</div>';
			
			$('.carousel-inner').append(ob);
			$('.carousel-indicators').append(li)
			
		}
		if(meeting.length > 1) {
			var btn = '';
			btn += '<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"'+
				'data-slide="prev"> <span class="carousel-control-prev-icon"'+
					'aria-hidden="true"></span> <span class="sr-only">Previous</span>'+
				'</a>'+
				'<a class="carousel-control-next"'+
					'href="#carouselExampleIndicators" role="button"'+
					'data-slide="next"> <span class="carousel-control-next-icon"'+
					'aria-hidden="true"></span> <span class="sr-only">Next</span>'+
				'</a>';
				
			$('#carouselExampleIndicators').append(btn);
			console.log('완료!!');
		}
			
	}
	
	/*──────────────────────────────────── 모임 추천 서비스 부분 END ─────────────────────────────────────────────*/
     
   
</script>