<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--@ page session="false"--%>

<div class="page-breadcrumb"
	style="padding-top: 100px; padding-left: 300px; padding-bottom: 50px">
	<div class="row">
		<div class="col-7 align-self-center">
			<div class="d-flex align-items-center">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb m-0 p-0">
						<li class="breadcrumb-item"><a href="#" class="text-muted">회원관리</a>
						</li>
						<li class="breadcrumb-item text-muted active" aria-current="page">
							정지된 모임 조회</li>
					</ol>
				</nav>
			</div>
			<small>&nbsp;</small>
			<h4
				class="page-title text-truncate text-dark font-weight-medium mb-1">
				정지된 모임 조회</h4>
			<div class="d-flex align-items-center"></div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<form class="form-horizontal" method="post"
				action="<c:url value='/Admin/Member/SearchMeeting.do'/>">
				<div class='row col-12'>
					<input type="text" class="form-control col-4 offset-7" id="keyword"
						name="keyword" value="${map.keyword}" placeholder="모임명을 입력하세요" />
					<button type="submit" class="btn btn-primary" id="searchBtn"
						style="margin-left: 20px">조회</button>
				</div>
			</form>
		</div>
	</div>
</div>

<section>
	<div class="container">
		<div class="row" style="margin-top: 20px;">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<!--id="zero_config" table-striped -->
								<thead>
									<tr
										style="background-color: #5F76E8; opacity: .5; color: white">
										<th>No</th>
										<th>Name</th>
										<th>Reason</th>
										<th>Operator</th>
										<th>Suspended Date</th>
										<th>Release</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${SuspendMeetingList}" var="item">
										<tr>
											<td>${item['MEETINGNO']}</td>
											<td>${item['MEETINGNAME']}</td>
											<td>${item['REASON']}</td>
											<td>${item['OPERATOR']}</td>
											<td><fmt:formatDate pattern="YYYY-MM-dd" value="${item['SUSPEND']}"/></td>
											<td><c:if test="${item['ENABLED'] eq 0}">
													<a href='<c:url value="/Admin/Meeting/MeetingSuspendRelease.do?operator=${item['OPERATOR']}"/>'>
														해제</a>
												</c:if> <c:if test="${item['ENABLED'] eq 1}">
													해제 완료
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>