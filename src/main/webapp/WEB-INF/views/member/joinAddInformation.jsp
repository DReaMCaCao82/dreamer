<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>추가정보 작성</title> ${notice }
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
   href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

   <div class="container-fluid px-md-12  pt-5 ">

      <div class="row justify-content-between">
         <div class="col-md-8 order-md-last">
            <div class="row">
               <div class="col-md-6 text-center">
                  <a class="navbar-brand" href="<c:url value='/'/>"><h1>드  림</h1>
                     <span></span> <small>꿈꾸는사람들</small></a>
               </div>

               <div class="row no-gutters">
                  <div class="col-md-7">
                     <div class="contact-wrap w-100 p-md-5 p-4">

                        <div class="row">

                           <div class="select_img col-md-10 text-center">
                              <span style="display: inline-block;">프로필사진</span>
                              <div class="form-group">

                                 <img id="real_img"
                                    src="<c:url value="resources/images/anony.PNG"/>"
                                    alt="Raised circle image"
                                    class="img-fluid rounded-circle shadow-lg"
                                    style="width: 200px; height: 200px;">

                                 <div class="col-md-12 text-center"
                                    style="text-align: center; padding-top: 5%">

                                    <div>
                                       <input type="button" id="target_img" value="사진선택"
                                          class="btn btn-success" />
                                    </div>

                                 </div>

                              </div>
                           </div>
                           <form id="frm" method="post" enctype="multipart/form-data"
                              action="<c:url value='/insertImg.do'/>">
                              <input type="file" id="gdsImg" name="file"
                                 style="display: none;" /> <input type="hidden" id="user_id"
                                 name="user_id" value="${user_id}" />

                              <div class="col-md-10 text-center" style="margin-top: 5%; margin-bottom: 5%">
                                 <div class="form-group">
                                    <input type="button" value="주소검색" id="search"
                                       class="btn btn-primary" /> 
                                    <input type="text" disabled="disabled" id="realAddress" name="realAddress"/>
                                    <input type="hidden" name="addr" id="addr"/>
                                 </div>
                              </div>
                              <div class="col-md-10">
                                 <div class="form-group">
                                    <label class="label" for="pr" style="color: gray;">상태메세지</label>
                                    <textarea name="pr" class="form-control" id="pr" rows="3"></textarea>
                                 </div>
                              </div>

                              <div class="col-md-10">
                                 <div class="form-group">
                                    <label class="label" for="about_me" style="color: gray;">자기소개</label>
                                    <textarea name="about_me" class="form-control" id="about_me"
                                       cols="100" rows="10"></textarea>
                                 </div>
                              </div>


                           </form>
                           <div class="col-md-5">
                              <div class="form-group">
                                 <a href="<c:url value='/'/>"><input type="button"
                                    value="다음에입력" class="btn btn-primary btn-block"></a>



                              </div>
                           </div>

                           <div class="col-md-5">
                              <div class="form-group">
                                 <input type="button" id="submitBtn" value="입력"
                                    class="btn btn-success btn-block" />

                              </div>
                           </div>

                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </div>
         <!-- 로고 가운데 배치용 -->
         <div class="col-md-4 d-flex"></div>
      </div>



   </div>

   <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
   </div>


   <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
   <script src="resources/js/popper.min.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/jquery.easing.1.3.js"></script>
   <script src="resources/js/jquery.waypoints.min.js"></script>
   <script src="resources/js/jquery.stellar.min.js"></script>
   <script src="resources/js/owl.carousel.min.js"></script>
   <script src="resources/js/jquery.magnific-popup.min.js"></script>
   <script src="resources/js/jquery.animateNumber.min.js"></script>
   <script src="resources/js/scrollax.min.js"></script>
<!--    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
   <script src="resources/js/google-map.js"></script> -->
   <script src="resources/js/main.js"></script>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
   
   $('#search').click(function(){
       new daum.Postcode({
              oncomplete: function(data) {
                 $('#addr').val(data.sido+' '+data.sigungu)
                 $('#realAddress').val(data.sido+' '+data.sigungu)
                 
              }
          }).open();
   });
      $("#gdsImg").change(
            function() {
               if (this.files && this.files[0]) {
                  var reader = new FileReader;
                  reader.onload = function(data) {
                     $(".select_img img#real_img").attr("src",
                           data.target.result).width(200).height(200);
                  }
                  reader.readAsDataURL(this.files[0]);
               }

               console.log('이미지 변경했어');

            });

      $('#target_img').click(function() {
         console.log('fileadd');
         $("input[name='file']").click();
      });
      $('#submitBtn').click(function() {

         if($('#gdsImg').val()==""|| $('#addr').val()=="" ||$('#pr').val()=="" ||$('#about_me').val()=="" ){
            if(confirm('입력하지 않은 정보가 있어요! 진행 하시겠어요?')){
               
            }else{
               return;
            }
         }
         
         $('#frm').submit();
      });
   </script>

</body>
</html>