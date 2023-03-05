<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<link href="<c:url value="/resources/summernote/summernote-lite.min.css"/>" rel="stylesheet"> 
<script src="<c:url value="/resources/summernote/summernote-lite.min.js"/>"></script>
<script src="<c:url value="/resources/summernote/lang/summernote-ko-KR.js"/>"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
    opacity: 0.5;
}

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



<div class="container">
	<div class="row">
		<div class="offset-6 col-6" >				
			<span id="hide" style="display: none; float: right;"> </span> 
			<span style="float: right;"> 
				<a href="<c:url value="/ShowUser.do"/>" id="meeting"><span
					style="font-size: 1.0em;">&nbsp;회원</span></a>
				<a href="#"><span
					style="font-size: 1.0em; font-weight: bold; color: black;" class="border-left">&nbsp;모임&nbsp;</span></a>
			</span>
		</div>
	</div>
</div>

	<!-- 배너 -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('resources/images/banner7.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate mb-0 text-center" style="background-color: rgba(239,239,239,0.9); border-radius: 12px 12px 12px 12px;">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="index.html">드림 <i class="fa fa-chevron-right"></i></a></span> <span>동네 둘러보기 <i class="fa fa-chevron-right"></i></span></p>
            <h1 class="mb-0 bread">모임 만들기</h1>
          </div>
        </div>
      </div>
    </section>


<form id="frm" method="post" enctype="multipart/form-data"
								action="<c:url value='/UpdateMeetingProcess.do'/>">
	<input type="hidden" name="operator" value="${thisMeeting['operator']}">
    <div class="filebox">
    	<div id="image"
			 style="margin:0 auto; margin-top: 5%; height: 450px; width: 70%;  border: 1px solid gray;
			 background-repeat: no-repeat; background-size: cover; background-image: url('/app/images/${thisMeeting['operator']}/${thisMeeting['meetingName']}/${thisMeeting['bannerImg']}');">
	      <div class="overlay"></div>
	      <div class="container">
	     	
	        <div class="row no-gutters align-items-center justify-content-left">
	          <div class="col-md-12 ftco-animate mb-0 text-left">
	          	<div class="col-md-12" style="padding-top: 2%; max-width: initial;">
		          	<p class="breadcrumbs mb-0" style="padding-top: 2%;">
		          		<select name="mainCategory" id="mainCategory">
					      <option disabled selected>대분류</option>
						  	<c:forEach items="${ mainCategory}" var="item" >
						  		<c:choose>
						  			<c:when test="${item['MAINCATEGORY'] eq mainCate}" >
						  				<option selected >${item["MAINCATEGORY"] }</option>
						  			</c:when>
						  			<c:otherwise>
						  				<option>${item["MAINCATEGORY"] }</option>
						  			</c:otherwise>
						  		</c:choose>
						  	</c:forEach>
					    </select>
					     > 
					    <select name="subCategory" id="subCategory">
					      <option disabled selected>소분류</option>
					      <option disabled selected>${subCate }</option>
					    </select>
		          	</p>
				</div>
	          	
	            <div class="col-md-10" style="padding-top: 2%; max-width: initial;">
					<input type="text" class="form-control" name="title" id="title" value="${thisMeeting['meetingName'] }" style="width: 60%">
				</div>
				
				<div class="col-md-10" style="padding-top: 2%; margin-bottom: 5%">
					<div class="form-group">
						<input type="button" value="주소검색" id="search"
							class="btn btn-primary" /> 
						<input type="text" disabled="disabled" id="realAddress" name="realAddress" value="${thisMeeting['town'] }"/>
						<input type="hidden" name="addr" id="addr" value="${thisMeeting['town'] }"/>
					</div>
				</div>
				
				<div class="text-right">
					<div>
						<label for="cma_file" id="imgfile">모임 배너 사진 선택</label>
        				<input type="file" name="cma_file" id="cma_file" value="${thisMeeting['bannerImg']}" style="display: none;"/>
					</div>
				</div>
				
	          </div>
	        </div>
	      </div>
	    </div>
    </div>
    <p style="text-align: center;">※ 주소는 활동 지역 주민센터로 검색해주세요. 모임 리스트에 노출시 필터링 기준이 됩니다.</p>
    <p style="text-align: center;">※ 모임의 메인 이미지는 가로로 긴 이미지를 선택하시면 좋습니다.</p>
	
	<div class="container px-md-12">
		<div class="row justify-content-between">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-10" style="max-width: initial; flex: initial;">
						<div class="contact-wrap w-100">
									
								<div class="col-md-10" style="margin-top: 5%; margin-bottom: 5%; max-width: fit-content; padding-left: 0;">
									<div class="form-group">
										<c:forEach var="memberRole" items="${memberRole }">
											<c:if test="${thisMeeting['operator'] eq memberRole.id }">
												<input type="text" style="width: 17em" class="form-control" name="operatorRole" value="${memberRole.roleName }" />
											</c:if>
										</c:forEach>
									</div>
									<div class="form-group">
										<input type="button" value="역할 만들기" id="makeRole" class="btn btn-primary" onclick="add_div()"/>
										
									</div>
									
										<div class="form-inline">
								        	<div id="field">
								        	<c:forEach var="memberRole" items="${memberRole }">
									        	<c:if test="${thisMeeting['operator'] ne memberRole.id }">
									        		<c:if test="${memberRole.id ne null }">
										        		<div>
										        			<input type='text' id='memberRole' name='memberRole' class='form-control' value="${memberRole.roleName }"/>
										        			<input type='button' style='background-color:#f19c05 ; color:white; border:none; border-radius:5px; height:52px;' value=' - '>
										        			<p>※인원이 분배된 역할은 수정 및 삭제 불가합니다. 관리자에게 문의하세요</p>
										        			<input type="hidden" name="roleNo" value="${memberRole.roleNo }"/>
										        		</div>
									        		</c:if>
									        		<c:if test="${memberRole.id eq null }">
										        		<div>
										        			<input type='text' id='memberRole' name='memberRole' class='form-control' value="${memberRole.roleName }"/>
										        			<input type='button' style='background-color:#f19c05 ; color:white; border:none; border-radius:5px; height:52px;' value=' - ' onclick='remove_div(this)'>
										        			<input type="hidden" name="roleNo" value="${memberRole.roleNo }"/>
										        		</div>
									        		</c:if>
								        		</c:if>
								        	</c:forEach>
								        	</div>
										</div>
								</div>

								<div>
									<div class="form-group">
										<textarea class="form-control" id="summernote" name="content" style="width: 100%; height: 400px;" placeholder="내용을 입력하세요">${thisMeeting.meetingDescription }</textarea>
									</div>
								</div>
									
							</div>
					</div>
				</div>
			<!-- 로고 가운데 배치용 -->
			<div class="col-md-4 d-flex"></div>
		</div>
	</div>
	<p style="text-align: center;">※모임은 생성일로부터 6개월간 진행됩니다. 즐거운 모임만드세요!</p>
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
							



<script>

//대분류에 따른 소분류 에이작스==============================================
$('#mainCategory').change(function(){
	console.log('대분류 바뀌었음');
	$('#subCategory').empty();
	$.ajax({
		url : "<c:url value="/categoryAjax.do"/>",
		type : 'post',
		dataType : 'json',
		data : "mainCategory=" + $('#mainCategory').val(),
		success : function(data) {
			
			 $.each(data.subCategory, function(idx, element) {
			 	console.log(element['SUBCATEGORY']);
			 	
			 	var option = document.createElement('option');
			     option.innerHTML = ""+element['SUBCATEGORY']+"";
				document.getElementById('subCategory').appendChild(option);
			 });
			}
		});
	});


//동네선택====================================================================
$('#search').click(function(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		           $('#addr').val(data.address)
		           $('#realAddress').val(data.address)  
		        }
		    }).open();
	});



//써머노트==========================================================================
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
    // 도움말
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
	
	
//역할 추가=================================================================
function add_div(){
console.log(document.getElementById('field').childElementCount);
  if(document.getElementById('field').childElementCount==19){
  	   alert('모임 인원은 19명까지 모집 가능합니다.');
  	   return;
     }
     var div = document.createElement('div');
     div.innerHTML = "<input type='text' id='memberRole' name='memberRole' class='form-control'></input><input type='button' style='background-color:#f19c05 ; color:white; border:none; border-radius:5px; height:52px; margin-left: 4px; ' value=' - ' onclick='remove_div(this)'>";
     document.getElementById('field').appendChild(div);
}

function remove_div(obj){
console.log(obj);
document.getElementById('field').removeChild(obj.parentNode);
}

	
//이미지 추가==============================================================
$("#cma_file").change(
		function(){
		   if (this.files && this.files[0]) {
		       var reader = new FileReader();
		       reader.onload = function (e) {
		           $("#image").attr('style',
		        		   "background-image:url(\'" + e.target.result + "\');"
		        		   +"margin:0 auto; margin-top: 5%; height: 450px; width: 70%;  border: 1px solid gray;"
		      			   +"background-repeat: no-repeat; background-size: cover; ");// 배경으로 지정시
			        }
			        reader.readAsDataURL(this.files[0]);
			    }
		});	
		
//빈 입력창 확인=============================================================
$('#submitBtn').click(function() {
	if($('#cma_file').val()==""
			|| $('#addr').val()=="" 
			||$('#mainCategory').val()=="" 
			||$('#subCategory').val()==""
			||$('#title').val()==""
			||$('#operatorRole').val()==""
			||$('#summernote').val()==""
			||$('#memberRole').val()==""){
		if(confirm('입력하지 않은 정보가 있어요! 진행 하시겠어요?')){
				
			}else{
				return;
			}
		}
		$('#frm').submit();
	});
	

</script>




