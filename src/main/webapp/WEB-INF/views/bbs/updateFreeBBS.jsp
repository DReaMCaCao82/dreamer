<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/style.css">


<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<link href="<c:url value="/resources/summernote/summernote-lite.min.css"/>" rel="stylesheet"> 
<script src="<c:url value="/resources/summernote/summernote-lite.min.js"/>"></script>
<script src="<c:url value="/resources/summernote/lang/summernote-ko-KR.js"/>"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
label {
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
    margin-left: 1.5rem;
    margin-top: 3rem;
    opacity: 0.5;
}
 
input[type="file"] {  /* 파일 필드 숨기기 */
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
</style>



<!-- 게시판 선택 메뉴 -->
<div class="container">
	<div class="row">
		<div class="offset-6 col-6">
			<span id="hide" style="display: none; float: right;"> </span> 
			<span style="float: right; width: 45%;">
				<a href="<c:url value='/bbs/MeetingBBS.do'/>">
					<span style="font-size: 1.0em;">&nbsp;모임&nbsp;</span>
				</a>
				<a href="<c:url value='/bbs/FreebbsList.do'/>" id="meeting">
					<span style="font-size: 1.0em; color: black;" class="border-left">&nbsp;자유</span>
				</a>
			</span>
		</div>
	</div>
</div>
	
<!--=================== 배너==========================-->
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/resources/images/banner10.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate mb-0 text-center" style="background-color: rgba(239,239,239,0.9); border-radius: 12px 12px 12px 12px;">
				<p class="breadcrumbs mb-0">
					<span class="mr-2"><a href="index.html">드림 <i class="fa fa-chevron-right"></i></a></span>
					<span>게시판 <i class="fa fa-chevron-right"></i></span>
				</p>
				<h1 class="mb-0 bread">모임의 새로운 소식을 전해보세요!</h1>
			</div>
		</div>
	</div>
</section>


	<!-- =======================모임 게시판부분========================= -->
    <section class="ftco-section">
        <div class="container">

               <div class="row">
				<div class="col-md-9" style="margin: auto;">
					<form id="frm" class="form-horizontal"  enctype="multipart/form-data" method="post" action="<c:url value='/bbs/UpdateProcessMeetingBBS.do'/>">
						
						<input type="hidden" id="bbsno" name="bbsno" value="${thisBBS['BBSNO'] }">
						<div class="form-group">
							<input type="button" value="사진 추가" id="makeRole" class="btn btn-primary" onclick="add_div()"/>
							<p style="display: inline;">※ 모임 게시판은 최소 1장, 최대 5장의 사진 첨부를 할 수 있습니다.</p>
						</div>
						
						<div class="form-inline">
				        	<div id="field" class="row" style="margin-left: 1%; margin-bottom: 2%;">
				        		<c:forEach var="images" items="${thisBBS['imgList'] }" varStatus="status">
			        				<div>
						        		<div id="image${status.index+1 }" name="image${status.index+1 }" style="margin:0 auto; margin-top: 5%; height: 162px; width: 162px; border: 1px solid gray; background-repeat: no-repeat; background-size: cover;
						        																				background-image: url('/app/images/${thisBBS['ID']}/BBS/${thisBBS['BBSNO']}/${images['IMG']}');">
			     				 			<div>
				     				 			<label for="cma_file${status.index+1 }" disabled="disabled">사진 선택</label>
									 			<input type="file" name="cma_file" id="cma_file${status.index+1 }" value="${images['IMG'] }" onchange="getThumbnailPrivew(this,$('#image${status.index+1 }'))"/>
									 			<input type="hidden" name="imgNo" value="${images['IMGNO'] }"/>
								 			</div>
							 			</div>
							 			<input type="button" style="background-color:#03318c; color:white; border:none; border-radius:5px; height:30px; margin-left:50px;" value="삭제" onclick="remove_div(this)">
							 		</div>
				        		</c:forEach>
				        	</div>
						</div>
						
						<div class="form-group">
							<!-- 중첩 컬럼 사용 -->
							<div>
								<div class="row">
									<textarea id="summernote" name="content" style="width: 100%; height: 400px;" placeholder="내용을 입력하세요">${thisBBS['CONTENTS'] }</textarea>
								</div>
							</div>
						</div>
						
						<!-- 이미지 -->      
						<div class="row">
							<div class="col-md-3" style="margin-left: 25%;">
								<div class="form-group">
									<a href="<c:url value='/'/>"><input type="button" value="취소" class="btn btn-success btn-block"></a>
								</div>
							</div>
							
					
							<div class="col-md-3">
								<div class="form-group">
									<input type="button" id="submitBtn" value="완료" class="btn btn-primary btn-block" />
								</div>
							</div>
						</div>
		
					</form>
				</div>
			</div>

         </div>
   </section>



<script type="text/javascript">

//역할 추가=================================================================
var i=${thisBBS['imgCount']}+1;
function add_div(){
console.log(document.getElementById('field').childElementCount);
console.log("추가 전 : "+i);
  if(document.getElementById('field').childElementCount==5){
  	   alert('사진은 5장까지 추가 가능합니다.');
  	   return;
     }
     var div = document.createElement('div');
     div.innerHTML = "<div id=\"image"+i+"\" name=\"image"+i+"\" style='margin:0 auto; margin-top: 5%; height: 162px; width: 162px; border: 1px solid gray; background-repeat: no-repeat; background-size: cover;'>"+
     				 "<div><label for=\"cma_file"+i+"\" disabled='disabled'>사진 선택</label>"+
					 "<input type='file' name='cma_file' id=\"cma_file"+i+"\" onchange=\"getThumbnailPrivew(this,$(\'#image"+i+"\'))\"/>"+
					 "</div></div><input type='button' style='background-color:#FFB8A8; color:white; border:none; border-radius:5px; height:30px; margin-left:50px;' value='삭제' onclick='remove_div(this)'>";
     document.getElementById('field').appendChild(div);
     i=i+1;
     console.log("추가 후 : "+i);
}

function remove_div(obj){
	console.log("삭제?"+obj);
	document.getElementById('field').removeChild(obj.parentNode);
}
	
	
//이미지 추가==============================================================

function getThumbnailPrivew(html, $target) {
    if (html.files && html.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $target.css('background-image', 'url(\"' + e.target.result + '\")'); // 배경으로 지정시
        }
        reader.readAsDataURL(html.files[0]);
    }
}


//빈 입력창 확인=============================================================

$('#submitBtn').click(function() {
	if($('#summernote').val()=="" ||$('#cma_file').val()==""){
		if(alert('입력하지 않은 정보가 있어요!')){
				
			}else{
				return;
			}
		}
		$('#frm').submit();
	});

</script>
