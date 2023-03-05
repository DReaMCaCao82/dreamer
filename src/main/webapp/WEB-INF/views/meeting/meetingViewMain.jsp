<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<!-- 모임 상세보기 main -->
<section class="ftco-section" style="margin-top: 0;">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-md-10" style="margin-top: 30px">
            <div class="heading-section text-center ftco-animate pb-4">
            </div>
            <span class="fa fa-quote-left"></span>
            <p>${meetingDTO['meetingDescription']}</p>
			<span class="fa fa-quote-right" style="float: right;"></span>
            <form method="POST" id="contactForm" name="contactForm"
               class="contactForm">
               <blockquote class="blockquote my-5">
                  <div class="row" style="padding-top: 30px">
                     <!-- 인원 -->
                     <div class="col-md-6">
                        <div class="form-group">
                           <label class="label" for="">인원</label>
                        </div>
                     </div>
                     
                     <div class="col-md-3">
                     ${roleMember} / ${meetingDTO['maxrole']}
                     </div>
                     
                     <c:set var="doneloop" value="false"/>
                     <c:forEach var="item" items="${thisMeetingRole}">
                     	<c:if test="${not doneloop }">
                     		<c:if test="${item.id eq id and item.enabled ne 0 }" >
								<c:set var="doneloop" value="true"/>
	                     	</c:if>
	                        <c:if test="${empty item.id and empty Mdto and 2>joinMcount and item.id ne id and myMeetingNo ne item.meetingNo }" >
								<div class="col-md-3">
									<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#joinMeetingSubscription">
										모임 가입하기
									</button>
								</div>
								<c:set var="doneloop" value="true"/>
	                     	</c:if>
                     	</c:if>
	                    <c:if test="${id ne meetingDTO['operator'] and item.id eq id and item.enabled eq 1}">
	                    	<div class="col-md-3">
								<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#deleteMyMeeting">
									모임 탈퇴하기
								</button>
							</div>
	                    </c:if>
                     </c:forEach>

                     <!-- 역할 -->
                     <div class="col-md-6">
                        <div class="form-group">
                           <label class="label" for="">역할</label>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <c:forEach var="item" items="${thisMeetingRole}">
                        	<c:choose>
                        	<c:when test="${item.enabled eq 0 and not empty item.id }">
                       			${item.roleName } / 가입 승인 대기중</br>
                       		</c:when>
                        	<c:otherwise>
                        		${item.roleName } / ${item.name }</br>
                        	</c:otherwise>
                        	</c:choose>
                        </c:forEach>
                     </div>

                     <!-- 활동 사진 -->
                     <div class="col-md-12" style="margin-top: 10px;">
                        <div class="form-group">
                           <label class="label" for="#">활동 사진</label>
                        </div>
                     </div>
                     <div class="col-md-12">
                        <div class="form-group">
                           <div>
                           	  <c:if test="${not empty bbsImg }">
                          		<c:forEach items="${bbsImg }" var="img" varStatus="status">
                          			<c:if test="${status.index < 6 }">
		                           		<img alt="image" style="height: 250px; width: 300px;"
		                                 	 src="<c:url value="/images/${meetingDTO['operator']}/${meetingDTO['meetingName']}/BBS/${img['BBSNO'] }/${img['IMG'] }"/>">
                                 	 </c:if>
                                 </c:forEach>
                              </c:if>
                              <c:if test="${empty bbsImg }">
                              	<p style="text-align: center;">사진이 없습니다.<br/>모임 게시판에 활동 내용을 공유해보세요!</p>
                              </c:if>
                           </div>
                        </div>
                     </div>
                  </div>
               </blockquote>
            </form>
         </div>
      </div>
   </div>

</section>

         

<!-- ======================가입신청 모달================== -->
<div class="modal fade bs-example-modal-md" id="joinMeetingSubscription" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
      	<h4 class="modal-title" id="myModalLabel">모임 가입신청하기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
      	하나의 역할을 선택하여 모임 가입 신청을 할 수 있습니다.<br>
      	가입 승인 이후에 선택한 역할을 변경하실 경우 모임 인원들과 협의 후 관리자에게 문의 바랍니다.<br>
      	모임은 2개까지 가입 가능하며 모임장은 다른 모임에 가입 할 수 없습니다.
      	따라서 가입된 모임이 하나라도 있을 경우 모임 개설이 불가합니다.<br>
      	가입 신청이 승인되면 마이페이지의 가입한 모임 목록에서 확인하실 수 있습니다.<br><br>
      
      <form id="frm" method="post" action='<c:url value="/JoinMeetingSubscription.do?meetingNo=${meetingDTO['meetingNo'] }&id=${id }"/>'>
      	<c:forEach var="item" items="${thisMeetingRole}">
      		<c:if test="${empty item.id}">
        		<input type="radio" name="selectRole" value="${item.roleNo }"> ${item.roleName }<br>
        	</c:if>
        </c:forEach>
      </div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
       		<button class="btn btn-primary" type="submit" id="submitBtn" >가입신청하기</button>
      	</div>
      </form>
    </div>
  </div>
</div>


<!-- ==========모임 탈퇴 Modal============== -->
<div class="modal fade" id="deleteMyMeeting" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      	<h4 class="modal-title" id="myModalLabel">모임 탈퇴하기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <c:forEach var="item" items="${myMeeting }">
        	<c:if test="${item.meetingNo eq meetingDTO['meetingNo'] }">
        		정말 "${item.roleName }"역할을  포기하고 ${meetingDTO['meetingName'] }을(를) 탈퇴하시겠습니까?
        	</c:if>
        	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <a href='<c:url value="/DeleteMyMeeting.do?roleNo=${item.roleNo }"/>'>
	        	<button class="btn btn-primary" type="button" id="submitBtn" >탈퇴하기</button>
	        </a>
        </c:forEach>
      </div>
    </div>
  </div>
</div>


<script>

//모임 메인================================================================================================
//모임 가입신청
$('#submitBtn').click(function() {
		$('#frm').submit();
	});

</script>