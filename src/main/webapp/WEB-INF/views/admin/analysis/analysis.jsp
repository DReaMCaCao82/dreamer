<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-md-4 col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">연령병/성별 회원 수</h4>
							<div class="row">
								<div class="col-12">
									<canvas id="ageNgender" width="400" height="400"
										style="z-index: 1050;"></canvas>
								</div>
							</div>

							<ul class="list-style-none mb-0">
								<li class="mt-3"><i
									class="fas fa-circle text-primary font-10 mr-2"></i> <span
									class="text-muted">남성 회원수</span> <span
									class="text-dark float-right font-weight-medium"> <c:set
											var="manCount" value="0" /> <c:forEach items="${AgeNGender}"
											var="item">
											<c:if test="${item['GENDER'] =='M' }">
												<c:set var="manCount" value="${manCount + item['COUNT']}" />
											</c:if>
										</c:forEach> ${manCount}
								</span></li>
								<li class="mt-3"><i
									class="fas fa-circle text-danger font-10 mr-2"></i> <span
									class="text-muted">여성 회원수</span> <span
									class="text-dark float-right font-weight-medium"> <c:set
											var="womanCount" value="0" /> <c:forEach
											items="${AgeNGender}" var="item">
											<c:if test="${item['GENDER'] =='F' }">
												<c:set var="womanCount"
													value="${womanCount + item['COUNT']}" />
											</c:if>
										</c:forEach> ${womanCount}
								</span></li>
								<li class="mt-3"><i
									class="fas fa-circle text-cyan font-10 mr-2"></i> <span
									class="text-muted">총 회원수</span> <span
									class="text-dark float-right font-weight-medium">${manCount + womanCount}</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-8 col-12">
					<div class="card">
						<div class="card-body">
							<div class="d-flex align-items-start">
								<h4 class="card-title mb-0">메인카테고리별 모임수</h4>
								<div class="ml-auto">
									<div class="dropdown sub-dropdown">
										<button class="btn btn-link text-muted dropdown-toggle"
											type="button" id="dd1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">
											<i data-feather="more-vertical"></i>
										</button>
										<div class="dropdown-menu dropdown-menu-right"
											aria-labelledby="dd1">
											<a class="dropdown-item" href="#">Insert</a> <a
												class="dropdown-item" href="#">Update</a> <a
												class="dropdown-item" href="#">Delete</a>
										</div>
									</div>
								</div>
							</div>
							<div class="pl-4 mb-5">
								<canvas id="categoryNmeeting"></canvas>
							</div>
							<ul class="list-inline text-center mt-4 mb-0">
								<li class="list-inline-item text-muted font-italic">총 모임 수:
									<c:set var="meetingCount" value="0" /> <c:forEach
										items="${CategoryNMeeting}" var="item">
										<c:set var="meetingCount"
											value="${meetingCount + item['COUNT']}" />
									</c:forEach> ${meetingCount}
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">서브카테고리별 모임 수</h4>
							<div class="row">
								<div class="col-12">
									<canvas id="subcategoryNmeeting"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">지역별 모임 수</h4>
							<div class="row">
								<div class="col-12">
									<canvas id="townNmeeting"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
/* ageNgender */
var ctx = document.getElementById('ageNgender').getContext('2d');
var ageNgender = new Chart(ctx, {
type: 'bar',
data: {
    labels: ['10대','20대','30대','40대','50대','60대'],
    datasets: [{
        label: '남자',
        data: [
        	<c:forEach var="i"  begin="1" end="6">
            	<c:forEach items="${AgeNGender}" var="item">
            		<c:if test="${item['AGE'] == (i*10) and item['GENDER'] =='M' }">
		            		${item['COUNT']},
		            		<c:set var="toggleM" value="1"/>
		            </c:if>
            	</c:forEach>
            	<c:if test="${empty toggleM}" var="result">
            		0,
            	</c:if>
            	<c:if test="${not result}">
            		<c:remove var="toggleM" scope="page"/>
            	</c:if>
            	
        	</c:forEach>
        ],
        backgroundColor: [
            	'rgba(54, 162, 235, 0.2)',
            	'rgba(54, 162, 235, 0.2)',
            	'rgba(54, 162, 235, 0.2)',
            	'rgba(54, 162, 235, 0.2)',
            	'rgba(54, 162, 235, 0.2)',
            	'rgba(54, 162, 235, 0.2)',
        ],
        borderColor: [
            'rgba(54, 162, 235, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(54, 162, 235, 1)',	
        ],
        borderWidth: 1
    },
    {
        label: '여자',
        data: [
        	<c:forEach var="i"  begin="1" end="6">
        	<c:forEach items="${AgeNGender}" var="item">
        		<c:if test="${item['AGE'] == (i*10) and item['GENDER'] =='F' }">
	            		${item['COUNT']},
	            		<c:set var="toggleF" value="1"/>
	            </c:if>
        	</c:forEach>
        	<c:if test="${empty toggleF}" var="result">
        		0,
        	</c:if>
        	<c:if test="${not result}">
        		<c:remove var="toggleF" scope="page"/>
        	</c:if>
        	
    	</c:forEach>
        ],
        backgroundColor: [
            		'rgba(255, 99, 132, 0.2)',
            		'rgba(255, 99, 132, 0.2)',
            		'rgba(255, 99, 132, 0.2)',
            		'rgba(255, 99, 132, 0.2)',
            		'rgba(255, 99, 132, 0.2)',
            		'rgba(255, 99, 132, 0.2)',
        ],
        borderColor: [
            		'rgba(255, 99, 132, 1)',
            		'rgba(255, 99, 132, 1)',
            		'rgba(255, 99, 132, 1)',
            		'rgba(255, 99, 132, 1)',
            		'rgba(255, 99, 132, 1)',
            		'rgba(255, 99, 132, 1)',

        ],
        borderWidth: 1
    }
    ]
},
options: {
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero: true
            }
        }]
    }
}
});
	/* categoryNmeeting */
	var Maincategoryctx = document.getElementById('categoryNmeeting').getContext('2d');
	var categoryNmeeting = new Chart(Maincategoryctx, {
    type: 'bar',
    data: {
        labels: [
        	<c:forEach items="${CategoryNMeeting}" var="item">
				'${item['MAINCATEGORY']}',
			</c:forEach>
			],
        datasets: [{
            label: '카테고리별 모임 수',
            data: [
            	<c:forEach items="${CategoryNMeeting}" var="item">  	
	            		${item['COUNT']},
            	</c:forEach>
            ],
            backgroundColor: [
            	<c:forEach items="${CategoryNMeeting}" var="item">
	            	'rgba(183, 240, 177, 0.2)',     	
	        	</c:forEach>
            ],
            borderColor: [
            	<c:forEach items="${CategoryNMeeting}" var="item">           	
	            	'rgba(183, 240, 177, 1)',
	        	</c:forEach>
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
	
	/* subcategoryNmeeting */
	var Subcategoryctx = document.getElementById('subcategoryNmeeting').getContext('2d');
	var subcategoryNmeeting = new Chart(Subcategoryctx, {
    type: 'bar',
    data: {
        labels: [
        	<c:forEach items="${SubcategoryNMeeting}" var="item">  	
		    		'${item['SUBCATEGORY']}',
			</c:forEach>
				],
				 datasets: [{
			            label: '카테고리별 모임 수',
			            data: [
			            	<c:forEach items="${SubcategoryNMeeting}" var="item">  	
				            		${item['COUNT']},
			            	</c:forEach>
			            ],
			            backgroundColor: [
			            	<c:forEach items="${SubcategoryNMeeting}" var="item">
				            	'rgba(178, 235, 244, 0.2)',     	
				        	</c:forEach>
			            ],
			            borderColor: [
			            	<c:forEach items="${SubcategoryNMeeting}" var="item">           	
				            	'rgba(178, 235, 244, 1)',
				        	</c:forEach>
			            ],
			            borderWidth: 1
			        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
}); 
	/* townNmeeting */
	var Townctx = document.getElementById('townNmeeting').getContext('2d');
	var subcategoryNmeeting = new Chart(Townctx, {
    type: 'bar',
    data: {
        labels: [
        	<c:forEach items="${TownNMeeting}" var="item">  	
		    		'${item['TOWN']}',
			</c:forEach>
				],
				 datasets: [{
			            label: '지역별 모임 수',
			            data: [
			            	<c:forEach items="${TownNMeeting}" var="item">  	
				            		${item['COUNT']},
			            	</c:forEach>
			            ],
			            backgroundColor: [
			            	<c:forEach items="${TownNMeeting}" var="item">
				            	'rgba(255, 178, 245, 0.2)',     	
				        	</c:forEach>
			            ],
			            borderColor: [
			            	<c:forEach items="${TownNMeeting}" var="item">           	
				            	'rgba(255, 178, 245, 1)',
				        	</c:forEach>
			            ],
			            borderWidth: 1
			        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
}); 
</script>