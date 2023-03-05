<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
<div class="container">
	<div class="row">
		<div class="offset-6 col-6">
			<span id="hide" style="display: none; float: right;"> </span> 
			<span style="float: right; width: 45%;">
				<p></p>
				<br>
			</span>
		</div>
	</div>
</div>
	
	
	
	<!-- 배너 -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/images/banner10.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate mb-0 text-center" style="background-color: rgba(239,239,239,0.9); border-radius: 12px 12px 12px 12px;">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="index.html">드림 <i class="fa fa-chevron-right"></i></a></span> <span>공연보기 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-0 bread">공연 보기</h1>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 지도 -->
<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">
			<div id="map" style="width: 100%; height: 400px;"></div>
		</div>
	</div>
</section>

<div id="seeTown">
	<section class="ftco-section" id="section">
    	<div class="container-fluid px-md-5">
    		<div class="row">
    		
    		<c:forEach var="item" items="${performanceList }">
    			<div class="col-md-6 col-lg-4 d-flex">
    				<div class="book-wrap d-lg-flex">
    					<div class="img d-flex justify-content-end" style="background-image: url('/app/images/${item.operator }/${item.meetingName }/Performance/${item.main_img }');">
    						<div class="in-text">
    							<a href="<c:url value='/MeetingViewCon.do?meetingNo=${item.meetingNo }'/>" class="icon d-flex align-items-center justify-content-center" data-toggle="tooltip" data-placement="left" title="자세히 보기">
    								<span class="flaticon-search"></span>
    							</a>
    						</div>
    					</div>
    					<div class="text p-4">
    						<p class="mb-2"><span class="price">${item.meetingName }</span></p>
    						<h2><a href="<c:url value='/MeetingViewCon.do'/>">${item.title }</a></h2>
    						<span class="position">${item.place }</span>
    						<span class="position">${item.perform_date }</span>
    						<span class="position">${item.perform_time }</span>
    					</div>
    				</div>
    			</div>
    		</c:forEach>

    		</div><!-- row -->

    	</div>
    </section>
</div>

<c:if test="${empty performanceList }">
	<section class="ftco-section" id="section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-lg-12">
					<div class="row">
						<div class="offset-md-5">&nbsp;내동네에 모임이 없어요!</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</c:if>
        	<div class="row mt-5">
	          <div class="col text-center">
	            <div class="block-27">
	              <ul>
	                <li><a href="#">&lt;</a></li>
	                <li class="active"><span>1</span></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li><a href="#">4</a></li>
	                <li><a href="#">5</a></li>
	                <li><a href="#">&gt;</a></li>
	              </ul>
	            </div>
	          </div>
	        </div>


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5df4291e2d99c275b1ea40e928f7d96c&libraries=services,clusterer"></script>
<script type="text/javascript">


//KakaoMap

var gap = '${town}';

var geocoder = new kakao.maps.services.Geocoder();

var latLng = {
	'positions' : []
};

<c:forEach items='${performanceList}' var='item' varStatus="loop">

geocoder.addressSearch('${item.place}', function(result, status) {

	// 정상적으로 검색이 완료됐으면,
	if (status == kakao.maps.services.Status.OK) {

		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		y = result[0].x;
		x = result[0].y;

		latLng.positions.push({
			'place' : '${item.place}',
			'lat' : x,
			'lng' : y,
			'title' : '${item.title}',
		});
	}

});
</c:forEach>

function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

// 마커 클러스터러에 클릭이벤트를 등록합니다
// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
/* kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

    // 현재 지도 레벨에서 1레벨 확대한 레벨
    var level = map.getLevel()-1;

    // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
    map.setLevel(level, {anchor: cluster.getCenter()});
    
    console.log(cluster.getCenter());
    
}); */

function clickMarker(town) {
    return function() {

    	$.ajax({
			url : "<c:url value="/kakaoMapAjax.do"/>",
			type : 'post',
			dataType : 'json',
			data : "town=" + town,
			success : function(data) {
				//console.log(data[0].meetingBBSImgList[0].IMG);
				
				$('#section').remove();
				var section ="<section class='ftco-section' id='section'>";
				section +="<div class='container-fluid px-md-5'>";
				section +="<div class='row'>";
				
				console.log(data[0].meetingName)
				for(var i=0; i<data.length; i++){
					
					section +="<div class='col-md-6 col-lg-9' style='margin-left: 13%;'>";
					section +="<div class='book-wrap d-lg-flex'>";
					section +="<div class='img d-flex justify-content-end' style=\"background-image: url(\'/app/images/"+data[i].operator+"/"+data[i].meetingName+"/Performance/"+data[i].main_img+"\');\">";
					section +="<div class='in-text'>";
					section +="<a href='<c:url value='/MeetingViewCon.do?meetingNo="+data[i].meetingNo+"'/>' class='icon d-flex align-items-center justify-content-center' data-toggle='tooltip' data-placement='left' title='자세히 보기'> <span class='flaticon-search'></span></a>";
					section +="</div></div>";
					section +="<div class='text p-4'> <p class='mb-2'><span class='price'>"+data[i].meetingName+"</span></p> <h2>"+data[i].title+"</h2> <span class='position'>"+data[i].place+"</span> <span class='position'>"+data[i].perform_date+"</span> <span class='position'>"+data[i].perform_time+"</span>";
					section +="</div></div></div>"
					
				}
				section +="</div></div></section>";
				$('#seeTown').append(section);
				
			}
		});
		
        
    };
}



var clustererX;
var clustererY;

setTimeout(function() {
// 주소로 좌표를 검색
geocoder.addressSearch(gap, function(result, status) {

	// 정상적으로 검색이 완료됐으면,
	if (status == kakao.maps.services.Status.OK) {

		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		y = result[0].x;
		x = result[0].y;

		// 마커를 생성합니다
		var myMarker = new kakao.maps.Marker({
			position : new kakao.maps.LatLng(x, y),
			clickable: true
		});
		
		
		

		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(x, y), //지도의 중심좌표.
			level : 13
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 10
			//disableClickZoom: true
		});

		// 데이터에서 좌표 값을 가지고 마커를 표시합니다
		// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		console.log(latLng.positions);
		var allMarkers=[];
		for(var i=0; i<latLng.positions.length; i++){
			console.log(latLng.positions[i].place+'x 좌표 :'+latLng.positions[i].lat+'y 좌표 :'+latLng.positions[i].lng);
			var x =latLng.positions[i].lat;
			var y =latLng.positions[i].lng;
			 var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(x, y) // 마커의 위치
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: latLng.positions[i].title // 인포윈도우에 표시할 내용
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    kakao.maps.event.addListener(marker,'click',clickMarker(latLng.positions[i].place));
			    allMarkers.push(marker);
		}
	
 		//kakao.maps.event.addListener(clusterer, 'click', clickClusterer(clusterer.getCenter());
		clusterer.addMarkers(allMarkers);

		//myMarker.setMap(map);

		var iwContent = '<div style="padding:2px; font-size :0.4em">내 위치</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent,
			removable : true
		});

		//infowindow.open(map, myMarker);
		
		kakao.maps.event.addListener(myMarker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, myMarker);  
		});

	}
	//만약 주소가 없으면 클러스터링만
	else{
		alert('주소를 설정해주세요 !')
		location.href='<c:url value="/Mypage.do"/>';
	}

});
}, 200);


//도시 선택===========================================================================
 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');

 var cat2_num = new Array();
 var cat2_name = new Array();

 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');

 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');

 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');

 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');

 cat2_num[5] = new Array(76,77,78,79,80);
 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');

 cat2_num[6] = new Array(81,82,83,84,85);
 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');

 cat2_num[7] = new Array(86,87,88,89,90);
 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');

 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');

 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');

 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');

 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');

 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');

 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');

 cat2_num[14] = new Array(230,231,232,233);
 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');

 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');

 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');

function cat1_change(key,sel){
	if(key == '') return;
	var name = cat2_name[key];
	var val = cat2_num[key];
	
	for(i=sel.length-1; i>=0; i--)
	 sel.options[i] = null;
	sel.options[0] = new Option('-시군구 선택-','', '', 'true');
	for(i=0; i<name.length; i++){
	 sel.options[i+1] = new Option(name[i],val[i]);
	}
}
		
</script>
    
    
