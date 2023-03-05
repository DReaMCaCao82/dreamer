<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<div class="container-fluid">
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-md-12">


					<form class="form-horizontal" method="post"
						action="<c:url value='/Questionsupdate.do'/>">
						<!-- 씨큐리티 적용:csrf취약점 방어용 -->
						
						<input type="hidden" name="bbsNo" value="${bbsdto.bbsNo}" />
						<div class="form-group">
							<label class="col-sm-2 control-label">제목</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="title" value="[답글]:${bbsdto.title}"/>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">내용</label>
							<!-- 중첩 컬럼 사용 -->
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-8">
									<textarea class="form-control" name="contents" rows="10">[문의내용]:${bbsdto.contents}
																		
[답변]:</textarea>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">답변</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

