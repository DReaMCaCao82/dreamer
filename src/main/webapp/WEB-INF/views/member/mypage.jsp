<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.balloon {
	position: relative;
	margin: 50px;
	width: 800px;
	height: 150px;
	border-radius: 10px;
	background: white;
	word-break:break-all;
	display: inline-block;
}


.imageText {
	position: relative;
	text-align: center;
	color: #FF7A5C;
}

.imageText:hover div {
	opacity: 1
}

.imageText div {
	position: absolute;
	background-color: #FF7A5C;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
	opacity: 0;
}

.imageText:hover img {
	filter: brightness(50%);
}
</style>


<section class="ftco-section ftco-no-pt" id="section">
	<div class="container">
		<div class="col-md-12 row">

			<div class="select_img col-md-10 text-center">
				<c:if test="${dto.profileimg == null}" var="notNull">
					<img id="real_img"
						src="<c:url value="resources/images/anony.PNG"/>"
						alt="Raised circle image"
						class="img-fluid rounded-circle shadow-lg"
						style="width: 300px; height: 300px;">

				</c:if>
				<c:if test="${not notNull}">
					<img id="real_img"
						src="<c:url value="/images/${dto.id}/${dto.profileimg}"/>"
						alt="Raised circle image"
						class="img-fluid rounded-circle shadow-lg"
						style="width: 300px; height: 300px;">
				</c:if>

				<span style="display: block; font-size: 2em; font-weight: bold;">${dto.name }</span>

				<div class="balloon" style="display: contents;">
					<c:if test="${dto.pr ==null }">
						<p style="font-size: 1.2em; line-height: 200px">입력된 상태메세지가 없어요 !</p>
					</c:if>
					<c:if test="${dto.pr !=null }">
						<p style="font-size: 1.2em;">${dto.pr }</p>
						</c:if>
				</div>

			<div class="row" style="margin-top: 5%; margin-bottom: 1%;">
				<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em; width: 25%;">가입일</div>

			<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em; width: 25%;">성별</div>

			<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em; width: 25%;">나이</div>

			<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em; width: 25%;">주소</div>
			
			</div>
			<hr/>
			<div class="row" style="margin-bottom: 5%;">
				<div style="font-size: 1.5em; width: 25%;">${dto.postdate }</div>

				<div style="font-size: 1.5em; width: 25%;">${dto.gender }</div>

				<div style="font-size: 1.5em; width: 25%;">${dto.age }</div>

				<c:if test="${townDTO.town !=null }">
					<span style="font-size: 1.5em; width: 25%;">${townDTO.town }</span>
				</c:if>
				<c:if test="${townDTO.town ==null }">
					
					<span style="color: red; width: 25%;">입력된 주소정보가 없어요 !</span>
				</c:if>
			</div>
			
			
				<span
					style="display: block; font-size: 1.5em; font-weight: bold; color:#FF7A5C;">프로필 사진 </span><span
					class="btn btn-success" style="background-color:#FF7A5C; border-color: #FF7A5C; float: right;" id="addAppealImg">+</span>
					
					<hr/>
			
				 
				<form id="frm" method="post" enctype="multipart/form-data"
					action="<c:url value='/insertAppealImg.do'/>">
					<input type="file" id="gdsImg" name="appeal" style="display: none;" />
				</form>

			<c:if test="${empty appealList}" var="appealResult">
				<div class="offset-md-5">&nbsp;등록된 사진이 없어요!</div>

			</c:if>
			<c:if test="${not appealResult}">
			
			<div></div>
			<div class="row">
				<c:forEach var="item" items="${appealList }" varStatus="loop">

					<div class="offset-1">
						<div class="imageText">
							<img id="appeal_img${loop.index }"
								src="<c:url value="/images/${dto.id}/${item['IMG']}"/>"
								alt="Raised circle image" class="img-fluid shadow-lg"
								style="width: 160px; height: 160px;">
							<div class="btn">
								<a href="javascript:isDelete(${item['APPEALNO']});">삭제</a>
							</div>

						</div>
					</div>
				</c:forEach>
				</div>
			</c:if>






				<span
					style="display: inline-block; font-size: 1.5em; font-weight: bold; color:#FF7A5C; margin-top: 5%; ">가입한 모임</span>
					<hr/>
		<c:if test="${not empty meetingList }" var="meeting">
			<div class="col-lg-8">
				<div class="row">
					<c:forEach var="item" items="${meetingList }" varStatus="loop">
						<div class="col-md-9">
								<div class="book-wrap">
									<div class="img img-5 d-flex d-flex justify-content-end"
										style="background-image: url('/app/images/${item.operator}/${item.meetingName }/${item.bannerImg }'); width: 100%;">
										<div class="in-text">
											<c:if test="${item.userLike ==1 }" var="notLike">
												<a href="javascript:meetingLike(meetingLike${loop.count },${item.meetingNo});"
													class="icon d-flex align-items-center justify-content-center"
													data-toggle="tooltip" data-placement="left"
													title="좋아요♡ 관심목록에 추가"  id="meetingLike${loop.count }">
													<span class="flaticon-heart-1"></span>
												</a>
											</c:if>
											<c:if test="${not notLike }">
												<a href="javascript:meetingLike(meetingLike${loop.count },${item.meetingNo});"
													class="icon d-flex align-items-center justify-content-center"
													data-toggle="tooltip" data-placement="left"
													title="좋아요♡ 관심목록에 추가"  id="meetingLike${loop.count }">
													<span class="flaticon-heart-1"></span>
												</a> 
											</c:if>
											<a
												href="<c:url value='/MeetingViewMain.do?meetingNo=${item.meetingNo}'/>"
												class="icon d-flex align-items-center justify-content-center"
												data-toggle="tooltip" data-placement="left" title="자세히 보기">
												<span class="flaticon-search"></span>
											</a>
										</div>
									</div>
									<div class="text p-4">
										<h2>${item.meetingName }</h2>
										<p class="mb-2">
											<span class="place">${item.town }</span>
										</p>
										<span class="position">${item.mainCategory } |
											${item.subCategory } | ${item.meetingRoleList}/${item.maxrole }</span>
										<p>${item.meetingDescription }</p>
									</div>
								</div>
							</div>
					</c:forEach>


				</div>
			</div>
		</c:if>
		<c:if test="${not meeting }">
			<div class="offset-md-5">&nbsp;가입한 모임이 없어요!</div>
		</c:if>
	</div>
	
	<div class="col-md-2 col-md-offset-10"
               style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">
            <!-- Aside section- Pc screen alone  사이드 메뉴-->
            <div class="sidebar-box ftco-animate">
              <div class="categories" id="ftco-nav">
                <span style="display: block; font-size: 2em; font-weight: bold; text-align: center; color :#FF7A5C;">마이페이지</span>
                <ul>
					<li class="nav-item" style="display: flex; font-family: none;"><a href="<c:url value="/ProfileUpdate.do"/>" class="nav-link">프로필수정</a></li>
	                <li class="nav-item dropdown" id="update" style="position: relative; font-family: none;"  data-toggle="dropdown" ><a href="#" class="nav-link">개인정보수정</a>
						<ul class="dropdown-menu" tyle="list-style: none; font-size: 0.8em; position: absolute;" id="subMenu">
							<li id="infoUpdate" style="font-family: none;"><a href="#">개인정보수정</a></li>
							<li id="pwdUpdate" style="font-family: none;"><a href="#">비밀번호수정</a></li>
							<li id="withdraw" style="font-family: none;"><a href="#">회원 탈퇴</a></li>
						</ul>
					 </li>
					 <li class="nav-item" id="bookMark" style="display: flex; font-family: none;"><a href="#" class="nav-link">즐겨찾기한모임</a></li>
					 <li class="nav-item" id="bookMark" style="display: flex; font-family: none;" data-toggle="modal" data-target="#joinPropositionList" ><a href="#" class="nav-link">가입 제안 모임</a></li>
					 <li class="nav-item" id="bookMark" style="display: flex; font-family: none;"><a id="Myquestion" href="<c:url value='MyQuestion.do'/>" class="nav-link">내 문의함</a></li>
	              </ul>
              </div>
            </div>   
          </div>
          
	</div>
</div>
</section>

<section class="ftco-section ftco-no-pt" id="checkInfoPwd"
	style="display: none;">

	<div class="container-fluid px-md-12  pt-2 ">


		<div class="row justify-content-between">

			<div class="col-md-8 order-md-last">

				<div class="row">

					<div class="col-md-6 text-center">
						<div class="jumbotron">
							<h1>개인정보 수정</h1>

						</div>

					</div>
					<div class="d-md-flex justify-content-end mb-md-0 mb-3"></div>
				</div>
			</div>

			<div class="col-md-4 d-flex"></div>
		</div>
	</div>
	<div class="container-fluid px-md-12">

		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">

					<div class="col-md-6">

						<div class="row no-gutters">
							<div class="col-md-12">
								<div class="contact-wrap w-100 p-md-5">
									<form id="infoPwdFrm">
										<div class="row">

											<div class="col-md-12">
												<div class="form-group">
													<span class="badge text-center">비밀번호 확인</span> <input
														type="password" class="form-control" name="infoPwd"
														id="infoPwd" maxlength="15"> <span
														id="infoPwdDisplay" style="color: red; font-size: 0.8em"></span>
													<input type="hidden" id="infoPwdCheck" name="infoPwdCheck"
														value="no" />

												</div>
											</div>
											<div class="col-md-12 pt-3">
												<div class="form-group">
													<input id="infoCheckBtn" type="button" value="비밀번호확인"
														class="btn btn-success btn-block">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>

						</div>



					</div>

				</div>

			</div>

			<div class="col-md-4 d-flex"></div>
		</div>
	</div>
</section>
<section class="ftco-section ftco-no-pt" id="checkUpdatePwd"
	style="display: none;">

	<div class="container-fluid px-md-12  pt-2 ">


		<div class="row justify-content-between">

			<div class="col-md-8 order-md-last">

				<div class="row">

					<div class="col-md-6 text-center">
						<div class="jumbotron">
							<h1>비밀번호 수정</h1>

						</div>

					</div>
					<div class="d-md-flex justify-content-end mb-md-0 mb-3"></div>
				</div>
			</div>

			<div class="col-md-4 d-flex"></div>
		</div>
	</div>
	<div class="container-fluid px-md-12">

		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">

					<div class="col-md-6">

						<div class="row no-gutters">
							<div class="col-md-12">
								<div class="contact-wrap w-100 p-md-5">
									<form id="pwdUpdatefrm">
										<div class="row">

											<div class="col-md-12">
												<div class="form-group">
													<span class="badge text-center">원래비밀번호</span> <input
														type="password" class="form-control" name="updatePwd"
														id="updatePwd" maxlength="15"> <span
														id="updatePwdDisplay" style="color: red; font-size: 0.8em"></span>
													<input type="hidden" id="updatePwdCheck"
														name="updatePwdCheck" value="no" />

												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<span class="badge text-center">새비밀번호</span> <input
														type="password" class="form-control" name="newPwd"
														id="newPwd" maxlength="15">

												</div>
											</div>

											<div class="col-md-12">
												<div class="form-group">
													<span class="badge text-center">새비밀번호 확인</span> <input
														type="password" class="form-control" name="newPwdCheck"
														id="newPwdCheck" maxlength="15"> <span
														id="newPwdDisplay" style="color: red; font-size: 0.8em"></span>

													<input type="hidden" id="newPwdCheckValue"
														name="newPwdCheckValue" value="no" />

												</div>
											</div>

											<div class="col-md-12 pt-3">
												<div class="form-group">
													<input id="pwdUpdateBtn" type="button" value="비밀번호수정"
														class="btn btn-success btn-block">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>

						</div>



					</div>

				</div>

			</div>

			<div class="col-md-4 d-flex"></div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-no-pt" id="checkwithdrawPwd"
	style="display: none;">

	<div class="container-fluid px-md-12  pt-2 ">


		<div class="row justify-content-between">

			<div class="col-md-8 order-md-last">

				<div class="row">

					<div class="col-md-6 text-center">
						<div class="jumbotron">
							<h1>회원탈퇴</h1>

						</div>

					</div>
					<div class="d-md-flex justify-content-end mb-md-0 mb-3"></div>
				</div>
			</div>

			<div class="col-md-4 d-flex"></div>
		</div>
	</div>
	<div class="container-fluid px-md-12">

		<div class="row justify-content-between">
			<div class="col-md-8 order-md-last">
				<div class="row">

					<div class="col-md-6">

						<div class="row no-gutters">
							<div class="col-md-12">
								<div class="contact-wrap w-100 p-md-5">
									<form id="withdrawFrm">
										<div class="row">
											<div class="col-md-12">
												<div>
													<span class="fa fa-chevron-right"
														style="color: green; display: inline-block;"></span> <span
														style="color: red;"> 탈퇴 후에는 <span
														style="text-decoration: underline;">모임</span> <span
														style="text-decoration: underline;">개인정보</span> <span
														style="text-decoration: underline;">게시판 </span> <span
														style="text-decoration: underline;"> 공연</span> <span
														style="text-decoration: underline;">펀딩</span> 등 <span
														style="color: green;">${dto.id}</span> 아이디로 활동한 모든 기록이
														지워집니다.
													</span> <br /> <input type="checkbox" id="agree" /> 네, 모두 동의합니다.
												</div>
											</div>
											<div class="col-md-12 pt-5">
												<div class="form-group">
													<span class="badge text-center">비밀번호 확인</span> <input
														type="password" class="form-control" name="withdrawPwd"
														id="withdrawPwd"> <span id="withdrawPwdDisplay"
														style="color: red; font-size: 0.8em"></span> <input
														type="hidden" id="withdrawPwdCheck"
														name="withdrawPwdCheck" value="no" />
												</div>
											</div>

											<div class="col-md-12 pt-3">
												<div class="form-group">
													<input id="withdrawBtn" type="button" value="회원탈퇴"
														class="btn btn-success btn-block" disabled="disabled"
														style="cursor: not-allowed;">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>

						</div>



					</div>

				</div>

			</div>

			<div class="col-md-4 d-flex"></div>
		</div>
	</div>
</section>
<section class="ftco-section ftco-no-pt" id="bookMarks"
	style="display: none;">

	<div class="container">

		

			<div class="col-lg-12">
				'<span style="color: green;">${dto.name } </span>'<span>님이
					즐겨찾기한 모임 목록</span>

				<hr />

				<div class="row" id="bookMarkRow">
				<c:if test="${not empty bookMarkMeetingList }" var="bookMarkMeeting">
					<c:forEach var="item" items="${bookMarkMeetingList }">
						<div class="col-md-12" id="bookMarkMeeting${item.meetingNo }">
							<div class="book-wrap book-wrap-2 d-md-flex">
								<div class="row" style="margin: 0px;">
									<div class="img img-2">
										<c:forEach var="list" items="${item.meetingBBSImgList }">
											<div class="img d-flex justify-content-end"
												style="background-image: url(images/${list['OPERATOR']}/${list['MEETINGNAME']}/bbs/${list['IMG'] }); width: 100%; height: 170px;"></div>
										</c:forEach>
									</div>
								</div>
								<div class="img img-5 d-flex d-flex justify-content-end"
									style="background-image: url('images/${item.operator}/${item.meetingName }/${item.bannerImg }'); width: 100%;">
									<div class="in-text">
									
										<a href="javascript:cancelBookMark(${item.meetingNo});"
											class="icon d-flex align-items-center justify-content-center"
											 >
											<img alt="image" id="cancelBookMark"
											style="height: 25px; width: 25px; margin-top: 10px"
											src="resources/images/heartOn.png">

										</a> <a
											href="<c:url value='/MeetingViewMain.do?meetingNo=${item.meetingNo  }'/>"
											class="icon d-flex align-items-center justify-content-center"
											 >
											<span class="flaticon-search"></span>
										</a>
									</div>
								</div>
								<div class="text p-4">
									<h2>${item.meetingName }</h2>
									<p class="mb-2">
										<span class="place">${item.town }</span>
									</p>
									<span class="position">${item.mainCategory } |
										${item.subCategory } | ${item.meetingRoleList}/${item.maxrole }</span>
									<p>${item.meetingDescription }</p>
								</div>
							</div>
						</div>
					</c:forEach>
					</c:if>


				</div>
			</div>
		
		<c:if test="${not bookMarkMeeting }">
			<div class="offset-md-5" id="noBookMark">&nbsp;즐겨찾기한 모임이 없어요 !</div>
		</c:if>

	</div>
</section>

<!-- ======================가입제안 리스트 모달================== -->
<div class="modal fade" id="joinPropositionList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">가입 제안 모임 목록</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
      <c:if test="${propositionList ne null }">
	  		<c:forEach var="item" items="${propositionList}">
				제안 역할 : ${item.roleName } / 제안 모임 : <a href='<c:url value="/MeetingViewMain.do?meetingNo=${item.meetingNo }"/>'>${item.meetingName}</a>
				<a href='<c:url value="/JoinPropositionReject.do?roleNo=${item.roleNo }"/>'>
					<button class="btn btn-default" type="button" id="submitBtn">거절하기</button>
				</a>  
				<a href='<c:url value="/JoinPropositionOk.do?roleNo=${item.roleNo }"/>'>
		        	<button class="btn btn-primary" type="button" id="submitBtn" style="padding: 0.5%;">수락하기</button>
		        </a><br>
			</c:forEach>
		</c:if>
      </div>
    </div>
  </div>
</div>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<script>
	//개인정보변경 -개인정보변경
	$('#infoUpdate').click(function() {
		console.log('들어옴');
		$('#update').attr('class', 'nav-item active');
		$('#section').attr('style', 'display : none');
		$('#checkInfoPwd').attr('style', 'display : ');
		$('#checkUpdatePwd').attr('style', 'display : none');
		$('#checkwithdrawPwd').attr('style', 'display : none');
		$('#bookMarks').attr('style', 'display :none ');
		$('#bookMark').attr('class', 'nav-item');

	});

	//개인정보변경-비밀번호변경
	$('#pwdUpdate').click(function() {
		$('#infoPwd').val("");
		$('#infoPwdDisplay').html("");
		$('#update').attr('class', 'nav-item active');
		$('#section').attr('style', 'display : none');
		$('#checkUpdatePwd').attr('style', 'display : ');
		$('#checkInfoPwd').attr('style', 'display : none');
		$('#checkwithdrawPwd').attr('style', 'display : none');
		$('#bookMarks').attr('style', 'display :none ');
		$('#bookMark').attr('class', 'nav-item');
	});
	//개인정보변경-회원탈퇴
	$('#withdraw').click(function() {
		console.log('들어옴');
		$('#update').attr('class', 'nav-item active');
		$('#section').attr('style', 'display : none');
		$('#checkUpdatePwd').attr('style', 'display :none ');
		$('#checkInfoPwd').attr('style', 'display : none');
		$('#checkwithdrawPwd').attr('style', 'display : ');
		$('#bookMarks').attr('style', 'display :none ');
		$('#bookMark').attr('class', 'nav-item');
	});

	//즐겨찾기
	$('#bookMark').click(function() {
		console.log('들어옴');
		$('.subMenu').slideUp(1);
		$('#section').attr('style', 'display : none');
		$('#checkUpdatePwd').attr('style', 'display :none ');
		$('#checkInfoPwd').attr('style', 'display : none');
		$('#checkwithdrawPwd').attr('style', 'display :none ');
		$('#bookMarks').attr('style', 'display : ');
		$('#bookMark').attr('class', 'nav-item active');
		$('#update').attr('class', 'nav-item');

	});

	//어필사진 등록
	
	$('#addAppealImg').click(function() {
		if(${appealList.size()} ==6){
			alert('이미지는 6개까지만 등록 가능해요!');
			return;
		}
		$("input[name='appeal']").click();
	});
	
	$('#gdsImg').change(function(){
		console.log('들어와써');
		$('#frm').submit();
	});
	
	//어필사진 삭제
	function isDelete(appealNo) {
   if (confirm("정말로 삭제 하시겠습니까?")) {
	  	location.replace("<c:url value='/deleteAppealImg.do?appealNo="+appealNo+"'/>");
   }
}////////////isDelete

//개인정보수정 위한 비밀번호 확인 ajax
$('#infoPwd').blur(function() {
	console.log('포커스 잃었다');
	console.log($(this).val());
	$.ajax({
		url : "<c:url value="/infoPwdAjax.do"/>",
		type : 'post',
		dataType : 'json',
		data : "infoPwd=" + $('#infoPwd').val(),
		success : function(data) {
			$('#infoPwdDisplay').html(data.infoPwdDisplay);
			$('#infoPwdCheck').val(data.infoPwdCheck);
			
		}
	});
});

	$('#infoCheckBtn').click(function(){
		if($('#infoPwdCheck').val()=='no'){
			$('#infoPwd').focus();
			return;
		}
		
		$('#infoPwdFrm').prop({
			action : "<c:url value='/CheckPwdForInfoUpdate.do'/>",
			method : 'POST'
		});
		//폼객체의 submit()함수로 서버로 전송
		$('#infoPwdFrm').submit();
	});
	
	//비밀번호 수정위한 원래비밀번호 확인 ajax
	$('#updatePwd').blur(function() {
		
		$.ajax({
			url : "<c:url value="/updatePwdAjax.do"/>",
			type : 'post',
			dataType : 'json',
			data : "updatePwd=" + $('#updatePwd').val(),
			success : function(data) {
				$('#updatePwdDisplay').html(data.updatePwdDisplay);
				$('#updatePwdCheck').val(data.updatePwdCheck);
				
			}
		});
	});
	//비밀번호 수정위한 새비밀번호 확인
				$('#newPwdCheck').keyup(function() {
					console.log('키눌렀다');
					if($(this).val()==$('#newPwd').val()){
						$('#newPwdDisplay').html('새비밀번호가 일치해요');
						$('#newPwdCheckValue').val('yes');
					}else{
						$('#newPwdDisplay').html('새비밀번호가 일치하지않아요');
						$('#newPwdCheckValue').val('no');
					}
					
					
				});
	
				$('#newPwd').keyup(function() {
					console.log('키눌렀다');
					if($(this).val()==$('#newPwdCheck').val() && $('#newPwdCheck').val()!=''){
						$('#newPwdDisplay').html('새비밀번호가 일치해요');
						$('#newPwdCheckValue').val('yes');
					}else if($(this).val()!=$('#newPwdCheck').val() && $('#newPwdCheck').val()!=''){
						$('#newPwdDisplay').html('새비밀번호가 일치하지않아요');
						$('#newPwdCheckValue').val('no');
					}else if($(this).val().length<5){
						$('#newPwdCheckValue').val('no');
					}
					
					
				});
	//비밀번호 수정 페이지로 넘기기
				$('#pwdUpdateBtn').click(function(){
					if($('#updatePwdCheck').val()=='no'){
						$('#updatePwd').focus();
						return;
					}else if($('#newPwd').val()==''){
						$('#newPwd').focus();
						return;
					}else if($('#newPwdCheckValue').val()=='no'){
						$('#newPwdCheck').focus();
						return;
					}else if($('#newPwd').val().length<5){
						$('#newPwdDisplay').html('비밀번호는 5자 이상으로 입력해주세요');
						$('#newPwd').focus();
					}
					
					$('#pwdUpdatefrm').prop({
						action : "<c:url value='/UpdatePwd.do'/>",
						method : 'POST'
					});
					//폼객체의 submit()함수로 서버로 전송
					$('#pwdUpdatefrm').submit();
				});
	//회원탈퇴 체크박스
	$('#agree').click(function(){
		if(document.getElementById('agree').checked){
			$('#withdrawBtn').prop({
				disabled :'',
				style : 'cursor: pointer'
			});
		}else{
			$('#withdrawBtn').prop({
				disabled :'disabled',
				style : 'cursor: not-allowed'
			});
		}
		
	});
	//회원탈퇴 위한 비번확인
	$('#withdrawPwd').blur(function() {
		$.ajax({
			url : "<c:url value="/withdrawPwdAjax.do"/>",
			type : 'post',
			dataType : 'json',
			data : "withdrawPwd=" + $('#withdrawPwd').val(),
			success : function(data) {
				$('#withdrawPwdDisplay').html(data.withdrawPwdDisplay);
				$('#withdrawPwdCheck').val(data.withdrawPwdCheck);
				
			}
		});
	});
	
					$('#withdrawBtn').click(function(){
					if($('#withdrawPwdCheck').val()=='no'){
						$('#withdrawPwd').focus();
						return;
					}
					
					if(confirm('정말로 탈퇴 하시겠어요?')){
					
					$('#withdrawFrm').prop({
						action : "<c:url value='/Withdraw.do'/>",
						method : 'POST'
					});
					//폼객체의 submit()함수로 서버로 전송
					$('#withdrawFrm').submit();
					}
					
				});
	
		
	function Myquestion(){
		
		$('#MyquestionForm').submit();
		
	};
	
	
	function cancelBookMark(meetingNo) {
		
		
		
		$.ajax({
			url : "<c:url value="/cancelBookMarkAjax.do"/>",
			type : 'post',
			dataType : 'json',
			data : "meetingNo=" +meetingNo,
			success : function(data) {
				
				$('#'+'bookMarkMeeting'+meetingNo).remove();
				
			}
		});
	};
	
	//likeMeeting
	function meetingLike(likeid,meetingNo){
      console.log(likeid)
      console.log(meetingNo)
      var src = ($('#'+likeid).attr('src') == '/app/resources/images/heartOff.png') ? '/app/resources/images/heartOn.png' : '/app/resources/images/heartOff.png'; 
      console.log(src);
      if(src=='/app/resources/images/heartOn.png'){
         
         $.ajax({
              url:"<c:url value='/meetingLikeMypage.do'/>",
              data:{'meetingNo':meetingNo},
              dataType : 'json',
              success:function(data){
            	 
                 $('#'+likeid).attr('src',src)
                 $('#noBookMark').remove();
                 console.log(data[0].meetingName);
                 
                 var bookMarkMeeting ="<div class='col-md-12' id='bookMarkMeeting"+data[0].meetingNo+"'>";
                 	 bookMarkMeeting +="<div class='book-wrap book-wrap-2 d-md-flex'>";
                	 bookMarkMeeting +="<div class='row' style='margin: 0px;'>";
                	 bookMarkMeeting +="<div class='img img-2'>";
                		if(data[0].meetingBBSImgList!=null){
        					for(var j=0; j<data[0].meetingBBSImgList.length; j++){
        						bookMarkMeeting +="<div class='img d-flex justify-content-end' style='background-image: url(/app/images/"+data[0].meetingBBSImgList[j].OPERATOR+"/"+data[0].meetingBBSImgList[j].MEETINGNAME+"/bbs/"+data[0].meetingBBSImgList[j].IMG+"); width: 100%; height: 170px;'>";
        						bookMarkMeeting +="</div>";
        						}
        					}
                	 bookMarkMeeting +="</div>";
                	 bookMarkMeeting +="</div>";
                	 bookMarkMeeting +="<div class='img img-5 d-flex d-flex justify-content-end' style='background-image: url(/app/images/"+data[0].operator+"/"+data[0].meetingName+"/"+data[0].bannerImg+"); width: 100%;'>";
                	 bookMarkMeeting +="<div class='in-text'>";
                	 bookMarkMeeting +="<a href='javascript:cancelBookMark("+data[0].meetingNo+");' class='icon d-flex align-items-center justify-content-center'>";
                	 bookMarkMeeting +="<img alt='image' id='cancelBookMark' style='height: 25px; width: 25px; margin-top: 10px' src='resources/images/heartOn.png'></a>";
                	 bookMarkMeeting +="<a href='<c:url value='/MeetingViewMain.do?meetingNo="+data[0].meetingNo+"'/>' class='icon d-flex align-items-center justify-content-center'> <span class='flaticon-search'></span></a>";
                	 bookMarkMeeting +="</div></div>";
                	 bookMarkMeeting +="<div class='text p-4'> <h2>"+data[0].meetingName+"</h2> <p class='mb-2'> <span class='place'>"+data[0].town+"</span> </p> <span class='position'>"+data[0].mainCategory+" |"+data[0].subCategory+" | "+data[0].meetingRoleList+"/"+data[0].maxrole+"</span><p>"+data[0].meetingDescription+"</p>";
                	 bookMarkMeeting +="</div></div></div>";
                	
                 console.log(bookMarkMeeting);
                 $('#bookMarkRow').append(bookMarkMeeting);
                 
              }
              
           });
      }else{
         $.ajax({
              url:"<c:url value='/meetingLikeDelete.do'/>",
              data:{'meetingNo':meetingNo},
              success:function(data){
            	 
                 $('#'+likeid).attr('src',src)
                 $('#'+'bookMarkMeeting'+meetingNo).remove();
                 
              }
              
           });
      }
      
      
   }

	
</script>
