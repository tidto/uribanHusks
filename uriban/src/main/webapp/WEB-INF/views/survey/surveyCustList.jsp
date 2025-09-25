<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.layer {
		display: none;
		position: fixed;
		width: 20%;
		left: 50%;
		margin-left: -10%; /* half of width */
		top: 50%;
		margin-top: -150px; /* half of height */
		overflow: auto;
		z-index: 10000;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card card-block card-stretch card-height">
					<div class="card-body"></div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">설문조사 명단</h4>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<ul class="nav nav-tabs" id="myTab-1" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="wait-tab" data-toggle="tab" href="#wait" role="tab"
										aria-controls="home" aria-selected="true">전체</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
										aria-controls="profile" aria-selected="false">학생</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
									aria-controls="contact" aria-selected="false">학부모</a>
								</li>
							</ul>
							<div class="tab-content" id="myTabContent-2">
								<div class="tab-pane fade show active" id="wait" role="tabpanel" aria-labelledby="wait-tab">
									<h6><span class="counter response1"></span>명 중 <span class="all1">${fn:length(peopleList)}</span>명</h6>
									<div class="d-flex align-items-center justify-content-between mt-1">
										<p class="mb-0">전체 응답명단</p>
										<span class="text-primary percent1"></span>
									</div>
									<div class="iq-progress-bar bg-primary-light mb-5">
										<span class="bg-primary iq-progress progress-1 per1" data-percent=""></span>
									</div>
									<div class="table-responsive">
										<table id="datatable" class="table data-table table-striped">
											<thead>
												<tr class="ligth">
													<th scope="col">No.</th>
													<th scope="col">설문번호</th>
													<th scope="col">이름</th>
													<th scope="col">대상자유형</th>
													<th scope="col">제출</th>
													<th scope="col">제출현황</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${peopleList }" var="list" varStatus="status">
													<tr>
														<td>${list.survManNo }</td>
														<td class="survNo">${list.survNo }</td>
														<td>${list.memberName }</td>
														<td>${list.accountType }
															<span class="answer1" style="display: none;">${list.survAnswer }</span>
														</td>
														<c:choose>
															<c:when test="${list.survAnswer eq '응답' }">
																<td>${list.survAnswer }</td>
																<td> 
																	<button class="btn btn-primary" type="button"
																		onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">제출보기</button>
																</td>
															</c:when>
															<c:otherwise>
																<td class="text-secondary">${list.survAnswer }</td>
																<td> 
																	<button class="btn btn-primary" type="button" disabled
																		onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">미제출</button>
																</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<h6><span class="counter response2"></span>명 중 <span class="all2"></span>명</h6>
									<div class="d-flex align-items-center justify-content-between mt-1">
										<p class="mb-0">학생 응답명단</p>
										<span class="text-primary percent2"></span>
									</div>
									<div class="iq-progress-bar bg-primary-light mb-5">
										<span class="bg-primary iq-progress progress-1 per2" data-percent=""></span>
									</div>
									<table id="datatable" class="table data-table table-striped table1">
										<thead>
											<tr class="ligth tr1">
												<th scope="col">No.</th>
												<th scope="col">설문번호</th>
												<th scope="col">이름</th>
												<th scope="col">대상자유형</th>
												<th scope="col">제출</th>
												<th scope="col">제출현황</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${peopleList }" var="list">
												<c:if test="${list.accountType eq '학생'}">
													<tr>
														<td>${list.survManNo }</td>
														<td>${list.survNo }</td>
														<td>${list.memberName }</td>
														<td class="account2">${list.accountType }
															<span class="answer2" style="display: none;">${list.survAnswer }</span>
														</td>
														<c:choose>
															<c:when test="${list.survAnswer eq '응답' }">
																<td>${list.survAnswer }</td>
																<td> 
																	<button class="btn btn-primary" type="button"
																		onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">제출보기</button>
																</td>
															</c:when>
															<c:otherwise>
																<td class="text-secondary">${list.survAnswer }</td>
																<td> 
																	<button class="btn btn-primary" type="button" disabled
																		onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">미제출</button>
																</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="contact" role="tabpanel"
									aria-labelledby="contact-tab">
									<h6><span class="counter response3"></span>명 중 <span class="all3"></span>명</h6>
									<div class="d-flex align-items-center justify-content-between mt-1">
										<p class="mb-0">학부모 응답명단</p>
										<span class="text-primary percent3"></span>
									</div>
									<div class="iq-progress-bar bg-primary-light mb-5">
										<span class="bg-primary iq-progress progress-1 per3" data-percent=""></span>
									</div>
									<table id="rptList3" class="table data-table table-striped">
										<thead>
											<tr class="ligth">
												<th scope="col">No.</th>
												<th scope="col">설문번호</th>
												<th scope="col">이름</th>
												<th scope="col">대상자유형</th>
												<th scope="col">제출</th>
												<th scope="col">제출현황</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${peopleList }" var="list">
												<c:if test="${list.accountType eq '학부모'}">
													<tr>
														<td>${list.survManNo }</td>
														<td>${list.survNo }</td>
														<td>${list.memberName }</td>
														<td class="account3">${list.accountType }
															<span class="answer3" style="display: none;">${list.survAnswer }</span>
														</td>
														<c:choose>
															<c:when test="${list.survAnswer eq '응답' }">
																<td>${list.survAnswer }</td>
																<td> 
																	<button class="btn btn-primary" type="button"
																		onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">제출보기</button>
																</td>
															</c:when>
															<c:otherwise>
																<td class="text-secondary">${list.survAnswer }</td>
																<td> 
																	<button class="btn btn-primary" type="button" disabled
																		onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">미제출</button>
																</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-primary" onclick="location.href='surveyList'">처음으로</button>
				<button type="button" class="btn btn-primary chartBtn">명단차트</button>
			</div>
		</div>
	</div>
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text done">
			A simple <b>info</b> alert—check it out!
		</div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
	
	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text err">
			A simple <b>info</b> alert—check it out!
		</div>
		<button type="button" class="close close1">
				<i class="ri-close-line"></i>
		</button>
	</div>
	<script type="text/javascript">
		$('#done').hide();
		$('.close1').on('click', function() {
			$('.layer').hide();
		})
		$('.chartBtn').on('click', function(){
			let survNo = $('.survNo').text();
			
			$.ajax('surveyChartAll',{
				type : 'post',
				data : {survNo}
			})
			.done(result => {
				if(result == 0){
					console.log(result);
					$('.done').text('응답 내역이 없어 들어갈 수 없습니다.');
					$('#done').show();
					$(this).closest('td').find(".chartBtn").attr("disabled", true);
				} else {
					console.log(result);
					location.href='surveyChart?survNo='+ survNo;
				}
			})
			.fail(reject => console.log(reject));
		})
	
		window.onload = function(){
			// 전체 응답 조회
			let noResp1 = $('.answer1:contains("미응답")').length;
			let all1 = $(".all1").text(); 
			let answer1 = all1 - noResp1;
	
			$(".response1").text(answer1);              
	
			let percent1 = (answer1 / all1) * 100;
	
			$('.percent1').text(percent1 + "%");
			$(".per1").css("width", percent1 + "%");
	
			// 학생 응답 조회
			let all2 = $('.account2:contains("학생")').length;
			$('.all2').text(all2);
			let noResp2 = $('.answer2:contains("미응답")').length;
	
			let answer2 = all2 - noResp2;
	
			$(".response2").text(answer2);
	
			let percent2 = (answer2 / all2) * 100;
	
			$('.percent2').text(percent2 + "%");
			$(".per2").css("width", percent2 + "%");
	
			// 학부모 응답 조회
			let all3 = $('.account3:contains("학부모")').length;
			$('.all3').text(all3);
			let noResp3 = $('.answer3:contains("미응답")').length;
			
			let answer3 = all3 - noResp3;
			$('.response3').text(answer3);
	
			let percent3 = (answer3 / all3) * 100;		
			
			$('.percent3').text(percent3 + "%");
			$(".per3").css("width", percent3 + "%");
			
		}
		
		
		
	</script>
</body>
</html>

