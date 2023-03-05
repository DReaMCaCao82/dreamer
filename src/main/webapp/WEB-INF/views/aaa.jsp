<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- =========== 상단 메뉴 =========== -->
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container-fluid">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="fa fa-bars"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav m-auto">
				<li class="nav-item"><a href="<c:url value='/town/AllOfMeeting.do'/>" class="nav-link">동네 둘러보기</a></li>
	            <li class="nav-item"><a href="<c:url value='/bbs/MeetingBBS.do'/>" class="nav-link">게시글</a></li>
				<li class="nav-item"><a href="<c:url value='/performance/PerformanceList.do'/>" class="nav-link">공연</a></li>
				<li class="nav-item"><a href="<c:url value='/FundingList.do'/>" class="nav-link">펀딩</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- =========== 상단 메뉴 END =========== -->



<!-- 로그인 페이지 -->
   <div class="container-fluid px-md-12  pt-5 ">

      <div class="row justify-content-between">
         <div class="col-md-8 order-md-last">
            <div class="row">
               <div class="row no-gutters">
                  <div class="col-md-7">
                     <div class="contact-wrap w-100 p-md-5 p-4">
                        <form method="POST" id="frm" name="contactForm"
                           class="contactForm">
                           <div class="row">
								
							<div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
									<h3>'${sessionId}' 님 환영합니다! </h3>/>
                                 </div>
                              </div>
								
                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="name" style="font: bold;">이름</label>
                                    <input type="text" class="form-control" name="name" id="name" maxlength="10">
                                    <span id="nameDisplay" style="color: red; font-size: 0.8em;"></span>
                                    <input type="hidden" id="user_name" name="user_name" value="" />
                                 </div>
                              </div>

                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="age" style="font: bold;">나이</label>
                                    <input type="text" class="form-control" name="age" id="age" maxlength="2">
                                    <span id="ageDisplay" style="color: red; font-size: 0.8em;"></span>
                                    <input type="hidden" id="user_age" name="user_age" value="" />

                                 </div>
                              </div>

                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="gender"> 성별</label> 
                                    <span style="font-size: 1em">남자 </span>
                                    <!--<c:if test="${dto.gender eq 'M'}" var="male">
                                       <input type="radio" name="gender" value="M" checked="checked">-->
                                       <span style="font-size: 1em; margin-left: 5%">여자 </span>
                                       <input type="radio" name="gender" value="F">
                                    <!--</c:if>
                                    <c:if test="${not male}">
                                       <input type="radio" name="gender" value="M">
                                       <span style="font-size: 1em; margin-left: 5%">여자 </span>
                                       <input type="radio" name="gender" value="F" checked="checked">
                                    </c:if>-->

                                    <span id="genderDisplay"
                                       style="color: red; font-size: 0.8em; display: block;"></span>

                                 </div>

                              </div>


                              <div class="col-md-10" style="display: block;">
                                 <div class="form-group">
                                    <label class="label" for="tel" style="font: bold;">전화번호</label>
                                    <input type="tel" class="form-control" name="tel" id="tel" maxlength="11" />
                                    <span id="telDisplay" style="color: red; font-size: 0.8em;"></span>
                                 </div>
                              </div>
                              <div class="col-md-12" style="text-align: right;">
                                 <div class="btn btn-danger" id="deleteInter">관심분야 제거</div>
                                 <div class="btn btn-info" style="margin-bottom: 5%; margin-top: 5%" id="plusInter">관심분야  추가</div>
                              </div>
                              <!-- 
                              <c:forEach var="item" items="${categoryList }"
                                 varStatus="loop">

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
                                                   <option value="예술">예술</option>
                                                   <option value="게임">게임</option>
                                                </c:when>
                                                <c:when test="${item['MAINCATEGORY']=='스포츠' }">
                                                   <option value="음악">음악</option>
                                                   <option value="스포츠" selected="selected">스포츠</option>
                                                   <option value="예술">예술</option>
                                                   <option value="게임">게임</option>
                                                </c:when>
                                                <c:when test="${item['MAINCATEGORY']=='예술' }">
                                                   <option value="음악">음악</option>
                                                   <option value="스포츠">스포츠</option>
                                                   <option value="예술" selected="selected">예술</option>
                                                   <option value="게임">게임</option>
                                                </c:when>
                                                <c:otherwise>
                                                   <option value="음악">음악</option>
                                                   <option value="스포츠">스포츠</option>
                                                   <option value="예술">예술</option>
                                                   <option value="게임" selected="selected">게임</option>
                                                </c:otherwise>
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
                                                <option value="아카펠라">아카펠라</option>
                                                <option value="댄스">댄스</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='아카펠라'}">
                                                <option value="밴드">밴드</option>
                                                <option value="아카펠라" selected="selected">아카펠라</option>
                                                <option value="댄스">댄스</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='댄스'}">
                                                <option value="밴드">밴드</option>
                                                <option value="아카펠라">아카펠라</option>
                                                <option value="댄스" selected="selected">댄스</option>
                                             </c:when>
                                             </c:choose>
                                             </c:if>
                                             <c:if test="${item['MAINCATEGORY']=='스포츠'}">
                                             <c:choose>
                                             <c:when test="${item['SUBCATEGORY']=='축구'}">
                                                <option value="축구" selected="selected">축구</option>
                                                <option value="수영">수영</option>
                                                <option value="풋살">풋살</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='수영'}">
                                                <option value="축구">축구</option>
                                                <option value="수영" selected="selected">수영</option>
                                                <option value="풋살">풋살</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='풋살'}">
                                                <option value="축구">축구</option>
                                                <option value="수영">수영</option>
                                                <option value="풋살" selected="selected">풋살</option>
                                             </c:when>
                                             </c:choose>
                                             </c:if>
                                             <c:if test="${item['MAINCATEGORY']=='예술'}">
                                             <c:choose>
                                             <c:when test="${item['SUBCATEGORY']=='영화제작'}">
                                                <option value="영화제작" selected="selected">영화제작</option>
                                                <option value="그림">그림</option>
                                                <option value="웹툰">웹툰</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='그림'}">
                                                <option value="영화제작">영화제작</option>
                                                <option value="그림"  selected="selected">그림</option>
                                                <option value="웹툰">웹툰</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='웹툰'}">
                                                <option value="영화제작">영화제작</option>
                                                <option value="그림">그림</option>
                                                <option value="웹툰" selected="selected">웹툰</option>
                                             </c:when>
                                             </c:choose>
                                             </c:if>
                                             <c:if test="${item['MAINCATEGORY']=='게임'}">
                                             <c:choose>
                                             <c:when test="${item['SUBCATEGORY']=='롤'}">
                                                <option value="롤" selected="selected">롤</option>
                                                <option value="오버워치">오버워치</option>
                                                <option value="건즈">건즈</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='오버워치'}">
                                                   <option value="롤">롤</option>
                                                <option value="오버워치" selected="selected">오버워치</option>
                                                <option value="건즈">건즈</option>
                                             </c:when>
                                             <c:when test="${item['SUBCATEGORY']=='건즈'}">
                                                   <option value="롤">롤</option>
                                                <option value="오버워치">오버워치</option>
                                                <option value="건즈" selected="selected">건즈</option>
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
                                                <option value="예술">예술</option>
                                                <option value="게임">게임</option>
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
                                                <option value="예술">예술</option>
                                                <option value="게임">게임</option>
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
                                                <option value="예술">예술</option>
                                                <option value="게임">게임</option>
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
                              </c:choose> -->

                              <div class="col-md-10 text-center"
                                 style="margin-top: 5%; margin-bottom: 5%">
                                 <div class="form-group">
                                    <input type="button" value="주소검색" id="search" class="btn btn-primary" />
                                    <input type="text" disabled="disabled" id="realAddress" name="addr"  maxlength="30" />
                                    <input type="hidden" name="addr" id="addr"/>
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
	</div>
</div>
	


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
              $('#addr').val(data.sido+' '+data.sigungu+' '+data.bname);
              $('#realAddress').val(data.sido+' '+data.sigungu+' '+data.bname);
              
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
	
	

	

	//푸터 관련==============================================================
	function isLogin() {
		
		$.ajax({
			url : "<c:url value='IsLogin.do'/>",
			dataType : 'json',
			success : function(data) {
				if (data.isLogin == 'YES')//로그인 되었다면
					//목록페이지로 이동
					$('#modalContactForm').modal("show");
				else {//로그인 안되었다면
					alert("로그인 후 이용하세요");
					location.replace("<c:url value='/login.do'/>");

				}

			},
			error : function(e) {
				console.log(e);
			}

		});

	}///////////

	function report() {

		if (window.confirm("정말로 문의하시겠습니까?")) {
			$.ajax({
				url : "<c:url value="/Questions.do"/>",
				type : 'post',
				dataType : "text",
				data : $("#modalForm").serialize(),
				success : function(data) {
					alert(data);
					$('#modalContactForm').modal("hide");
				}
			});
		}
	}
</script>
</body>
</html>