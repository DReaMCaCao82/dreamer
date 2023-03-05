<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<link href="<c:url value="/resources/summernote/summernote-lite.min.css"/>" rel="stylesheet"> 
<script src="<c:url value="/resources/summernote/summernote-lite.min.js"/>"></script>
<script src="<c:url value="/resources/summernote/lang/summernote-ko-KR.js"/>"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<a href="http://github.com/wvega/timepicker" target="_blank"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png" alt="Fork me on GitHub"></a>
<style>
.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    width:fit-content;
    max-width:100%;
    margin-left: 22rem;
    margin-top: 20rem;
    opacity: 0.5;
}

</style>       



<div class="container">
	<div class="row">
		<div class="offset-6 col-6" >				
			<span id="hide" style="display: none; float: right;"> </span> 
		</div>
	</div>
</div>

	<!-- 배너 -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url(resources/images/banner8.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate mb-0 text-center" style="background-color: rgba(239,239,239,0.9); border-radius: 12px 12px 12px 12px;">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="index.html">드림 <i class="fa fa-chevron-right"></i></a></span> <span>동네 둘러보기 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-0 bread">공연 수정하기</h1>
          </div>
        </div>
      </div>
    </section>
    
    
    

<!-- ================================모임 공연 만들기 부분==================================== -->
<form id="frm" method="post" enctype="multipart/form-data" action="<c:url value='/UpdatePerformanceProcess.do'/>">
	
	<input type="hidden" name="performanceNo" value="${performanceNo }">
   <div class="container"  style="margin-top: 100px;">
      <div class="row justify-content-center mb-5 filebox">

               <div id="image"
               		class="col-md-6" id="cma_image" style="float: left; height: 376px; width: 100%; border:1px solid gray; 
               		background-repeat: no-repeat; background-size: cover; background-image: url('/app/images/${thisMeeting['operator'] }/${thisMeeting['meetingName'] }/Performance/${onePerformanceByNo['main_img'] }');">
               		<div>
					 	<label for="cma_file"  id="imgfile">공연 대표사진 변경</label>
       					<input type="file" name="cma_file" id="cma_file" value="${onePerformanceByNo['main_img'] }" style="display: none;"/>
					</div>
               </div>
               <div class="col-md-6"
                  style="float: right;">
                  <div class="heading-section">
                     <input type="text" class="form-control" name="title" id="title" value="${onePerformanceByNo['title'] }">
                     <hr />
                     <p>공연 날짜: <input type="text" id="datepicker" name="date" value="${perform_date }"></p>
                     <p>공연 시간: <input type="text" class="timepicker" name="time" value="${onePerformanceByNo['perform_time'] }"></p>
                     
                     <div class="col-md-10 text-left" style="margin-top: 2%; margin-bottom: 5%; max-width: initial; padding-left: 0;">
						<div class="form-group">
							<input type="button" value="공연장 주소검색" id="search" class="btn btn-primary" style="margin: 1%;"/> 
							<input type="text" id="realAddress" name="realAddress" disabled="disabled" style="width:80%; margin: 1%;" value="${addr }"/>
							<input type="hidden" name="addr" id="addr" value="${addr }"/>
							<input type="text" id="detailAddress" name="detailAddress" style="width:80%; margin: 1%;" value="${detailAddress }">
						</div>
					 </div>  

                     
                  </div>
               </div>

      </div>
							
   </div>



	<div class="container">

					<div class="form-group">
						<textarea  class="form-control" id="summernote" name="content" cols="250" rows="20">${onePerformanceByNo['content'] }</textarea>						
					</div>
				</div>
		<p style="text-align: center;">꿈 꿔왔던 그 날을 위해, 기다리는 팬들을 위해 화이팅! 멋진 공연 기대할게요.</p>
		<div class="row">
			<div class="col-md-3" style="margin-left: 25%;">
				<div class="form-group">
					<a href="<c:url value='/'/>"><input type="button"
						value="취소" class="btn btn-primary btn-block"></a>
				</div>
			</div>
			
	
			<div class="col-md-3">
				<div class="form-group">
					<input type="button" id="submitBtn" value="완료"
						class="btn btn-success btn-block" />
				</div>
			</div>
		</div>


</form>

<!-- ================================모임 공연 부분 끝==================================== -->









<script>

//summernote=========================================
var toolbar = [
    // 글꼴 설정
    ['fontname', ['fontname']],
    // 글자 크기 설정
    ['fontsize', ['fontsize']],
    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    // 글자색
    ['color', ['forecolor','color']],
    // 표만들기
    ['table', ['table']],
    // 글머리 기호, 번호매기기, 문단정렬
    ['para', ['ul', 'ol', 'paragraph']],
    // 줄간격
    ['height', ['height']],
    // 그림첨부, 링크만들기, 동영상첨부
    ['insert',['picture','link','video']],
    // 코드보기, 확대해서보기, 도움말
    ['view', ['help']]
  ];

var setting = {
    height : 300,
    minHeight : null,
    maxHeight : null,
    focus : true,
    lang : 'ko-KR',
    toolbar : toolbar,
    //콜백 함수
    callbacks : { 
    	onImageUpload : function(files, editor, welEditable) {
    // 파일 업로드(다중업로드를 위해 반복문 사용)
        for (var i = files.length - 1; i >= 0; i--) {
        	uploadSummernoteImageFile(files[i], this);
    		}
    	}
    }
 };
$('#summernote').summernote(setting);

function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url :"<c:url value="/uploadSummernoteImageFile.do"/>",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			console.log()
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}



//주소 찾기========================================
$('#search').click(function(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		           $('#addr').val(data.jibunAddress+' '+data.buildingName+' ')
		           $('#realAddress').val(data.jibunAddress+' '+data.buildingName+' ')
		           //$('#realAddress').val(data.address+' '+data.bname+' '+data.buildingName)  
		           // 커서를 상세주소 필드로 이동한다.
		           document.getElementById("detailAddress").focus();
		        }
		    }).open();
	});
	

//공연 대표사진 선택=============================================
$("#cma_file").change(
		function(){
		   if (this.files && this.files[0]) {
		       var reader = new FileReader();
		       reader.onload = function (e) {
		           $("#image").attr('style',
		        		   "background-image:url(\'" + e.target.result + "\');"
		        		   +"float: left; height: 376px; width: 100%; border:1px solid gray;"
		      			   +"background-repeat: no-repeat; background-size: cover;");// 배경으로 지정시
			        }
			        reader.readAsDataURL(this.files[0]);
			    }
		});
$('#imgfile').click(function() {
	console.log('fileadd');
});

	
//timepicker==============================================
$('.timepicker').timepicker({
    timeFormat: ' h:mm p',
    interval: 30,
    minTime: '9',
    maxTime: '23:30pm',
    defaultTime: ("#time"),
    startTime: '9:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
    
});
	
	
//Datepicker==================================================
$(function() {
        //input을 datepicker로 선언
        $("#datepicker").datepicker({
            dateFormat: 'yymmdd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트                
        });                             
    });
        
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd' //Input Display Format 변경
});


//빈 입력창 확인=============================================================
$('#submitBtn').click(function() {
	if($('#gdsImg').val()==""|| $('#addr').val()=="" ||$('#mainCategory').val()=="" ||$('#subCategory').val()==""||$('#title').val()==""||$('#image').val()==""||$('#operatorRole').val()==""||$('#subCategory').val()==""||$('#summernote').val()==""||$('#memberRole').val()==""){
		if(confirm('입력하지 않은 정보가 있어요! 진행 하시겠어요?')){
				
			}else{
				return;
			}
		}
		$('#frm').submit();
	});

</script>
		



