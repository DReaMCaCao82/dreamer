<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<a href="#" class="btn btn-success" data-toggle="modal"
	data-target="#myModal">신고하기</a>
<div class="modal fade" id="myModal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="background: #f6f6f5">
				<h4 class="modal-title" id="myModalLabel">신고하기</h4>

				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div>
					<p id="title">제 목: ${title }</p>
					<p id="작성자">작성자: ${name}</p>
					<hr />
				</div>
				<form class="form-horizontal" method="post" id="form" action="">
					<div class="form-group">
						<label>신고 사유</label>
						<div>
							<select class="form-control">
								<option>부적절한 홍보 게시글</option>
								<option>음란성 또는 청소년에게 부적합한 내용</option>
								<option>명예훼손/사생활 침해 및 저작권침해등</option>
								<option>기타</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<textarea class="form-control"
							style="resize: vertical; height: 300px;"></textarea>
					</div>
					<hr />
					<div class="form-group">
						<div class="offset-4 ">
							<button type="submit" class="btn btn-success">신고</button>
							<button type="button" class="btn btn-success"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>