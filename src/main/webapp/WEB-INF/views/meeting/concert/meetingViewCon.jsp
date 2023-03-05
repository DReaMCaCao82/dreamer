<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

#image {
  width: 100%;
  height: 100%;
  text-align: center;
  position: relative;
  z-index: 1;
}
#image::after {
  width: 100%;
  height: 100%;
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.3!important; filter:alpha(opacity=30);

}

</style>


   
<!-- ================================모임 공연 소개글 부분==================================== -->

 	<c:forEach var="item" items="${performanceListOfThisMeeting }">
 	
		
	 	<div class="container"  style="margin-top: 100px;">
			<div class="row justify-content-center mb-5 filebox">
				<div class="col-md-6" id="cma_image" style="float: left; height: 376px; width: 100%; border:1px solid gray; 
					 background-repeat: no-repeat; background-size: cover; background-image: url('/app/images/${item.operator }/${item.meetingName }/Performance/${item.main_img }');">
				</div>
				<div class="col-md-6" style="float: right;">
					<div class="heading-section">
						
						<c:choose>
							<c:when test="${id eq item.operator }">
								<div class="btn-group justify-content-right" style="text-align: right; float: right;">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										● ● ● <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href='<c:url value="/performance/UpdatePerformance.do?performanceNo=${item.performanceNo }"/>'>수정하기</a></li>
										<li><a href='<c:url value="/DeletePerformance.do?performanceNo=${item.performanceNo }"/>'>삭제하기</a></li>
									</ul>
								</div>
							</c:when>
							<c:when test="${id ne item.operator }">
								<div class="btn-group justify-content-right" style="text-align: right; float: right;">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										&nbsp; <span class="caret"></span>
									</button>
								</div>
							</c:when>
						</c:choose>
						
						<br/>
						<h2 class="mb-4" style="font-size: 35px">${item.title }</h2>
						<hr />
						<p>공연 날짜: ${item.perform_date }</p>
						<p>공연 시간: ${item.perform_time }</p>
						<p>공연 장소: ${item.place }</p>  
					</div>
				</div>
			</div>				
		</div>
		
			<div class="container">
				<div class="form-group">
				<hr />
				<span class="fa fa-quote-left"></span>
					${item.content }
				<span class="fa fa-quote-right" style="float: right;"></span>
				<br>
				<hr />			
				</div>
			</div>

			
	  		<section style="margin-left: 20%;">
			<div class="row no-gutters">
				<div class="col-md-4">
					<div class="contact-wrap w-100 p-md-5 p-4">
						<h3 class="mb-4">공연보러 오실래요?</h3>
						<form method="POST" id="contactForm" name="contactForm" class="contactForm">
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="#">응원 한 마디 부탁해요</label>
									<textarea name="message" class="form-control" id="message" cols="30" rows="1" placeholder="Message"></textarea>
								</div>
							</div>
							<div class="col-md-1 offset-md-9">
								<div class="form-group">
									<input type="submit" value="참석 할게요" class="btn btn-primary" style="margin-top: 30px;">
									<div class="submitting"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-5 order-md-first d-flex align-items-stretch">
					<div id="map" class="map${item.performanceNo }"></div>
				</div>
			</div>
			<hr style="margin-right: 26%;"/>
			</section>
					
	</c:forEach>


    <!-- ================================모임 공연 소개글 부분 끝==================================== -->
    
    <!-- ================공연글 없을 때========================= -->
<c:if test="${empty performanceListOfThisMeeting }">
    <section class="ftco-section">
         <div class="container" style="margin-top: 100px;">
            <div class="row justify-content-center">
               <div class="col-md-10" style="margin-top: 100px; margin-bottom: 100px; text-align: center;">
               
                        진행 중인 이벤트가 없습니다.


               </div>
            </div>
         </div>
   </section>
</c:if>
   <!-- ================공연글 없을 때 끝========================= -->
            
    
    
    
    
    
  
    
    
    
  


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5df4291e2d99c275b1ea40e928f7d96c&libraries=services"></script>

<script>
var mapContainer;
var mapOption;
var geocoder;
var place;

<c:forEach var='item' items='${performanceListOfThisMeeting }'>

	mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	var map${item.performanceNo } = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	geocoder = new kakao.maps.services.Geocoder();// 주소-좌표 변환 객체를 생성합니다

	console.log('공연 번호 : ${item.performanceNo }');

	place='${item.place}';
	var addr${item.performanceNo }=place.split(',', 1);
	console.log('공연장 주소 : '+place);
	console.log('좌표 검색용 주소 : '+addr${item.performanceNo });
	

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr${item.performanceNo }, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map${item.performanceNo },
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">공연 장소</div>'
	        });
	        infowindow.open(map${item.performanceNo }, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map${item.performanceNo }.setCenter(coords);
	    } 
	});

</c:forEach>	

    $(function(){
        $('#likeImgOff').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    
    $('#commentImg').click(function(){
       $('.commentall').toggle();
       $('.commentinput').focus();
       
    });
    
    
    
    $(function(){
        $('#likeImgOff2').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    $(function(){
        $('#likeImgOff3').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    $(function(){
        $('#commentLikeImgOff').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    $(function(){
        $('#commentLikeImgOff2').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    $(function(){
        $('#commentLikeImgOff3').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    $(function(){
        $('#commentLikeImgOff4').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    $(function(){
        $('#commentLikeImgOff5').on({ 'click': function() { 
           var src = ($(this).attr('src') === 'resources/images/heartOff.png') ? 'resources/images/heartOn.png' : 'resources/images/heartOff.png'; $(this).attr('src', src); } });
   });
    
    
    $('.commentall').hide();
    
    
    $('.commentview').click(function(){
       $('.commentall').toggle();
       
    });
    
    
    
    
//=============공연 삭제하기===============
$('#withdrawBtn').click(function(){
	if($('#withdrawPwdCheck').val()=='no'){
		$('#withdrawPwd').focus();
		return;
	}
	
	if(confirm('이 공연을 정말 삭제하시겠어요?')){
	
	$('#withdrawFrm').prop({
		action : "<c:url value='/Withdraw.do'/>",
		method : 'POST'
	});
	//폼객체의 submit()함수로 서버로 전송
	$('#withdrawFrm').submit();
	}
	
});
    
    
    
  </script>  
  
  
 
