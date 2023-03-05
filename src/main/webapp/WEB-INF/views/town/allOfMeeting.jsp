<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:200px;height:53px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FFB8A8;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:49.5px;padding-top:5px;cursor:pointer;} 
.category .flaticon_fantasy {display:block;margin:0 auto 2px;width:22px;height:26px;} 
/*.category .ico_music {background-position:-10px 0;}  
.category .ico_sports {background-position:-10px -36px;} 
.category .ico_art {background-position:-10px -72px;}  
.category .ico_game {background-position:-10px -108px;}*/
</style>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5df4291e2d99c275b1ea40e928f7d96c&libraries=services"></script>



<div class="container">
	<div class="row">
		<div class="offset-6 col-6">
			<span id="hide" style="display: none; float: right;"> </span> 
			<span style="float: right; width: 45%;">
				<c:if test="${empty Mdto and joinMcount eq 0}">
					<a href="<c:url value='/CreateMeeting.do'/>">
						<button class="btn btn-primary" style="width: 45%; height: 50;">모임 만들기</button>
					</a>
				</c:if>
				<a href="#">
					<span style="font-size: 1.0em; font-weight: bold; color: black;">&nbsp;모임&nbsp;</span>
				</a>
				<a href="<c:url value="/ShowUser.do"/>" id="meeting">
					<span style="font-size: 1.0em;" class="border-left">&nbsp;회원</span>
				</a>
			</span>
		</div>
	</div>
</div>




<!-- 배너 -->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/app/resources/images/banner12.jpg');"
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
				<h1 class="mb-0 bread">우리 동네 모임 보기</h1>
			</div>
		</div>
	</div>
</section>


<!-- 지도 -->
<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:70%; height:350px; margin-left: 15%; margin-top: 5%;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category" style="margin-left:15%;margin-top:5%;">
        <ul>
            <li id="musicMenu" onclick="changeMarker('music')">
                <span class="flaticon_fantasy ico_music">
                	<img class="ico_music" style="width:26px;height:25px;" src='<c:url value="/resources/images/music.png"/>'/>
                </span>
				음악
            </li>
            <li id="sportsMenu" onclick="changeMarker('sports')">
                <span class="flaticon_fantasy ico_sports">
					<img class="ico_sports" style="width:26px;height:25px;" src='<c:url value="/resources/images/sports.png"/>'/>
                </span>
				스포츠
            </li>
            <li id="artMenu" onclick="changeMarker('art')">
                <span class="flaticon_fantasy ico_art">
					<img class="ico_art" style="width:26px;height:25px;" src='<c:url value="/resources/images/art.png"/>'/>
                </span>
               	공연예술
            </li>
            <li id="gameMenu" onclick="changeMarker('game')">
            	<span class="flaticon_fantasy ico_game">
					<img class="ico_game" style="width:26px;height:25px;" src='<c:url value="/resources/images/game.png"/>'/>
				</span>
				컴퓨터
            </li>
        </ul>
    </div>
</div>


<!-- 동네 둘러보기-->
<div id="seeTown">
<section class="ftco-section" id="section">
	<div class="container">
		<div class="row mb-5">
			<c:if test="${not empty meetingList }" var="meeting">
				<div class="col-lg-12">
					<div class="row">
						<c:forEach var="item" items="${meetingList }" varStatus="loop">
							<div class="col-md-6 d-flex">
								<div class="book-wrap">
									<div class="img img-5 d-flex d-flex justify-content-end"
										 style="background-image: url('/app/images/${item.operator}/${item.meetingName }/${item.bannerImg }'); width: 100%;">
										<div class="in-text">
											<c:choose>
	                        					<c:when test="${item.userLike eq id }">
												<a href="javascript:void(0)"
													class="icon d-flex align-items-center justify-content-center"
													data-toggle="tooltip" data-placement="left"
													title="관심 모임♡ 좋아요"  id="like${item.meetingNo}">
													<span class="flaticon-heart-1"></span>
												</a>
												</c:when>
												<c:otherwise>
												<a href="javascript:void(0)"
													class="icon d-flex align-items-center justify-content-center"
													data-toggle="tooltip" data-placement="left"
													title="관심 모임♡ 좋아요"  id="like${item.meetingNo}">
													<span class="flaticon-heart-1"></span>
												</a>
												</c:otherwise>
											</c:choose>
											<a
												href="<c:url value='/MeetingViewMain.do?meetingNo=${item.meetingNo}'/>"
												class="icon d-flex align-items-center justify-content-center"
												data-toggle="tooltip" data-placement="left" title="자세히 보기">
												<span class="flaticon-search"></span>
											</a>
										</div>
									</div>
									<div class="text p-1">
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
				<div class="offset-md-5">&nbsp;모임이 없어요!</div>
			</c:if>
		</div>
		
	</div>
</section>
</div>




<script>
<c:forEach items='${allMeetingList}' var='item'>
$('#like${item["meetingNo"]}').click(function(){
	//하트 이미지 바꾸고 좋아요 숫자 바꾸고 같은 번호 게시글 상세보기도 이미지랑 숫자 바꾸기
	console.log('하트 클릭헸다');
	console.log('${item["meetingNo"]}');
	var re = ($('#like${item["meetingNo"]}').attr('style') == 'background:white') ? 'On' : 'Off';
// 	var src = ($('#like${item["meetingNo"]}').attr('style') === 'background-color:white') ? 'background-color:yellow'
//             : 'background-color:white';
// 	$('#like$${item["meetingNo"]}').attr('src', src);
	if(re==On){
		$('#like$${item["meetingNo"]}').attr('style', "background:yellow;");
	}else{
		$('#like$${item["meetingNo"]}').attr('style', "background:white;");
	}

	$.ajax({
		url : '<c:url value="/LikeMeetingChange.do"/>',
		type : 'post',
		dataType : 'json',
		data : {'re':re, 'meetingNo':'${item["meetingNo"]}'},
		success : function(data) {

		}
	});
	
});
</c:forEach>

//likeMeeting
function meetingLike(likeid,meetingNo){
  console.log("likeid =",likeid)
  console.log(meetingNo)
  var src = ($(likeid).attr('src') == '/app/resources/images/heartOff.png') ? '/app/resources/images/heartOn.png' : '/app/resources/images/heartOff.png'; 
  console.log(src);
  if(src=='/app/resources/images/heartOn.png'){
     
     $.ajax({
          url:"<c:url value='/meetingLike.do'/>",
          data:{'meetingNo':meetingNo},
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



//카테고리별 장소 검색 kakaoMap 선영===========================================================

var gap = '${town}';

	var geocoder = new kakao.maps.services.Geocoder();
	
	var map;
		
 	var latLng = {
 		'positions' : []
 	};
 	
	//각 카테고리에 해당하는 모임들의 마커가 표시될 좌표 배열
	var musicPositions = [];
	var sportsPositions = [];
	var artPositions = [];
	var gamePositions = [];
	
	var musicMarkers = [], // 음악 마커 객체를 가지고 있을 배열입니다
    sportsMarkers = [], // 운동 마커 객체를 가지고 있을 배열입니다
    artMarkers = [], // 예술 마커 객체를 가지고 있을 배열입니다
    gameMarkers = []; // 게임 마커 객체를 가지고 있을 배열입니다
    
    var musicMeetingName = [], // 음악 모임 이름 배열
    sportsMeetingName = [], // 운동 모임 이름 배열
    artMeetingName = [], // 예술 모임 이름 배열
    gameMeetingName = []; // 게임 모임 이름 배열
    
 	
	geocoder.addressSearch(gap, function(result, status) {

		// 정상적으로 검색이 완료됐으면,
		if (status == kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			y = result[0].x;
			x = result[0].y;
			console.log("지도의 중심 좌표"+x+':'+y);

			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new kakao.maps.LatLng(x, y), //지도의 중심좌표.
				level : 7 // 지도의 확대 레벨 
			};
			map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴		
		}
		//만약 주소가 없으면
		else{
			alert('주소를 설정해주세요 !')
			location.href='<c:url value="/Mypage.do"/>';
		}
		 	
	});
    
var iwContent;//인포윈도우에 내용을 넣을 변수

setTimeout(function() {
	<c:forEach items='${allMeetingList}' var='item' varStatus="loop">

	geocoder.addressSearch('${item.town}', function(result, status) {

		// 정상적으로 검색이 완료됐으면,
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			y = result[0].x;
			x = result[0].y;

			latLng.positions.push({
				'town' : '${item.town}',
				'lat' : x,
				'lng' : y
			});

			var category='${item.mainCategory}';
			var meetingName='<div style="padding:5px;">${item.meetingName}</div>';

			console.log(x+':'+y);
			console.log(category);
			
			if(category=="음악"){
				//음악 카테고리 마커가 표시될 좌표 배열
				musicPositions.push(new kakao.maps.LatLng(x, y));
				musicMeetingName.push(meetingName);
				
			} else if(category=="스포츠"){
				//운동 카테고리 마커가 표시될 좌표 배열
				sportsPositions.push(new kakao.maps.LatLng(x, y));
				sportsMeetingName.push(meetingName);
				
			} else if(category=="공연예술"){
				//예술 카테고리 마커가 표시될 좌표 배열
				artPositions.push(new kakao.maps.LatLng(x, y));
				artMeetingName.push(meetingName);

			} else if(category=="컴퓨터"){
				//게임 카테고리 마커가 표시될 좌표 배열
				gamePositions.push(new kakao.maps.LatLng(x, y));
				gameMeetingName.push(meetingName);

			}

		}
	});
	
	</c:forEach>
}, 100);

		    	
 	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
    function createMarkerImage(src, size, options) {
        var markerImage = new kakao.maps.MarkerImage(src, size, options);
        return markerImage;            
    }
    
 	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
    function createMarker(position, image) {
        var marker = new kakao.maps.Marker({
            position: position,
            image: image
        });
        return marker;  
    }
 	
 	//음악 마커를 생성하고 음악 마커 배열에 추가하는 함수입니다
    function createMusicMarkers() {
	console.log('마커 만들고 있어?');
    	for (var i = 0; i < musicPositions.length; i++) {  
    	    var markerImageSrc='<c:url value="/resources/images/musicMarker.png"/>';
    	    var imageSize = new kakao.maps.Size(30, 30),
    	        imageOptions = {  
    	            spriteOrigin: new kakao.maps.Point(0, 0),    
    	            spriteSize: new kakao.maps.Size(35, 35)  
    	        };     
    	    
    	    // 마커이미지와 마커를 생성합니다
    	    var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
    	        marker = createMarker(musicPositions[i], markerImage);  
    	    
    	    // 생성된 마커를 음악 마커 배열에 추가합니다
    	    musicMarkers.push(marker);
    	    
    	    // 마커에 표시할 인포윈도우를 생성합니다 
    	    var infowindow = new kakao.maps.InfoWindow({
    	        content: musicMeetingName[i] // 인포윈도우에 표시할 내용
    	    });

    	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    	    (function(marker, infowindow) {
    	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
    	        kakao.maps.event.addListener(marker, 'mouseover', function() {
    	            infowindow.open(map, marker);
    	        });

    	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
    	        kakao.maps.event.addListener(marker, 'mouseout', function() {
    	            infowindow.close();
    	        });
    	    })(marker, infowindow);
    	}     
    }

    //음악 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setMusicMarkers(map) {        
    	for (var i = 0; i < musicMarkers.length; i++) {  
    		console.log("음악 마커 배열:"+musicMarkers[i]);
    	    musicMarkers[i].setMap(map);
    	}        
    }

    
    //운동 마커를 생성하고 운동 마커 배열에 추가하는 함수입니다
    function createSportsMarkers() {
    	for (var i = 0; i < sportsPositions.length; i++) {
    		var markerImageSrc='<c:url value="/resources/images/sportsMarker.png"/>';
    	    var imageSize = new kakao.maps.Size(30, 30),
    	        imageOptions = {   
    	            spriteOrigin: new kakao.maps.Point(0, 0),    
    	            spriteSize: new kakao.maps.Size(35, 35)  
    	        };       
    	 
    	    // 마커이미지와 마커를 생성합니다
    	    var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
    	        marker = createMarker(sportsPositions[i], markerImage);  
    	
    	    // 생성된 마커를 운동 마커 배열에 추가합니다
    	    sportsMarkers.push(marker);
    	    
    	    // 마커에 표시할 인포윈도우를 생성합니다 
    	    var infowindow = new kakao.maps.InfoWindow({
    	        content: sportsMeetingName[i] // 인포윈도우에 표시할 내용
    	    });

    	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    	    (function(marker, infowindow) {
    	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
    	        kakao.maps.event.addListener(marker, 'mouseover', function() {
    	            infowindow.open(map, marker);
    	        });

    	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
    	        kakao.maps.event.addListener(marker, 'mouseout', function() {
    	            infowindow.close();
    	        });
    	    })(marker, infowindow);
    	}        
    }

    //운동 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setSportsMarkers(map) {        
    	for (var i = 0; i < sportsMarkers.length; i++) {  
    	    sportsMarkers[i].setMap(map);
    	}        
    }

    
    //예술 마커를 생성하고 예술 마커 배열에 추가하는 함수입니다
    function createArtMarkers() {
    	for (var i = 0; i < artPositions.length; i++) {
    		var markerImageSrc='<c:url value="/resources/images/artMarker.png"/>';
    	    var imageSize = new kakao.maps.Size(30, 30),
    	        imageOptions = {   
    	            spriteOrigin: new kakao.maps.Point(0, 0),    
    	            spriteSize: new kakao.maps.Size(35, 35)  
    	        };       
    	 
    	    // 마커이미지와 마커를 생성합니다
    	    var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
    	        marker = createMarker(artPositions[i], markerImage);  
    	
    	    // 생성된 마커를 예술 마커 배열에 추가합니다
    	    artMarkers.push(marker);
    	    
			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content: artMeetingName[i] // 인포윈도우에 표시할 내용
			});
	
			// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			(function(marker, infowindow) {
				// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					infowindow.open(map, marker);
				});
	
				// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
			})(marker, infowindow);
    	}                
    }

    //예술 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setArtMarkers(map) {        
    	for (var i = 0; i < artMarkers.length; i++) {  
    	    artMarkers[i].setMap(map);
    	}        
    }
    
    
  //게임 마커를 생성하고 게임 마커 배열에 추가하는 함수입니다
    function createGameMarkers() {
    	for (var i = 0; i < gamePositions.length; i++) {
    		var markerImageSrc='<c:url value="/resources/images/gameMarker.png"/>';
    	    var imageSize = new kakao.maps.Size(30, 30),
    	        imageOptions = {   
    	            spriteOrigin: new kakao.maps.Point(0, 0),    
    	            spriteSize: new kakao.maps.Size(35, 35)  
    	        };       
    	 
    	    // 마커이미지와 마커를 생성합니다
    	    var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
    	        marker = createMarker(gamePositions[i], markerImage);  
    	
    	    // 생성된 마커를 게임 마커 배열에 추가합니다
    	    gameMarkers.push(marker);
    	    
			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content: gameMeetingName[i] // 인포윈도우에 표시할 내용
			});
	
			// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			(function(marker, infowindow) {
				// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					infowindow.open(map, marker);
				});
	
				// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
			})(marker, infowindow);
    	}                
    }

    //게임 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setGameMarkers(map) {        
    	for (var i = 0; i < gameMarkers.length; i++) {  
    	    gameMarkers[i].setMap(map);
    	}        
    }

setTimeout(function() {
	
    createMusicMarkers(); // 음악 마커를 생성하고 음악 마커 배열에 추가합니다
    createSportsMarkers(); // 운동 마커를 생성하고 운동 마커 배열에 추가합니다
    createArtMarkers(); // 예술 마커를 생성하고 예술 마커 배열에 추가합니다
    createGameMarkers(); // 게임 마커를 생성하고 게임 마커 배열에 추가합니다
    
    //changeMarker('music'); // 지도에 음악 마커가 디폴드 보이도록 설정합니다 
	console.log("음악 좌표 배열 : "+musicPositions.length);
	console.log("운동 좌표 배열 : "+sportsPositions.length);
	console.log("예술 좌표 배열 : "+artPositions.length);
	console.log("게임 좌표 배열 : "+gamePositions.length);
	
    console.log("음악 마커 배열 : "+musicMarkers.length);
    console.log("운동 마커 배열 : "+sportsMarkers.length);
    console.log("예술 마커 배열 : "+artMarkers.length);
    console.log("게임 마커 배열 : "+gameMarkers.length);

}, 300);

    
//카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(mainCategory){
	console.log('여기 들어오나요? 2');
	
	//모임 리스트도 클릭한 카테고리에 따라 재정렬 
	$.ajax({
		url : '<c:url value="/kakaoMapMeetingAjax.do"/>',
		type : 'post',
		dataType : 'json',
		data : "mainCategory="+mainCategory,
		success : function(data) {
			//console.log(data[0].meetingBBSImgList[0].IMG);
			
			$('#section').remove();
			var section ="<section class='ftco-section' id='section'>";
			section +="<div class='container'>";
			section +="<div class='row mb-5'>";
			section +="<div class='col-lg-12'>";
			section +="<div class='row'>";
			
			console.log(data[0].meetingName);
			console.log(data.length);
			for(var i=0; i<data.length; i++){
				section +="<div class='col-md-6 d-flex'>";
				section +="<div class='book-wrap'>";
				section +="<div class='img img-5 d-flex d-flex justify-content-end' style=\"background-image: url(\'/app/images/"+data[i].operator+"/"+data[i].meetingName+"/"+data[i].bannerImg+"\'); width: 100%;\">";
				section +="<div class='in-text'>"
				section +="<a href='#' class='icon d-flex align-items-center justify-content-center' data-toggle='tooltip' data-placement='left' title='좋아요♡ 관심목록에 추가'>";
				section +="<span class='flaticon-heart-1'></span></a>";
				section +="<a href='<c:url value='/MeetingViewMain.do?meetingNo="+data[i].meetingNo+"'/>' class='icon d-flex align-items-center justify-content-center' data-toggle='tooltip' data-placement='left' title='자세히 보기'>";
				section +=" <span class='flaticon-search'></span></a></div></div>";
				section +="<div class='text p-4'> <h2>"+data[i].meetingName+"</h2> <p class='mb-2'><span class='place'>"+data[i].town+"</span></p> ";
				section +="<span class='position'>"+data[i].mainCategory+" | "+data[i].subCategory+" | "+data[i].meetingRoleList+" / "+data[i].maxrole+"</span> <p>"+data[i].meetingDescription+"</p>";
				section +="</div></div></div>";
				
			}
			section +="</div></div></div></div></section>";
			$('#seeTown').append(section);
			
		}
	});
	
   	var musicMenu = document.getElementById('musicMenu');
   	var sportsMenu = document.getElementById('sportsMenu');
   	var artMenu = document.getElementById('artMenu');
   	var gameMenu = document.getElementById('gameMenu');
   	console.log(mainCategory);
   	// 음악 카테고리가 클릭됐을 때
   	if (mainCategory == 'music') {
   	
   	    // 음악 카테고리를 선택된 스타일로 변경하고
   	    musicMenu.className = 'menu_selected';
   	    
   	    // 다른 카테고리는 선택되지 않은 스타일로 바꿉니다
   	    sportsMenu.className = '';
   	    artMenu.className = '';
   	    gameMenu.className = '';
   	    
   	    // 음악 마커들만 지도에 표시하도록 설정합니다
   	    setMusicMarkers(map);
   	    setSportsMarkers(null);
   	    setArtMarkers(null);
   	    setGameMarkers(null);
   	    
   	} else if (mainCategory == 'sports') { // 운동 카테고리가 클릭됐을 때
   		
   	    // 운동 카테고리를 선택된 스타일로 변경하고
   	    musicMenu.className = '';
   	    sportsMenu.className = 'menu_selected';
   	    artMenu.className = '';
   	    gameMenu.className = '';
   	    
   	    // 운동 마커들만 지도에 표시하도록 설정합니다
   	    setMusicMarkers(null);
   	    setSportsMarkers(map);console.log("운동 마커 왜 지도에 표시 안해?");
   	    setArtMarkers(null);
   	    setGameMarkers(null);
   	    
   	} else if (mainCategory == 'art') { // 예술 카테고리가 클릭됐을 때
   	 
   	    // 예술 카테고리를 선택된 스타일로 변경하고
   	    musicMenu.className = '';
   	    sportsMenu.className = '';
   	    artMenu.className = 'menu_selected';
   	    gameMenu.className = '';
   	    
   	    // 예술 마커들만 지도에 표시하도록 설정합니다
   	    setMusicMarkers(null);
   	    setSportsMarkers(null);
   	    setArtMarkers(map);  
   	    setGameMarkers(null);
   	    
   	} else if (mainCategory == 'game') { // 게임 카테고리가 클릭됐을 때
   	 
   	    // 게임 카테고리를 선택된 스타일로 변경하고
   	    musicMenu.className = '';
   	    sportsMenu.className = '';
   	    artMenu.className = '';
   	    gameMenu.className = 'menu_selected';
   	    
   	    // 게임 마커들만 지도에 표시하도록 설정합니다
   	    setMusicMarkers(null);
   	    setSportsMarkers(null);
   	    setArtMarkers(null);
   	    setGameMarkers(map);  
   	}	 
}

</script>
