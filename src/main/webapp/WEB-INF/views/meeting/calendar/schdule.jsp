<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>일정관리</title>

<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>

<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
<!-- 
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-theme.min.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/sweetalert.min.js?ver=1'/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sweetalert.css?ver=1.2'/>">
 -->
<script type="text/javascript" src="<c:url value='/resources/js/stringBuffer.js'/>"></script>

<script type="text/javascript" src="<c:url value='/resources/js/calendar.js'/>"></script>

<script type="text/javascript" src="<c:url value='/resources/js/calendarSchdule.js'/>"></script>

<style type="text/css">

thead {

    text-align: center;

}

thead td {

    width: 100px;

}

#tbody td {

    height: 150px;

}

#yearMonth {

    font: bold;

    font-size: 18px;

}

</style>

</head>

<body>

    <input type="hidden" id="chk" value="0" />

    <input type="hidden" id="calendarId" value="${calendarId}" />

    <table class="table table-bordered">

        <thead id='thead'>

            <tr>

                <td colspan="7">

                    <button type='button' class='btn btn-sm btn-warning'

                        id='moveFastPre' onclick="moveFastMonthPre()">«</button>

                     

                    <button type='button' class='btn btn-sm btn-warning' id='movePre'

                        onclick="moveMonthPre()">‹</button>    <span

                    id='yearMonth'></span>   

                    <button type='button' class='btn btn-sm btn-warning' id='moveNext'

                        onclick="moveMonthNext()">›</button>  

                    <button type='button' class='btn btn-sm btn-warning'

                        id='moveFastNext' onclick="moveFastMonthNext()">»</button>

                    <div style="text-align: right;">

                        <span>${title}</span> <input class='btn btn-sm btn-info'

                            type="button" value="주" onclick='tabWeek()' /> <input

                            class='btn btn-sm btn-info' type="button" value="월"

                            onclick='tabMonth()' /> <input class='btn btn-sm btn-info'

                            type="button" value="목록" onclick='location.href="./coding.do"' />

                    </div>

                </td>

            </tr>

            <tr>

                <td>일<span class='week'></span></td>

                <td>월<span class='week'></span></td>

                <td>화<span class='week'></span></td>

                <td>수<span class='week'></span></td>

                <td>목<span class='week'></span></td>

                <td>금<span class='week'></span></td>

                <td>토<span class='week'></span></td>

            </tr>

        </thead>

        <tbody id='tbody'></tbody>

    </table>

    <!-- 일정 생성 modal -->

    <div class="modal fade" id="schduleForm" role="dialog">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal">×</button>

                    <h4 class="modal-title">일정등록</h4>

                </div>

                <div class="modal-body">

                    <form class='form-margin40' role='form' action="#" method='post'

                        id='frmSchdule'>

                        <div class='form-group'>

                            <label>제목</label> <input type='text' class='form-control'

                                id='summary' name='summary'

                                placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사">

                        </div>

                        <div class='form-group'>

                            <label>시작시간</label> <input class='form-control' type="time"

                                id='startTime' name='startTime'>

                        </div>

                        <div class='form-group'>

                            <label>시작날짜</label> <input class='form-control startDate'

                                type="date" id='startDate' name='startDate' readonly="readonly">

                        </div>

                        <div class='form-group'>

                            <label>종료시간</label> <input class='form-control' type="time"

                                id='endTime' name='endTime'>

                        </div>

                        <div class='form-group'>

                            <label>종료날짜</label> <input class='form-control startDate'

                                type="date" id='endDate' name='endDate'>

                        </div>

                        <div class='form-group'>

                            <label>내용</label>

                            <textarea rows="7" class='form-control' id="description"

                                name='description'></textarea>

                        </div>

                        <div class='modal-footer'>

                            <input type="button" class='btn btn-sm btn-warning' value="확인"

                                onclick="calendarSchduleAdd()" /> <input type="reset"

                                class='btn btn-sm btn-warning' value="초기화" /> <input

                                type='button' class='btn btn-sm btn-warning'

                                data-dismiss='modal' value="취소" />

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

    <!-- 일정 수정 modal -->

    <div class="modal fade" id="schduleFormModify" role="dialog">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal">×</button>

                    <h4 class="modal-title">일정수정</h4>

                </div>

                <div class="modal-body">

                    <form class='form-margin40' role='form' action="#" method='post'

                        id='frmSchduleModify'>

                        <div class='form-group'>

                            <label>제목</label> <input type='text' class='form-control'

                                id='modifySummary' name='summary'>

                        </div>

                        <div class='form-group'>

                            <label>내용</label>

                            <textarea rows="7" class='form-control' id="modifyDescription"

                                name='description'></textarea>

                        </div>

                        <input type="hidden" id="modifyEventId" name="eventId" /> <input

                            type="hidden" name="calendarId" value="${calendarId}" />

                        <div class='modal-footer'>

                            <input type="button" class='btn btn-sm btn-warning' value="확인"

                                onclick="modifyEvent()" /> <input type="reset"

                                class='btn btn-sm btn-warning' value="초기화" /> <input

                                type='button' class='btn btn-sm btn-warning'

                                data-dismiss='modal' value="취소" />

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</body>

</html>

