<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

table{
 
  {table-layout:fixed;word-break:break-all;}
 
}





</style>

<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<div class="container-fluid">
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-md-12">

					<table
						class="table table-bordered table-hover table-condensed text-center "
						style="margin-left: auto; margin-right: auto;  ㅋheight: 20px;">
						<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->

						<tr>
							<th style="width: 9%;" class="col-md-1 text-center">번호</th>
							<th style="width: 50%;" class="text-center">제목</th>
							<th style="width: 9%;" class="col-md-1 text-center">작성자</th>
							<th style="width:9%;" class="col-md-1 text-center">아이디</th>
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
									<td style="font-weight: bolder; color:${item.color};">${item.success} </td>
								</tr>
							</c:forEach>
						</c:if>



					</table>

					</div>

					
			
			</div>
			
			<div class="row">
						<div class="col-md-12 text-center">${pagingString}</div>
			</div>
			
		</div>
	</div>
</div>

