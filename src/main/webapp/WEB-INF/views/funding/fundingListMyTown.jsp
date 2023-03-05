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


<section class="ftco-section">
	<div class="container">
		<div class="row">

			<div class="col-12">
				<c:if test="${not empty town }" var="notTown">
					<span id="hide" style="float: left;">내동네 :<span
						style="color: green;">'${town }'</span>
					</span>
				</c:if>

				<c:if test="${not notTown }">
					<span id="hide" style="float: left;"><span
						style="color: green;">설정한 동네가 없어요</span> </span>
				</c:if>
				<span style="float: right;"> <a
					href="<c:url value="/FundingList.do"/>" id="meeting"><span
						style="font-size: 1.0em;">&nbsp;전체펀딩&nbsp;</span></a> <a
					href="<c:url value='/funding/FundingListMyTown.do'/>"><span
						style="font-size: 1.0em; font-weight: bold; color: black;"
						class="border-left">&nbsp; 내동네펀딩</span></a>
				</span>

			</div>

		</div>
		<hr />
	</div>
	<c:if test="${town ne null and town ne '' }">
		<div class="container pt-5">
		<div class="row d-flex">
						<c:if test="${not empty list}" var="listNull">
							<c:forEach var="item" items="${list }" varStatus="loop">

								<div class="col-md-4 d-flex ftco-animate">
									<div class="blog-entry justify-content-end">
										<div class="text text-center">
											<a
												href="<c:url value='/funding/MeetingViewFun.do?meetingNo=${item.meetingNo }'/>"
												class="block-20 img"
												style="background-image: url(<c:url value='/images/${item.operator }/${item.meetingName}/${item.bannerImg }' />);">
											</a>
											<div
												class="meta text-center mb-2 d-flex align-items-center justify-content-center">
												<div>
													<span class="yr" style="color: #FF7A5C">${item.subCategory }</span><span
														class="day">${item.calDateDays }</span> <span class="mos">일
														남음</span>
												</div>
											</div>
											<h3 class="heading mb-3">
												<a
													href="<c:url value='/funding/MeetingViewFun.do?meetingNo=${item.meetingNo }'/>">${item.meetingName }</a>
											</h3>
											<hr />
											<div>
												<span style="font-style: oblique; font-weight: bold;">펀딩금액
													:${item.amount }</span><span>원</span>
											</div>
											<span style="font-style: oblique; font-weight: bold;">서포터
												:${item.donationList }</span><span>명</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${not listNull }">
							<div style="margin: 0 auto; padding-top: 20%">'${town }'
								동네에서 펀딩하는 모임이 없어요 !</div>
						</c:if>

					</div>
					<!-- class="row" -->
				</div>
			
			<div class="row">
				<div class="col-md-12">${pagingString }</div>
			</div>
		
	</c:if>
</section>

<section class="ftco-section ftco-no-pt" id="section">
	<div class="container">
		<div class="row">
			<c:if test="${town eq null or town eq ''}">
				<div
					class="col-md-6 pt-3 d-flex justify-content-center align-items-center">
					<img id="real_img"
						src="<c:url value="/resources/images/quokka.png"/>"
						alt="Raised circle image" class="shadow-lg"
						style="width: 500px; height: 500px;">
				</div>
				<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
					<div class="heading-section"
						style="text-align: center; padding-top: 40%">"마이페이지에서
						개인정보수정으로 동네를 설정해보세요!"</div>
				</div>
			</c:if>
		</div>
	</div>
</section>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

