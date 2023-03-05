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
							모임 조회</li>
					</ol>
				</nav>
			</div>
			<small>&nbsp;</small>
			<h4
				class="page-title text-truncate text-dark font-weight-medium mb-1">
				모임 조회</h4>
			<div class="d-flex align-items-center"></div>
		</div>
	</div>
</div>

<section>
	<div class="container">
		<div class="row" style="padding-left: 50px;">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<!--id="zero_config" table-striped -->
								<thead>
									<tr
										style="background-color: #5F76E8; opacity: .5; color: white">
										<th>Status</th>
										<th>No</th>
										<th>Name</th>
										<th>Leader</th>
										<th>Open Date</th>
										<th>End Date</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${MeetingList}" var="item">
										<tr>
											<td>${item['ENABLED']}</td>
											<td>${item['MEETINGNO']}</td>
											<td>${item['MEETINGNAME']}</td>
											<td>${item['OPERATOR']}</td>
											<td><fmt:formatDate pattern="YYYY-MM-dd" value="${item['OPENDATE']}"/></td>
											<td><fmt:formatDate pattern="YYYY-MM-dd" value="${item['ENDDATE']}"/></td>
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