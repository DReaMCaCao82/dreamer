<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="<c:url value="/resources/summernote/summernote-lite.min.css"/>" rel="stylesheet"> 
<script src="<c:url value="/resources/summernote/summernote-lite.min.js"/>"></script>
<script src="<c:url value="/resources/summernote/lang/summernote-ko-KR.js"/>"></script>
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			 <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">공지사항 수정</h4>
                    </div>
                </div>
            </div>
			<div class="container-fluid">
				<div class="page-breadcrumb">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body offset-2 col-8">
									<form class="form-horizontal" method="post" id="modalForm" action="<c:url value="/Admin/Notice/UpdateProcess.do"/>">
										<input type="hidden" name="noticeno" value="${item['NOTICENO']}">
										<div class="form-group">
											<label>제목</label>
											<div>
												<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요?" value="${item['TITLE']}">
											</div>
										</div>
										<div class="form-group">
											<label>내용</label>
											<div>
												<textarea id="summernote" name="content" placeholder="내용 입력하세요">${item['CONTENT']}</textarea>
												   
											</div>
										</div>
										<hr />
										<div class="form-group">
											<div class="offset-4 ">
												<button type="submit" name="submit" class="btn btn-success">수정</button>
												<button type="button" class="btn btn-success" onclick="history.go(-1)">취소</button>
											</div>
										</div>
									</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
	            for (var i = files.length - 1; i >= 0; i--) {
	            	uploadSummernoteImageFile(files[i], this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
        
        function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url :"<c:url value="/uploadSummernoteImageFile.do"/>",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					console.log()
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
</script>