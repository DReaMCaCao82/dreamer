<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>개인정보수정</title>
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
                     <span></span> <small>개인정보 수정</small></a>




               </div>

               <div class="row no-gutters">
                  <div class="col-md-7">
                     <div class="contact-wrap w-100 p-md-5 p-4">
                        <form method="POST" id="frm" name="contactForm"
                           class="contactForm">
                           <div class="row">

                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="name" style="font: bold;">이름</label>
                                    <input type="text" class="form-control" name="name"
                                       id="name" value="${dto.name }" maxlength="10"> <span
                                       id="nameDisplay" style="color: red; font-size: 0.8em;"></span>
                                    <input type="hidden" id="user_name" name="user_name"
                                       value="" />
                                 </div>
                              </div>

                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="age" style="font: bold;">나이</label>
                                    <input type="text" class="form-control" name="age" id="age"
                                       value="${dto.age}" maxlength="2"> <span
                                       id="ageDisplay" style="color: red; font-size: 0.8em;"></span>
                                    <input type="hidden" id="user_age" name="user_age" value="" />

                                 </div>
                              </div>

                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="gender"> 성별</label> <span
                                       style="font-size: 1em">남자 </span>
                                    <c:if test="${dto.gender eq 'M'}" var="male">
                                       <input type="radio" name="gender" value="M"
                                          checked="checked">
                                       <span style="font-size: 1em; margin-left: 5%">여자 </span>
                                       <input type="radio" name="gender" value="F">
                                    </c:if>
                                    <c:if test="${not male}">
                                       <input type="radio" name="gender" value="M">
                                       <span style="font-size: 1em; margin-left: 5%">여자 </span>
                                       <input type="radio" name="gender" value="F"
                                          checked="checked">
                                    </c:if>

                                    <span id="genderDisplay"
                                       style="color: red; font-size: 0.8em; display: block;"></span>

                                 </div>

                              </div>


                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="tel" style="font: bold;">전화번호</label>
                                    <input type="tel" class="form-control" name="tel" id="tel"
                                       value="${dto.tel }" maxlength="11" /> <span id="telDisplay"
                                       style="color: red; font-size: 0.8em;"></span>
                                 </div>
                              </div>
                              <div class="col-md-12" style="text-align: right;">
                                 <div class="btn btn-danger" id="deleteInter">관심분야 제거</div>
                                 <div class="btn btn-info"
                                    style="margin-bottom: 5%; margin-top: 5%" id="plusInter">관심분야
                                    추가</div>
                              </div>
                              <c:forEach var="item" items="${categoryList }" varStatus="loop"> 

                                 <div class="col-md-4" style="display : "
                                    id='inter${loop.index+1 }'>
                                    <div class="form-group">
                                       <label class="label" style="font: bold;">관심분야${loop.index+1 }</label>
                                       <div class="col-md-6">

                                          <select class="form-control" style="float: left;"
                                             id="mainCategory${loop.index+1 }"
                                             name="mainCategory${loop.index+1 }"
                                             onchange="itemChange(${loop.index+1 })">
                                             <option disabled="disabled">대분류</option>
                                             <c:choose>
                                                <c:when test="${item['MAINCATEGORY']=='음악' }">
                                                   <option value="음악" selected="selected">음악</option>
                                                   <option value="스포츠">스포츠</option>
                                                   <option value="공연예술">공연예술</option>
                                                   <option value="컴퓨터">컴퓨터</option>
                                                </c:when>
                                                <c:when test="${item['MAINCATEGORY']=='스포츠' }">
                                                   <option value="음악">음악</option>
                                                   <option value="스포츠" selected="selected">스포츠</option>
                                                   <option value="공연예술">공연예술</option>
                                                   <option value="컴퓨터">컴퓨터</option>
                                                </c:when>
                                                <c:when test="${item['MAINCATEGORY']=='공연예술' }">
                                                   <option value="음악">음악</option>
                                                   <option value="스포츠">스포츠</option>
                                                   <option value="공연예술" selected="selected">공연예술</option>
                                                   <option value="컴퓨터">컴퓨터</option>
                                                </c:when>
                                                <c:when test="${item['MAINCATEGORY']=='컴퓨터' }">
                                                   <option value="음악">음악</option>
                                                   <option value="스포츠">스포츠</option>
                                                   <option value="공연예술">공연예술</option>
                                                   <option value="컴퓨터" selected="selected">컴퓨터</option>
                                                </c:when>
                                             </c:choose>

                                          </select>
                                       </div>
                                       <div class="col-md-6" style="float: right;">

                                          <select class="form-control"
                                             id="subCategory${loop.index+1 }"
                                             name='subCategory${loop.index+1 }'>
                                             <option disabled="disabled">소분류</option>
                                             <c:if test="${item['MAINCATEGORY']=='음악'}">
                                             <c:choose>
                                             <c:when test="${item['SUBCATEGORY']=='밴드'}">
                                                <option value="밴드" selected="selected">밴드</option>
                                                <option value="뮤지컬">뮤지컬</option>
                                                <option value="아카펠라">아카펠라</option>
                                                <option value="오케스트라">오케스트라</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='뮤지컬'}">
                                                <option value="밴드">밴드</option>
                                                <option value="뮤지컬" selected="selected">뮤지컬</option>
                                                <option value="아카펠라">아카펠라</option>
                                                <option value="오케스트라">오케스트라</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='아카펠라'}">
                                                <option value="밴드">밴드</option>
                                                <option value="뮤지컬">뮤지컬</option>
                                                <option value="아카펠라" selected="selected">아카펠라</option>
                                                <option value="오케스트라">오케스트라</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='오케스트라'}">
                                                <option value="밴드">밴드</option>
                                                <option value="뮤지컬">뮤지컬</option>
                                                <option value="아카펠라">아카펠라</option>
                                                <option value="오케스트라" selected="selected">오케스트라</option>
                                             </c:when>
                                             </c:choose>
                                             </c:if>
                                             <c:if test="${item['MAINCATEGORY']=='스포츠'}">
                                             <c:choose>
                                             <c:when test="${item['SUBCATEGORY']=='축구'}">
                                                <option value="축구" selected="selected">축구</option>
                                                <option value="농구">농구</option>
                                                <option value="야구">야구</option>
                                                <option value="배구">배구</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='농구'}">
                                                <option value="축구">축구</option>
                                                <option value="농구" selected="selected">농구</option>
                                                <option value="야구">야구</option>
                                                <option value="배구">배구</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='야구'}">
                                                <option value="축구">축구</option>
                                                <option value="농구">농구</option>
                                                <option value="야구" selected="selected">야구</option>
                                                <option value="배구">배구</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='배구'}">
                                                <option value="축구">축구</option>
                                                <option value="농구">농구</option>
                                                <option value="야구">야구</option>
                                                <option value="배구" selected="selected">배구</option>
                                             </c:when>
                                             </c:choose>
                                             </c:if>
                                             <c:if test="${item['MAINCATEGORY']=='컴퓨터'}">
                                             <c:choose>
                                             <c:when test="${item['SUBCATEGORY']=='게임'}">
                                                <option value="게임" selected="selected">게임</option>
                                                <option value="웹앱개발">웹앱개발</option>
                                                <option value="웹툰">웹툰</option>
                                                <option value="영상">영상</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='웹앱개발'}">
                                                <option value="게임">게임</option>
                                                <option value="웹앱개발"  selected="selected">웹앱개발</option>
                                                <option value="웹툰">웹툰</option>
                                                <option value="영상">영상</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='웹툰'}">
                                                <option value="게임">게임</option>
                                                <option value="웹앱개발">웹앱개발</option>
                                                <option value="웹툰" selected="selected">웹툰</option>
                                                <option value="영상">영상</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='영상'}">
                                                <option value="게임">게임</option>
                                                <option value="웹앱개발">웹앱개발</option>
                                                <option value="웹툰">웹툰</option>
                                                <option value="영상" selected="selected">영상</option>
                                             </c:when>
                                             </c:choose>
                                             </c:if>
                                             <c:if test="${item['MAINCATEGORY']=='공연예술'}">
                                             <c:choose>
                                             <c:when test="${item['SUBCATEGORY']=='영화제작'}">
                                                <option value="영화제작" selected="selected">영화제작</option>
                                                <option value="연극">연극</option>
                                                <option value="패션쇼">패션쇼</option>
                                                <option value="댄스">댄스</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='연극'}">
                                                   <option value="영화제작">영화제작</option>
                                                <option value="연극" selected="selected">연극</option>
                                                <option value="패션쇼">패션쇼</option>
                                                <option value="댄스">댄스</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='패션쇼'}">
                                                   <option value="영화제작">영화제작</option>
                                                <option value="연극">연극</option>
                                                <option value="패션쇼" selected="selected">패션쇼</option>
                                                <option value="댄스">댄스</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='댄스'}">
                                                <option value="영화제작">영화제작</option>
                                                <option value="연극">연극</option>
                                                <option value="패션쇼">패션쇼</option>
                                                <option value="댄스" selected="selected">댄스</option>
                                             </c:when>
                                             </c:choose>
                                             </c:if>
                                             
                                          </select>
                                       </div>
                                    </div>
                                 </div>
                              </c:forEach>

                              <c:choose>
                                 <c:when test="${categoryList.size() ==1}">
                                    <div class="col-md-4" style="display: none" id='inter2'>
                                       <div class="form-group">
                                          <label class="label" style="font: bold;">관심분야2</label>
                                          <div class="col-md-6">

                                             <select class="form-control" style="float: left;"
                                                id="mainCategory2" name="mainCategory2"
                                                onchange="itemChange(2)">
                                                <option disabled="disabled" selected="selected">대분류</option>
                                                <option value="음악">음악</option>
                                                <option value="스포츠">스포츠</option>
                                                <option value="공연예술">공연예술</option>
                                                <option value="컴퓨터">컴퓨터</option>
                                             </select>
                                          </div>
                                          <div class="col-md-6" style="float: right;">

                                             <select class="form-control" id="subCategory2"
                                                name='subCategory2'>
                                                <option disabled="disabled" selected="selected">소분류</option>

                                             </select>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="col-md-4" style="display: none" id='inter3'>
                                       <div class="form-group">
                                          <label class="label" style="font: bold;">관심분야3</label>
                                          <div class="col-md-6">

                                             <select class="form-control" style="float: left;"
                                                id="mainCategory3" name="mainCategory3"
                                                onchange="itemChange(3)">
                                                <option disabled="disabled" selected="selected">대분류</option>
                                                <option value="음악">음악</option>
                                                <option value="스포츠">스포츠</option>
                                                <option value="공연예술">공연예술</option>
                                                <option value="컴퓨터">컴퓨터</option>
                                             </select>
                                          </div>
                                          <div class="col-md-6" style="float: right;">

                                             <select class="form-control" id="subCategory3"
                                                name='subCategory3'>
                                                <option disabled="disabled" selected="selected">소분류</option>

                                             </select>
                                          </div>
                                       </div>
                                    </div>
                                 </c:when>
                                 <c:when test="${categoryList.size() ==2}">
                                    <div class="col-md-4" style="display: none" id='inter3'>
                                       <div class="form-group">
                                          <label class="label" style="font: bold;">관심분야3</label>
                                          <div class="col-md-6">

                                             <select class="form-control" style="float: left;"
                                                id="mainCategory3" name="mainCategory3"
                                                onchange="itemChange(3)">
                                                <option disabled="disabled" selected="selected">대분류</option>
                                                <option value="음악">음악</option>
                                                <option value="스포츠">스포츠</option>
                                                <option value="공연예술">공연예술</option>
                                                <option value="컴퓨터">컴퓨터</option>
                                             </select>
                                          </div>
                                          <div class="col-md-6" style="float: right;">

                                             <select class="form-control" id="subCategory3"
                                                name='subCategory3'>
                                                <option disabled="disabled" selected="selected">소분류</option>

                                             </select>
                                          </div>
                                       </div>
                                    </div>
                                 </c:when>
                                 <c:otherwise>
                                 </c:otherwise>
                              </c:choose>

                              <div class="col-md-10 text-center"
                                 style="margin-top: 5%; margin-bottom: 5%">
                                 <div class="form-group">
                                    <input type="button" value="주소검색" id="search"
                                       class="btn btn-primary" /> <input type="text"
                                       disabled="disabled" id="realAddress" name="addr"
                                       value="${townDTO.town }" maxlength="30" /> <input
                                       type="hidden" name="addr" id="addr"
                                       value="${townDTO.town }" />
                                 </div>
                              </div>


                              <div class="col-md-10 pt-3">
                                 <div class="form-group">
                                    <input id="updateBtn" type="button" value="정보수정"
                                       class="btn btn-success btn-block">
                                 </div>
                              </div>
                           </div>
                        </form>
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
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
   <script src="resources/js/google-map.js"></script>
   <script src="resources/js/main.js"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

   <script>
      //이름 에이작스 처리
      $('#name').blur(function() {
         console.log('포커스 잃었다');
         console.log($(this).val());
         $.ajax({
            url : "<c:url value="/ajaxName.do"/>",
            type : 'post',
            dataType : 'json',
            data : "name=" + $('#name').val(),
            success : function(data) {

               $('#nameDisplay').html(data.chName);
               $('#user_name').val(data.user_name);
            }
         });
      });
      
      //나이 입력유무
      $('#age').blur(function() {
         console.log('포커스 잃었다');
         console.log($(this).val());
         $.ajax({
            url : "<c:url value="/ajaxAge.do"/>",
            type : 'post',
            dataType : 'json',
            data : "age=" + $('#age').val(),
            success : function(data) {

               $('#ageDisplay').html(data.chAge);
               $('#user_age').val(data.user_age);
            }
         });
      });

      //개인정보수정클릭
      $('#updateBtn').click(function() {
         
         var genders = document.getElementsByName('gender');
         var gender; // 여기에 선택된 radio 버튼의 값이 담기게 된다.
         for(var i=0; i<genders.length; i++) {
             if(genders[i].checked) {
                gender = genders[i].value;
             }
         }
         
         if ($('#user_name').val() == "") {
            $('#name').focus();
            return;
         }else if ($('#user_age').val()==""){
            $('#age').focus();
            return;
         }else if($('#tel').val() ==""){
            $('#telDisplay').html('전화번호를 입력해주세요');
            $('#tel').focus();
            return;
         }else if($('#tel').val().length!=11){
            $('#telDisplay').html('전화번호를 정확히 입력해주세요');
            $('#tel').focus();
            return;
         }
         if($('#mainCategory1').val()==null){
            console.log($('#mainCategory1').val())
            alert('관심분야를 선택해주세요')
            return;
         }else if($('#inter2').attr('style') == 'display : '){
            if($('#mainCategory2').val()==null){
            alert('관심분야2를 선택해주세요');
            return;
            }
         }
         if($('#inter3').attr('style') == 'display : '){
            if($('#mainCategory3').val()==null){
               alert('관심분야3을 선택해주세요');
               return;
               }
         }
         //form태그의 action속성 및 method속성 설정
         $('#frm').prop({
            action : "<c:url value='/InfoUpdate.do'/>"
         });
         //폼객체의 submit()함수로 서버로 전송
         $('#frm').submit();
      });
      
      $('#search').click(function(){
          new daum.Postcode({
                 oncomplete: function(data) {
                    $('#addr').val(data.sido+' '+data.sigungu);
                    $('#realAddress').val(data.sido+' '+data.sigungu);
                    
                 }
             }).open();
      });
      
      $('#plusInter').click(function() {

         if ($('#inter2').attr('style') == 'display: none') {
            $('#inter2').attr('style', 'display : ');
            return;
         } else if ($('#inter3').attr('style') == 'display: none') {
            $('#inter3').attr('style', 'display : ');
            return;
         } else {
            alert('관심분야는 최대 3개까지만 등록 가능합니다 !');
         }
      });

      $('#deleteInter').click(function() {
      console.log($('#inter3').attr('style'));
         if ($('#inter3').attr('style') == 'display : ') {
            $('#inter3').attr('style', 'display: none');
            $('#mainCategory3').val('대분류')
            $('#subCategory3').val('소분류')
            return;
         } else if ($('#inter2').attr('style') == 'display : ') {
            $('#inter2').attr('style', 'display: none');
            $('#mainCategory2').val('대분류')
            $('#subCategory2').val('소분류')
            return;
         } else {
            alert('관심분야 1개 이상은 필수 입니다 !');
         }
      });
      //카테고리 바꾸기
      function itemChange(no) {
         var mainName ='#mainCategory'+no;
         var subName ='#subCategory'+no;
         var music = [ "밴드", "뮤지컬", "아카펠라", "오케스트라" ];
         var sports = [ "축구", "농구", "야구", "배구" ];
         var arts = [ "영화제작", "연극", "패션쇼","댄스" ];
         var computer = [ "게임", "웹앱개발", "웹툰", "영상제작" ]

         var mainCategory = $(mainName).val();
         console.log(mainCategory)
         var changeItem;

         if (mainCategory == "음악")
            changeItem = music;
         else if (mainCategory == "스포츠")
            changeItem = sports;
         else if (mainCategory == "공연예술")
            changeItem = arts;
         else if (mainCategory == "컴퓨터")
            changeItem = computer;

         $(subName).empty();

         var option = "<option disabled=disabled>소분류</option>";
         $(subName).append(option);

         for (var count = 0; count < changeItem.length; count++) {

            option = "<option "+"value="+changeItem[count]+">"
                  + changeItem[count] + "</option>";
            $(subName).append(option);
         }
      }
   </script>
</body>
</html>