<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Modal -->
<div class="modal fade" id="myModal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="background: #f6f6f5">
				<h4 class="modal-title" id="myModalLabel">조치하기</h4>

				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div>
					<p id="meetingName">모임명: </p>
					<p id="operator">모임장: </p>
					<hr />
				</div>
				<form class="form-horizontal" method="post" id="modalForm" action="#">
					<input name="meetingno" type="hidden" value=""/>
					<input name="maccusationno" type="hidden" value=""/>
					<div class="form-group">
						<label>조치 사유</label>
						<div>
							<select name="reason" class="form-control">
								<option value="무죄">무죄</option>
								<option value="부적절한 홍보 게시글">부적절한 홍보 게시글</option>
								<option value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 내용</option>
								<option value="명예훼손/사생활 침해 및 저작권침해등">명예훼손/사생활 침해 및 저작권침해등</option>
								<option value="기타사유">기타사유</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>조치 내용</label>
						<div>
							<select name="result" class="form-control">
								<option value="무죄">무죄</option>
								<option value="경고 1회">경고 1회</option>
								<option value="경고 2회">경고 2회</option>
								<option value="모임 정지">모임 정지</option>
							</select>
						</div>
					</div>
					<hr />
					<div class="form-group">
						<div class="offset-4 ">
							<button type="button" name="submit" class="btn btn-success">조치하기</button>
							<button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	 <div class="page-breadcrumb">
              <div class="row">
                  <div class="col-7 align-self-center">
                      <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">모임 신고현황</h4>
                  </div>
              </div>
          </div>
	<div class="container-fluid">
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
                                  <table class="table table-bordered no-wrap">
                                      <thead>
                                          <tr style="background-color: #5F76E8; opacity: .5; color: white">
                                          	<th>접수번호</th>
                                              <th>모임번호</th>
                                              <th>사유</th>
                                              <th>작성자</th>
                                              <th>처리상태</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                      	<c:if test="${empty list }" var="isEmpty">
										<tr>
											<td colspan="5">등록된 게시물이 없어요</td>
										</tr>
									</c:if>
									<c:if test="${!isEmpty}">
										<c:forEach var="item" items="${list }" varStatus="loop">
											<tr>
												<td>${totalRecord - (((nowPage - 1) * pageSize) + loop.index)}</td>
												<td>${item.meetingNo}</td>
												<td class="text-left"><a href="<c:url value='#'/>">${item.reason }</a></td>
												<td>${item.id}</td>
												<td id="proccess${item.MAccusationNo}">${item.process}</td>
											</tr>
											<tr style="display:none">
											    <td colspan="5">
											    	<div class="container">
												      <div class="row">
												      	<div class="offset-2 col-8" >
												      		<p>${item.content }</p>
												      	</div>
												      	<div class="offset-8 col-2">
												      		<button class="btn btn-success" onclick="javascript:openpopup(${item.meetingNo})">모임 확인하기</button>
												      		<button class="btn btn-success" id="disabled${item.MAccusationNo}" <c:if test="${item.process != '접수'}">disabled="disabled"</c:if> onclick="javascript:openmodal(${item.meetingNo},${item.MAccusationNo})">조치하기</button>
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


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
	function openpopup(meetingno) {
		openWin = window.open("<c:url value='/SearchAddress.do'/>",
                "addressForm", "width=1000, height=600 ,resizable = no, scrollbars = no");
	}
	function openmodal(meetingno,maccusationno) {
		$.ajax({
			url:"<c:url value='/Admin/Accusation/Meeting/Select.do'/>",
			data:"meetingno="+meetingno,
			dataType:"json",
			success:function(data){
				$('#meetingName').html("모임명: "+data.MEETINGNAME);
				$('#operator').html("모임장: "+data.OPERATOR)
			}
		});
		$(':input[name=meetingno]').val(meetingno)
 		$(':input[name=maccusationno]').val(maccusationno)
		$('#myModal').modal('show')
	}
	$('#modalForm :button[name=submit]').click(function() {
		 $.ajax({
			url:'<c:url value="/Admin/Accusation/Meeting/Process.do"/>',
			type:'post',
			dataType:"json",
			data:$('#modalForm').serialize(),
			success:function(data){
				$('#myModal').modal('hide');
				$('#proccess'+data.maccusationno).html(data.result);
				$('#disabled'+data.maccusationno).prop('disabled','disabled');
				
			}
			
		}); 
	});
	
	
</script>
	
