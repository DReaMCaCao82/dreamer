
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-7 align-self-center">
				<h4
					class="page-title text-truncate text-dark font-weight-medium mb-1">카테고리
					관리</h4>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<a data-toggle="modal" href="#modalContactForm"
								class="float-right btn btn-success" style="margin-bottom: 10px;">등록</a>
							<div class="table-responsive">

								<table id="zero_config"
									class="table table-striped table-bordered no-wrap">
									<thead>
										<tr>
											<th>번호</th>
											<th>Maincatrgory</th>
											<th>Subcategory</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty list }" var="isEmpty">
											<tr>
												<td colspan="3">등록된 게시물이 없어요</td>
											</tr>
										</c:if>
										<c:if test="${!isEmpty}">
											<c:forEach var="item" items="${list }" varStatus="loop">
												<tr>
													<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
													<td class="text-left"><a href="<c:url value='#'/>">${item['maincategory']}</a></td>
													<td>${item["subcategory"]}</td>
													<td><a
														href="<c:url value='/CategoryDelete.do?categoryno=${item["categoryno"]} '/>"><button
																class="btn btn-danger">삭제</button></a></td>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<ul class="pagination float-right">${pagingString}
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="modalContactForm" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">카테고리 추가</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<form class="form-horizontal" method="post" id="modalForm" action="javascript:report();">

				<div class="modal-body mx-3">
					<div class="md-form mb-5">
						 <label
							data-error="wrong" data-success="right" for="form34">Maincategory</label> <input
							type="text" id="form34" class="form-control validate"
							name="maincategory">
					</div>
					<div class="md-form mb-5">
						 <label
							data-error="wrong" data-success="right" for="form34">Subcategory</label> <input
							type="text" id="form34" class="form-control validate"
							name="subcategory">
					</div>

				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="submit" class="btn btn-success">Send</button>
				</div>

			</form>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function report() {
		

		$.ajax({
			url :"<c:url value="Categoryadd.do"/>", 
			type : 'post',
			dataType : "text",
			data : $("#modalForm").serialize(),
			success : function(data) {
				alert(data);
				$('#modalContactForm').modal("hide");
			}
		});

	}
</script>