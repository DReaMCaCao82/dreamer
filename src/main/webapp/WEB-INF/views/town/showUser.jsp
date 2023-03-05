<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.pagination {
	display: block;
	text-align: center;
}

.pagination>li>a {
	float: none;
}
</style>




<div class="container">
	<div class="row">
		<div class="offset-5 col-7">
			<span style="float: right;"> 
				<a href="<c:url value='/town/AllOfMeeting.do'/>" id="meeting"> 
					<span style="font-size: 1.0em;">&nbsp;모임&nbsp;</span>
				</a>
				<a href="<c:url value='/ShowUser.do'/>"> 
					<span style="font-size: 1.0em; font-weight: bold; color: black;" class="border-left">&nbsp;회원</span>
				</a>
			</span>

		</div>
	</div>
</div>



<!--=================== 배너==========================-->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/resources/images/banner6.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate mb-0 text-center" style="background-color: rgba(239,239,239,0.9); border-radius: 12px 12px 12px 12px;">
				<p class="breadcrumbs mb-0">
					<span class="mr-2"><a href="index.html">드림 <i class="fa fa-chevron-right"></i></a></span>
					<span>동네 둘러보기 <i class="fa fa-chevron-right"></i></span>
				</p>
				<h1 class="mb-0 bread">우리 동네 이웃 보기</h1>
			</div>
		</div>
	</div>
</section>


<!-- 동네 회원 둘러보기-->

<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<c:if test="${town ne null}" var="notTown">
			<div class="row">
				<div class="col-lg-12 ftco-animate">

					<div class="row">
						<c:forEach var="item" items="${list }">
							<div class="col-md-4 d-flex">
								<div class="book-wrap">
									<c:if test="${item.profileimg != null}" var="notProfile">
										<div class="img d-flex justify-content-end w-100"
											style="background-image: url(/app/images/${item.id}/${item.profileimg });">
											<div class="in-text">
												<a href="<c:url value='#'/>"
													class="icon d-flex align-items-center justify-content-center"
													data-toggle="modal" data-target="#ID${item.id}" data-placement="left" >
													<span class="flaticon-search"></span>
												</a>
											</div>
										</div>
									</c:if>
									<c:if test="${not notProfile}">
										<div class="img d-flex justify-content-end w-100"
											style="background-image: url('resources/images/anony.PNG');">
											<div class="in-text">
												<a href="<c:url value='#'/>"
													class="icon d-flex align-items-center justify-content-center"
													data-toggle="modal" data-target="#ID${item.id}" data-placement="left">
													<span class="flaticon-search"></span>
												</a>
											</div>
										</div>
									</c:if>
									<div class="text px-4 py-3 order-md-first w-100">
										<p class="mb-2">
											<span class="price">${item.name }</span>
										</p>
										<h2>${item.pr }</h2>
										<span>
											<c:forEach var="category" items="${item.categoryList}" varStatus="loop">
											 ${category['MAINCATEGORY'] } > ${category['SUBCATEGORY'] }<br>
											</c:forEach>
										</span>
									</div>
								</div>
							</div>
							
							
						</c:forEach>

					</div>

				</div>
				<!-- .col-md-8 -->

				<div class="col-md-12">${pagingString }</div>

			</div>
		</c:if>
		<c:if test="${not notTown }">
			<div class="row">
				<div
					class="col-md-6 pt-3 d-flex justify-content-center align-items-center">
					<img id="real_img"
						src="<c:url value="/resources/images/quokka.png"/>"
						alt="Raised circle image" class="shadow-lg"
						style="width: 500px; height: 500px;">
				</div>
				<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
					<div class="heading-section"
						style="text-align: center; padding-top: 40%">
						"주소가 등록되어 있지 않아요 !<br />마이페이지에서 개인정보수정으로 동네를 설정해보세요!"
					</div>
				</div>

			</div>
		</c:if>

	</div>
</section>
<!-- .section -->

<!-- =============================회원 상세보기======================================= -->
<c:forEach var="item" items="${list }">
<div class="modal fade" id="ID${item.id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      	<h4 class="modal-title" id="myModalLabel">"${item.name }"님의 프로필</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">

<section class="ftco-section ftco-no-pt" id="section">
	<div class="container">
		<div class="row">

			<div class="select_img col-md-12 text-center">
				<c:if test="${item.profileimg == null}" var="notNull">
					<img id="real_img"
						src="<c:url value="resources/images/anony.PNG"/>"
						alt="Raised circle image"
						class="img-fluid rounded-circle shadow-lg"
						style="width: 300px; height: 300px;">

				</c:if>
				<c:if test="${not notNull}">
					<img id="real_img"
						src="<c:url value="/images/${item.id}/${item.profileimg}"/>"
						alt="Raised circle image"
						class="img-fluid rounded-circle shadow-lg"
						style="width: 300px; height: 300px;">
				</c:if>

			</div>
			<div class="select_img col-md-12 text-center pt-3">
				<span
					style="display: inline-block; font-size: 2em; font-weight: bold;">${item.name }</span>
			</div>

			<div class="col-md-12 text-center"
				style="text-align: center;">
				<div class="balloon">
					<c:if test="${item.pr ==null }">
						<p style="font-size: 1.2em; line-height: 200px">입력된 상태메세지가 없어요 !</p>
					</c:if>
					<c:if test="${item.pr !=null }">
						<p style="font-size: 1.2em;">${item.pr }</p>
						</c:if>
				</div>
			</div>
			<div class="col-md-3 text-center"> 
				<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em">가입일</div>
				<hr/>
			</div>
			<br/>
			<div class="col-md-3 text-center">
			<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em">성별</div>
			<hr/>
			</div>
			<div class="col-md-3 text-center">
			<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em">나이</div>
			<hr/>
			</div>
			<div class="col-md-3 text-center">
			<div style="font-weight:bold; color :#FF7A5C; font-size: 1.5em">주소</div>
			<hr/>
			</div>
			<div class="col-md-3 text-center">
				<div style="font-size: 1.5em">${item.postdate }</div>
			</div>
			<div class="col-md-3 text-center">
				<div style="font-size: 1.5em">${item.gender }</div>
			</div>
			<div class="col-md-3 text-center">
				<div style="font-size: 1.5em">${item.age }</div>
			</div>
			<div class="col-md-3 text-center">
				<c:if test="${item.town !=null }">
					<span style="font-size: 1.5em">${item.town }</span>
				</c:if>
				<c:if test="${item.town ==null }">
					<span style="color: red;">입력된 주소정보가 없어요 !</span>
				</c:if>
			</div>
			
			
			<div class="select_img col-md-12 text-center "style="padding-top: 10%;">
				<span
					style="display: inline-block; font-size: 1.5em; font-weight: bold; color:#FF7A5C ">어필용 사진 </span>
					<hr/>
			</div>
	
			<c:forEach var="appealImg" items="${appealList }" varStatus="loop">
				<c:if test="${appealImg.id eq item.id}">
					<div></div>
					<div class="offset-1">
						<div class="imageText">
							<img id="appeal_img${loop.index }"
								src="<c:url value='/app/images/${appealImg.id}/${appealImg.img }'/>"
								alt="Raised circle image" class="img-fluid shadow-lg"
								style="width: 150px; height: 150px;">
						</div>
					</div>
				</c:if>
			</c:forEach>
			<div class="select_img col-md-12 text-center" style="padding-top: 10%;">
				<span
					style="display: inline-block; font-size: 1.5em; font-weight: bold; color:#FF7A5C ">가입한 모임</span>
					<hr/>
			</div>
		</div>
				<div class="col-lg-12" id="meeting">
					<div class="row" id="joinedMeeting">
						<c:forEach var="meeting" items="${meetingList }" varStatus="loop">
							<c:if test="${meeting.id eq item.id}">
							<div class="col-md-6 d-flex">
								<div class="book-wrap">
									<div class="img img-5 d-flex d-flex justify-content-end"
										style="background-image: url('/app/images/${meeting.operator }/${meeting.meetingName }/${meeting.bannerImg }'); width: 100%;">
										<div class="in-text">
											<a
												href="<c:url value='/MeetingViewMain.do?meetingNo=${meeting.meetingNo}'/>"
												class="icon d-flex align-items-center justify-content-center"
												data-toggle="tooltip" data-placement="left" title="자세히 보기">
												<span class="flaticon-search"></span>
											</a>
										</div>
									</div>
									<div class="text p-4">
										<h2>${meeting.meetingName }</h2>
										<span class="position">${meeting.mainCategory } > ${meeting.subCategory }</span>
									</div>
								</div>
							</div>
							</c:if>
						</c:forEach>


					</div>
				</div>

	</div>

</section>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <c:if test="${Mdto ne null and item.joinMcount < 2 and item.isOperator eq true}">
	        <a href='<c:url value="#"/>'><!-- ${item.id } -->
	        	<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#joinProposition${item.id }" >모임 가입 제안하기</button>
	        </a>
        </c:if>
      </div>
    </div>
  </div>
</div>

</c:forEach>


<!-- ======================가입제안 모달================== -->
<c:forEach var="member" items="${list }">
<div class="modal fade bs-example-modal-md" id="joinProposition${member.id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
      	<h4 class="modal-title" id="myModalLabel">모임 가입 제안하기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
	  <form id="frm" method="post" action='<c:url value="/JoinPropositionByOperator.do?meetingNo=${meetingNo }&id=${member.id }"/>'>
      	<c:forEach var="item" items="${thisMeetingRole}">
      		<c:if test="${empty item.id}">
        		<input type="radio" name="selectRole" value="${item.roleNo }"> ${item.roleName }<br>
        	</c:if>
        </c:forEach>
      </div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
       		<button class="btn btn-primary" type="submit" id="submitBtn" >가입 제안하기</button>
      	</div>
      </form>
    </div>
  </div>
</div>
</c:forEach>

<script>

//모임 가입 제안
$('#submitBtn').click(function() {
		$('#frm').submit();
	});

//likeMeeting
/* function meetingLike(likeid,meetingNo){
console.log(likeid)
console.log(meetingNo)
var src = ($(likeid).attr('src') == '/app/resources/images/heartOff.png') ? '/app/resources/images/heartOn.png' : '/app/resources/images/heartOff.png'; 
console.log(src);
if(src=='/app/resources/images/heartOn.png'){
   
   $.ajax({
        url:"<c:url value='/meetingLikeMypage.do'/>",
        data:{'meetingNo':meetingNo},
        dataType : 'json',
        success:function(data){ 
           $(likeid).attr('src',src)
        }
        
     });
}else{
   $.ajax({
        url:"<c:url value='/meetingLikeDelete.do'/>",
        data:{'meetingNo':meetingNo},
        success:function(data){
           $(likeid).attr('src',src)   
        }
        
     });
}


}
 function profileView(id){

	//상세보기를 누르면 띄워지는 모달의 모임 부분 데이터 에이작스로 받아와서 출력하기
    $.ajax({
       url : "<c:url value='/ajaxUser.do'/>",
       type : 'post',
       dataType : 'json',
       date : "id="+id,
       success : function(data) {
          console.log(data);
          var joinedMeeting ="<div class='row' id='joinedMeeting'>";
          if(data != null){
             for(var i=0; i<data.length; i++){
            	joinedMeeting +="<div class='col-md-6 d-flex'><div class='book-wrap'>";
            	joinedMeeting +="<div class='img img-5 d-flex justify-content-end' style='background-image: url(/app/images/"+data[i].operator+"/"+data[i].meetingName+"/"+data[i].bannerImg+"); width: 100%;'>";
            	joinedMeeting +="<div class='in-text'>";
                joinedMeeting +="<a href='<c:url value='/MeetingViewMain.do?meetingNo="+data[i].meetingNo+"'/>' class='icon d-flex align-items-center justify-content-center'><span class='flaticon-search'></span></a></div></div>";
                joinedMeeting +="<div class='p-4'> <h2>"+data[i].meetingName+"</h2><p class='mb-2'><span class='place'>"+data[i].town+"</span></p>";
                joinedMeeting +="<span class='position'>"+data[i].mainCategory+" | "+data[i].subCategory+"</span></div></div></div>";
             }//for
          }else{
        	  joinedMeeting+="<div style='margin-left:38%;'>&nbsp;가입한 모임이 없어요!</div>";
          }
          joinedMeeting+="</div>";
          $('#meeting').append(joinedMeeting);

       }

    });

 } */
 
 
	
</script>

