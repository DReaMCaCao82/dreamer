<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.subMenu {
	display: none;
}

.imageText {
	position: relative;
	text-align: center;
	color: red;
}

.imageText:hover div {
	opacity: 1
}

.imageText div {
	position: absolute;
	background-color: red;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
	opacity: 0;
}

.imageText:hover img {
	filter: brightness(50%);
}

table { {
	table-layout: fixed;
	word-break: break-all;
}
}
</style>
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container-fluid">

	</div>
</nav>

<section class="ftco-section testimony-section ftco-no-pb">

<div class="container-fluid">
	<div class="page-breadcrumb">
		<div class="row">
			<div class="offset-10 col-1" style="margin-top: 10px; margin-bottom: 1%; ">
				<a href="<c:url value='Mypage.do'/>" class="btn btn-success">마이페이지</a>
			</div>
			<div class="offset-2 col-8">
					<table
						class="table table-bordered table-hover table-condensed text-center "
						style="margin-left: auto; margin-right: auto; height: 20px;">
						<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
						<thead>
							<tr>
							<tr>
								<th style="width: 9%;" class="col-md-1 text-center">번호</th>
								<th style="width: 50%;" class="text-center">제목</th>
								<th style="width: 9%;" class="col-md-1 text-center">작성자</th>
								<th style="width: 9%;" class="col-md-1 text-center">아이디</th>
								<th style="width: 9%;" class="col-md-2 text-center">작성일</th>
								<th style="width: 8%;" class="col-md-2 text-center">답변여부</th>
							</tr>


						</thead>
						<tbody>
							<c:if test="${empty list }" var="isEmpty">
								<tr>
									<td colspan="6">등록된 게시물이 없어요</td>
								</tr>
							</c:if>
							<c:if test="${not isEmpty}">
								<c:forEach var="item" items="${list }" varStatus="loop">
									<tr>
										<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
										<td class="text-left"><a href="javascript:row()">${item['TITLE']}</a></td>
										<td>${item.NAME}</td>
										<td>${item.ID}</td>
										<td>${item.BBSPOSTDATE}</td>
								<td style="font-weight: bolder; color:${item.color};">${item.success}
									</tr>
									<tr style="display: none">
										<td colspan="5">
											<div class="container">
												<div class="row">
													<div class="col-md-8">
														<p>${item['CONTENTS'] }</p>
													</div>

												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				
				</div>
			</div>
		</div>
	</div>

</section>

<%-- 
<div class="row">
	<div class="col-md-12">

		<table
			class="table table-bordered table-hover table-condensed text-center "
			style="margin-left: auto; margin-right: auto; height: 20px;">
			<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->

			<tr>
				<th style="width: 9%;" class="col-md-1 text-center">번호</th>
				<th style="width: 50%;" class="text-center">제목</th>
				<th style="width: 9%;" class="col-md-1 text-center">작성자</th>
				<th style="width: 9%;" class="col-md-1 text-center">아이디</th>
				<th style="width: 9%;" class="col-md-2 text-center">작성일</th>
				<th style="width: 8%;" class="col-md-2 text-center">답변여부</th>
			</tr>
			<c:if test="${empty list }" var="isEmpty">
				<tr>
					<td colspan="4">등록된 게시물이 없어요</td>
				</tr>
			</c:if>
			<c:if test="${!isEmpty}">
				<c:forEach var="item" items="${list}" varStatus="loop">
					<tr style="font-size: 13px">
						<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
						<td class="text-left"><a ${item.none}
							href="<c:url value='/QuestionsAdminlistOne.do?bbsNo=${item.BBSNO}&nowPage='/><c:out value='${param.nowPage}' default='1'/>">${item["TITLE"]}</a>
						</td>
						<td>${item.NAME}</td>
						<td>${item.ID}</td>
						<td>${item.BBSPOSTDATE}</td>
						<td style="font-weight: bolder; color:${item.color};">${item.success}
						</td>
					</tr>
				</c:forEach>
			</c:if>



		</table>

	</div>



</div>

<div class="row">
	<div class="col-md-12 text-center">${pagingString}</div>
</div>

--%>
<script>
	function row() {
		$('td a').click(function() {
			var obj = $(this);
			var display = obj.parent().parent().next().css('display')
			if (display == 'none')
				obj.parent().parent().next().show();
			else
				obj.parent().parent().next().hide();
		});
	}
</script>