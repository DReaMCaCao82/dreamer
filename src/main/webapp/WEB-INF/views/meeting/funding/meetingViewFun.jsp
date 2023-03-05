<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




    <!-- ================================모임 펀딩 부분==================================== -->
   
   <c:if test="${empty dto }">
		<section class="ftco-section">
			<div class="container" style="margin-top: 100px;">
				<div class="row justify-content-center">
					<div class="col-md-10" style="margin-top: 100px; margin-bottom: 100px; text-align: center;">
               
                        진행 중인 펀딩이 없습니다.

					</div>
				</div>
			</div>
		</section>
   </c:if>
   <c:if test="${not empty dto }">
   <section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">${dto.subCategory }</span>
				<h2>${dto.meetingName }</h2>
			</div>
		</div>
		<div class="row">
			<div class="">
				<div class="item">
					<div class="col-md-6 img img-3 " style="float: left;">
						<img style="height: 100%; width: 100%"
							src="<c:url value='/images/${dto.operator }/${dto.meetingName}/${dto.bannerImg }'/>" alt="image">
					</div>
					<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5"
						style="float: right;">
						<div class="heading-section">
							<h2 class="mb-4" style="font-size: 35px">${dto.calDateDays }일 남음</h2>
							<hr />
							<span style="font-weight: bold;">${dto.amount }</span><small>원 펀딩</small>
							<br />
							<div style="margin-top: 10%">
								<span style="font-weight: bold;">${dto.donationList }</span><small>명의 서포터</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<blockquote class="pt-3">
	          	<span class="fa fa-quote-left"></span>
	          	<p>${dto.meetingDescription }</p>
	          	<span class="fa fa-quote-right" style="float: right;"></span>
	          </blockquote>
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<form class="form-inline">
					<div class="form-group col-md-12 offset-md-3" style="margin-top: 10%">
						<input type="text" class="form-control" name="cost"
							id="cost" placeholder="0원">&nbsp;<input id="funding" type="button" class="form-control btn btn-success" value="펀딩하기" /></a>

					</div>
					
				</form>

			</div>
		</div>
	</div>
</section>
</c:if>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$('#cost').submit(function(){
	$('#funding').click();
});
$('#funding').click(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
		pg : 'inicis', // version 1.1.0부터 지원.
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '펀딩하기',
		amount : $('#cost').val(),
		buyer_email : 'iamport@siot.do',
		buyer_name : '구매자이름',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 삼성동',
		buyer_postcode : '123-456'
	}, function(rsp) {
		if (rsp.success) {
			
			$.ajax({
				url : "<c:url value="/ajaxFunding.do"/>",
				type : 'post',
				dataType : 'json',
				data : "donation=" + rsp.paid_amount+"&meetingNo="+${dto.meetingNo},
				success : function(data) {

					
				}
			});
			
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			
			location.href="<c:url value='/funding/MeetingViewFun.do?meetingNo="+${dto.meetingNo}+"'/>"
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
	$('#cost').val("");
});
	</script>
    <!-- ================================모임 펀딩 부분 끝==================================== -->    
  
  
  
