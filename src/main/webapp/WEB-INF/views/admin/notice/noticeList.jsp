<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			 <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">공지사항</h4>
                    </div>
                </div>
            </div>
			<div class="container-fluid">
				<div class="page-breadcrumb">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<a href="<c:url value="/Admin/Notice/Write.do"/>" class="float-right btn btn-success" style="margin-bottom: 10px;">등록</a>
									<div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th>번호</th>
                                                <th>제목</th>
                                                <th>활성화</th>
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
												<td>${totalRecord - (((nowPage - 1) * pageSize) + loop.index)}</td>
												<td class="text-left"><a href="<c:url value='#'/>">${item['TITLE']}</a></td>
												<td>
													<c:if test="${item['ENABLED'] == 1}" var="result">
														<button id="${item['NOTICENO']}" class="btn btn-success">Y</button>
													</c:if>
													<c:if test="${not result}">
														<button id="${item['NOTICENO']}" class="btn btn-success">N</button>
													</c:if>
												</td>
											</tr>
											<tr style="display:none">
											    <td colspan="5">
											    	<div class="container">
												      <div class="row">
												      	<div class="offset-2 col-8" >
												      		<p>${item['CONTENT'] }</p>
												      	</div>
												      	<div class="offset-8 col-2">
												      		<a class="btn btn-success" href="<c:url value="/Admin/Notice/Update.do?noticeno=${item['NOTICENO']}"/>">수정</a>
												      		<a class="btn btn-success" href="<c:url value="/Admin/Notice/DeleteProcess.do?noticeno=${item['NOTICENO']}"/>">삭제</a>
												      	</div>
												      </div>
											      </div>    
											    </td>
											  </tr>
										</c:forEach>
									</c:if>
                                        </tbody>
                                    </table>
                                    <ul class="pagination float-right">
                                        ${pagingString}
                                    </ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$('td a').click(function() {
	var obj = $(this);
	var display=obj.parent().parent().next().css('display')
	if(display == 'none')
		obj.parent().parent().next().show();
	else
		obj.parent().parent().next().hide();
});
$('td button').click(function() {
	var id = $(this).prop('id');
	
	if($(this).text() == 'Y'){
		var enabled = 0;
		$(this).text('N')
	}else{
		var enabled = 1;
		$(this).text('Y')
	}
	$.ajax({
		url:"<c:url value="/Admin/Notice/ToggleEnabled.do"/>",
		data:"noticeno="+id+"&enabled="+enabled,
		type:"post",
		success:function(data){
			console.log('성공')
		}
	});
});

</script>

