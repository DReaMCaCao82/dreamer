<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
    

    
    <!-- =======================모임 게시판부분========================= -->
    <section class="ftco-section">
         <div class="container">
            <div class="row justify-content-center">
               <div class="col-md-8">
               
	<c:forEach items="${meetingBBSList }" var="items" varStatus="status">
        <div class="main">
        
            <div class="section">

               <div class="top-section">
               		<hr>
					<!-- 작성자 -->
                    <div class="section-title">

                        <div class="profile-pic" style="height: 75px;">

                            <a href="#">
                                <img src="<c:url value="/images/${items['OPERATOR'] }/${items['MEETINGNAME'] }/${items['BANNERIMG'] }"/>"
                                	 alt="Raised circle image"
									 class="img-fluid rounded-circle shadow-lg"
									 style="width: 70px; height: 70px; margin-bottom: 0;">
                            </a>
                            <div style="display: inline; vertical-align: bottom;">
		                    	<h3 style="margin-left: 2%; margin-bottom: 20px; display: inline-block;">${items['MEETINGNAME'] } </h3>
		                    	<c:forEach items="${thisMeetingRole }" var="member">
	                        		<c:if test="${items['ID'] eq member.id }">
	                        			<h6 style="margin-left: 2%; margin-bottom: 20px; display: inline-block;">${member.name }</h6>
	                        		</c:if>
	                        	</c:forEach>
                            </div>
                            <div class="btn-group justify-content-right" style="text-align: right; float: right;">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="margin-top: 15px;">
									● ● ● <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<c:if test="${items['ID'] eq id }">
										<li><a href='<c:url value="/bbs/UpdateBBS.do?meetingbbsNo=${items['BBSNO']}"/>'>수정하기</a></li>
										<li><a href='<c:url value="/bbs/DeleteBBS.do?bbsno=${items['BBSNO']}"/>'>삭제하기</a></li>
									</c:if>
									<li><a href='<c:url value="#"/>'>신고하기</a></li>
								</ul>
							</div>
    
                        </div>

                    </div>

               </div>
					<!-- 게시글 사진 -->
					<div id="carouselExampleCaptions${status.count }" class="carousel slide" data-ride="carousel" data-interval="false">
                          <ol class="carousel-indicators">
                          	<c:forEach begin="1" end="${items.imgCount }" varStatus="statusIMG">
	                            <li data-target="#carouselExampleCaptions${status.count }" data-slide-to="${statusIMG.index-1 }"
	                             <c:if test="${statusIMG.index eq 1 }"> class="active"</c:if> aria-current="true" aria-label="${statusIMG.count }"></li>
                          	</c:forEach>
                          </ol>
                          <div class="carousel-inner" style="width: 720px; height: 388px;">
	                          <c:forEach items="${items.imgList }" var="bbsImg" varStatus="statusIMG">
	                           	<div class="carousel-item<c:if test="${statusIMG.count eq 1 }"> active</c:if>" style="height: 100%; width: 720px;">
		                             <img alt="image"
		                              	  src="<c:url value="/images/${items['OPERATOR'] }/${items['MEETINGNAME'] }/BBS/${items['BBSNO']}/${bbsImg['IMG']}"/>"
		                              	  style="width: 100%; height: 100%;">
		                        </div>
	                          </c:forEach>
                          </div>
                          <a class="carousel-control-prev" href="#carouselExampleCaptions${status.count }" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                          </a>
                          <a class="carousel-control-next" href="#carouselExampleCaptions${status.count }" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                          </a>
                        </div>
                    <!-- 
                    <div class="upload"> 
                        <img class="upload-content"  style="width: 100%;" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTBXEZnYDFnSS5mX8i9LCJAh0iAvaztg9wPKonWMlOi_yn7Hs2w">
                    </div>
                     -->

					<!-- 하트&댓글 아이콘 -->
                    <div class="upload-actions" style="margin-top: 0.5em;">
                        <a href="#">
	                        <c:choose>
	                        	<c:when test="${items.iLikeIt eq id }">
	                        		<img id="like${items['BBSNO']}" height="28px" src='<c:url value="/resources/images/heartOn.png"/>' alt="">
	                        	</c:when>
	                        	<c:otherwise>
	                        		<img id="like${items['BBSNO']}" height="28px" src='<c:url value="/resources/images/heartOff.png"/>' alt="">
	                        	</c:otherwise>
	                        </c:choose>
                            <p id="likeCount${items['BBSNO']}" style="display: inline; vertical-align: 10px;">${items.likeCount }</p>
                        </a>&nbsp;
                        <a href="#">
                            <img  height="28px" src="https://cdn0.iconfinder.com/data/icons/instagram-ui-1/24/Instagram-UI_comment-512.png" alt="">
                            <p id="countComment${items['BBSNO']}" style="display: inline; vertical-align: 10px;">${items.countComment }</p>
                        </a>&nbsp;
                        <!-- 글 작성 시간 -->
	                    <p id="postDate" style="display: inline; vertical-align: 10px;">${items['BBSPOSTDATE'] }</p>
	                    
                        <!--<a href="#" data-toggle="modal" data-target="#bbsNo${items['BBSNO'] }" data-placement="left">
                        	 <span class="more" style="display: inline; float: right;">더 보기</span> </a>-->
						<!----><a href="javascript:void(0)" id="more${items['BBSNO']}" class="more short" style="float: right;">더 보기</a>
                        
                        
                    </div>
					
                    
					<!-- 게시글 내용 -->
				<div class="box">
                    <div class="upload-caption">
                        <span class="post">
                            <span class="contents" id="contents${items['BBSNO']}">
                                ${items['CONTENTS'] }
                            </span>
                        </span>
                            
                    </div>
					<hr class="commentsHR" id="commentsHR${items['BBSNO']}">

					<!-- 댓글 -->
                    <div class="upload-caption comments" id="commentBox${items['BBSNO']}">
                        <c:forEach items="${items.comment }" var="comment">
                        	<div class="post" id="innerCommentBox${items['BBSNO']}">
                        		<span>
	                            <a href="#" class="cmt">${comment['NAME'] }</a><!-- 작성자 -->
	                            <span class="post-link" style="margin-left: 5px;"><!-- 댓글 내용 -->
	                                ${comment['CONTENTS'] }
	                            </span>
	                            <c:if test="${comment['ID'] eq id }">
		                            <span class="post-link"> 
		                               <a href="#" id="upd${comment['COMMENTNO'] }" style="font-size: 15px; ">수정</a>
		                               <a href="#" id="del${comment['COMMENTNO'] }" style="font-size: 15px; ">삭제</a></br>
		                            </span>
	                            </c:if>
	                            </span>
                        	</div>
                         </c:forEach>   
                    </div>

                    <div class="inputBox" id="inputBox${items['BBSNO']}">
                        <div class="submit">
                            <form class="ssub" method="POST">
                                <input id="textBox${items['BBSNO']}" type="text" placeholder="댓글을 입력해주세요." class="texta" style="width: 89%;"><!-- 댓글 입력창 -->
                                </input>
                                <button id="input${items['BBSNO']}" class="btn btn-primary" name="">입력</button><!-- 댓글 입력 버튼 -->
                            </form>
                        </div>
                    </div>
				  </div>
               </div> 
            </div>
		</c:forEach>

                                                                                                                                            
               </div>
               <c:forEach items="${thisMeetingRole }" var="member">
		           <c:if test="${id eq member.id }">
		               <div class="col-md-1 col-md-offset-8"
		               		style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;">
		               		<a href='<c:url value="/bbs/WriteMeetingBBS.do?meetingNo=${meetingNo }"/>'>
		                        <button class="btn btn-primary" style="width: 100px; height: 50;">작성하기</button>
							</a>
		               </div>
	               </c:if>
               </c:forEach>
               
            </div>
         </div>
        
   </section>

    <!--=========================== 게시글 없을 때====================================== -->
    <c:if test="${meetingBBSList eq null}">
	    <section class="ftco-section">
	         <div class="container">
	            <div class="row justify-content-center">
	               <div class="col-md-10" style="margin-bottom: 100px; text-align: center;">
	               
	                        게시글이 없어요
	
	
	               </div>
	            </div>
	         </div>
	        
	   </section>
   </c:if>
   <!--=========================== 게시글 없을 때====================================== -->
  
    
<script src="resources/js/jquery.min.js"></script>
<script>
var items=[];


<c:forEach items='${meetingBBSList}' var='items'>
items.push(${items});
$(document).ready(function(){
	 
    $('.box').each(function(){

        var content = $(this).find('.contents');

        var content_txt = content.text();
        var content_html = content.html();
        var content_txt_short = content_txt.substring(0,50);
        var btn_more = $('<a href="javascript:void(0)" id="more${items["BBSNO"]}" style="float: right;" class="more short">더보기</a>');

        $('.upload-caption.comments').hide();
        $('.commentsHR').hide();
        $('.inputBox').hide();
        
        if(content_txt.length >= 100){
            content.html(content_txt_short+"...");
        }else{
        	content.html(content_txt_short);
        }

    });
});

$('#more${items["BBSNO"]}').click(function(){
	var contents = '${items["CONTENTS"] }';
	var shortContents = contents.substring(0, 20)+"...";
	
	if($(this).hasClass('short')){
		console.log('더보기 누름1');
		// 접기 상태
	    $(this).html('접기');
	    console.log('더보기 누름2');
	    $('#contents${items["BBSNO"]}').html(contents);
	    console.log('더보기 누름3');
	    $('#commentBox${items["BBSNO"]}').show();
	    console.log('더보기 누름4');
	    $('#commentsHR${items["BBSNO"]}').show();
	    console.log('더보기 누름5');
	    $('#inputBox${items["BBSNO"]}').show();
	    console.log('더보기 누름6');
	    $(this).attr('class', 'no more');
	    console.log('더보기 누름7');
	}else{
		$(this).html('더 보기');
	    console.log('접기 누름2');
	    $('#contents${items["BBSNO"]}').html(shortContents);
	    console.log('접기 누름3');
	    $('#commentBox${items["BBSNO"]}').hide();
	    console.log('접기 누름4');
	    $('#commentsHR${items["BBSNO"]}').hide();
	    console.log('접기 누름5');
	    $('#inputBox${items["BBSNO"]}').hide();
	    console.log('접기 누름6');
	    $(this).attr('class', 'more short');
	    console.log('접기 누름7');
	}
});



$('#like${items["BBSNO"]}').click(function(){
	//하트 이미지 바꾸고 좋아요 숫자 바꾸고 같은 번호 게시글 상세보기도 이미지랑 숫자 바꾸기
	console.log('하트 클릭헸다');
	console.log('${items["BBSNO"]}');
	var re = ($('#like${items["BBSNO"]}').attr('src') === '/resources/images/heartOff.png') ? 'On' : 'Off';
	var src = ($('#like${items["BBSNO"]}').attr('src') === '/resources/images/heartOff.png') ? '/resources/images/heartOn.png'
            : '/resources/images/heartOff.png';
	$('#like${items["BBSNO"]}').attr('src', src);
	
	var bbsSrc = ($('#likeBBS${items["BBSNO"]}').attr('src') === '/resources/images/heartOff.png') ? '/resources/images/heartOn.png'
            : '/resources/images/heartOff.png';
	$('#likeBBS${items["BBSNO"]}').attr('src', bbsSrc);
	
	$.ajax({
		url : '<c:url value="/LikeBBSChange.do"/>',
		type : 'post',
		dataType : 'json',
		data : {'re':re, 'bbsno':'${items["BBSNO"]}'},
		success : function(data) {
			console.log(data);
			$('#likeCount${items["BBSNO"]}').text(data);
			$('#likeCountBBS${items["BBSNO"]}').text(data);
			
		}
	});
	
});



$('#input${items["BBSNO"]}').click(function(){

	var comment = $('#textBox${items["BBSNO"]}').val();
	
    if(comment!=""){
    	
    	console.log('입력된 메시지 : '+comment);
    	$.ajax({
    		url : '<c:url value="/CommentInsert.do"/>',
    		type : 'post',
    		dataType : 'json',
    		data : {'comment':comment, 'bbsno':'${items["BBSNO"]}'},
    		success : function(data){
    			console.log(data);
    			$('#innerCommentBox${items["BBSNO"]}').remove();
    			var span ="<span class='post' id='innerCommentBox${items['BBSNO']}'>";
    			for(var i=0; i<data.length; i++){
    				span +="<a href='#' class='cmt'>"+data[i].NAME+"</a>";
    				span +="<span class='post-link' style='margin-left: 5px;'>"+data[i].CONTENTS+"</span>";
    				span +="<span class='post-link'>";
    				span +="<a href='#' id='upd"+data[i].COMMENTNO+"' style='font-size: 15px;'>수정</a><a href='#' id='del"+data[i].COMMENTNO+"' style='font-size: 15px;'>삭제</a></br>";
    			}
    			span +="</span>";
             
    			$('#commentBox${items["BBSNO"]}').append(span);
    			$('#countComment${items["BBSNO"]}').text(data.length);
    			$('#textBox${items["BBSNO"]}').val('');

    		}
    	});
    	
    }else{
    	console.log('=================');
    	alert('입력된 내용이 없습니다. 댓글을 입력해주세요.');
    }

});


<c:forEach items="${items.comment }" var="comment">

// $('#upd${comment["COMMENTNO"]}').click(function(){

// 	var updComm = '수정';
// 	$('#input${items["BBSNO"]}').text(updComm);
	
// 	var id = 'updComm${comment["COMMENTNO"]}';
// 	$('#input${items["BBSNO"]}').attr('name', id);
	
// 	var content = '${comment["CONTENTS"]}';
// 	$('#textBox${items["BBSNO"]}').val(content);
// });


// $('button[name=updComm${comment["COMMENTNO"]}]').click(function(){

// 	var comment = $('#textBox${items["BBSNO"]}').val();
// 	console.log('lllllllllllllllllllllllllllllllllllllllllllll');
	
// 	$.ajax({
// 		url : '<c:url value="/CommentUpdate.do"/>',
// 		type : 'post',
// 		dataType : 'json',
// 		data : {'commentNo' : '${comment["COMMENTNO"]}' , 'comment' : comment , 'bbsno':'${items["BBSNO"]}'},
// 		success : function(data){
			
// 			$('#innerCommentBox${items["BBSNO"]}').remove();
// 			var span ="<span class='post' id='innerCommentBox${items['BBSNO']}'>";
// 			for(var i=0; i<data.length; i++){
// 				span +="<a href='#' class='cmt'>"+data[i].name+"</a>";
// 				span +="<span class='post-link' style='margin-left: 5px;'>"+data[i].contents+"</span>";
// 				span +="<span class='post-link' style='padding-left: 32em;'>";
// 				span +="<a href='#' id='upd"+data[i].commentno+"' style='font-size: 15px;'>수정</a><a href='#' id='del"+data[i].commentno+"' style='font-size: 15px;'>삭제</a></br>";
// 			}
// 			span +="</span>";
         
// 			$('#commentBox${items["BBSNO"]}').append(span);
			
// 			$('#textBox${items["BBSNO"]}').val('');

// 		}
// 	});
	
// });

var id='${id}';
$('#del${comment["COMMENTNO"]}').click(function(){
	
	$.ajax({
		url : '<c:url value="/CommentDelete.do"/>',
		type : 'post',
		dataType : 'json',
		data : {'commentNo' : '${comment["COMMENTNO"]}' , 'bbsno':'${items["BBSNO"]}'},
		success : function(data){
			//console.log(data);
			$('#innerCommentBox${items["BBSNO"]}').remove();
			var span ="<span class='post' id='innerCommentBox${items['BBSNO']}'>";
			for(var i=0; i<data.length; i++){
				span +="<a href='#' class='cmt'>"+data[i].NAME+"</a>";
				span +="<span class='post-link' style='margin-left: 5px;'>"+data[i].CONTENTS+"</span>";
				span +="<span class='post-link'>";
				span +="<a href='#' id='upd"+data[i].COMMENTNO+"' style='font-size: 15px;'>수정</a><a href='#' id='del"+data[i].COMMENTNO+"' style='font-size: 15px;'>삭제</a></br>";
			}
			span +="</span>";
         
			$('#commentBox${items["BBSNO"]}').append(span);
			$('#countComment${items["BBSNO"]}').text(data.length);

		}
	});
	
});

</c:forEach>
</c:forEach>
console.log(typeof(items));

</script>