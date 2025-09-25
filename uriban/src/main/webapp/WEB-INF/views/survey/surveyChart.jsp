<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<h4 class="card-title">설문조사 응답명단</h4>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<ul class="nav nav-tabs" id="myTab-1" role="tablist">
								<li class="nav-item">
									<a class="nav-link active"
									id="wait-tab" data-toggle="tab" href="#wait" role="tab"
									aria-controls="home" aria-selected="true">전체</a>
								</li>
								<li class="nav-item"><a class="nav-link" id="profile-tab"
									data-toggle="tab" href="#profile" role="tab"
									aria-controls="profile" aria-selected="false">학생</a>
								</li>
								<li class="nav-item"><a class="nav-link" id="contact-tab"
									data-toggle="tab" href="#contact" role="tab"
									aria-controls="contact" aria-selected="false">학부모</a>
								</li>
							</ul>
							<div class="tab-content" id="myTabContent-2">
								<div class="tab-pane fade show active" id="wait" role="tabpanel" aria-labelledby="wait-tab">
									<h6>${barChart.allResCnt }명 중 ${barChart.allCnt}명</h6>
									<div class="d-flex align-items-center justify-content-between mt-1">
										<p class="mb-0">전체 응답명단</p>
										<span class="text-primary percent1">${barChart.allPercent }%</span>
									</div>
									<div class="iq-progress-bar bg-primary-light mb-5">
										<span class="bg-primary iq-progress progress-1 per1" data-percent="${barChart.allPercent }"></span>
									</div>
									<!-- 바차트 end -->
									<c:forEach items="${chartList}" var="question"
										varStatus="status">
										<div class="card">
											<div class="card-header d-flex justify-content-between">
												<div class="header-title" style="margin-left: 270px; text-align: center;">
													<h4 class="card-title">${question.queMarkNo }.${question.questionContent } (${question.questionCheck })</h4>
													<input type="hidden" value="${question.survNo }">
												</div>
											</div>
											<div class="card-body" style="margin-left: 300px">
												<div id="chartId${status.count}"></div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<h6>${barChart.stuResCnt }명 중 ${barChart.stuCnt }명</h6>
									<div class="d-flex align-items-center justify-content-between mt-1">
										<p class="mb-0">학생 응답명단</p>
										<span class="text-primary percent2">${barChart.stuPercent } %</span>
									</div>
									<div class="iq-progress-bar bg-primary-light mb-5">
										<span class="bg-primary iq-progress progress-1 per2" data-percent="${barChart.stuPercent}"></span>
									</div>
									<c:forEach items="${chartList}" var="question"
										varStatus="status">
										<div class="card">
											<div class="card-header d-flex justify-content-between">
												<div class="header-title" style="margin-left: 270px; text-align: center;">
													<h4 class="card-title">${question.queMarkNo }.${question.questionContent } (${question.questionCheck })</h4>
												</div>
											</div>
											<div class="card-body" style="margin-left: 300px">
												<div id="chartIdId${status.count}"></div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
									<h6>${barChart.parResCnt }명 중 ${barChart.parCnt }명</h6>
									<div class="d-flex align-items-center justify-content-between mt-1">
										<p class="mb-0">학부모 응답명단</p>
										<span class="text-primary percent3">${barChart.parPercent}</span>
									</div>
									<div class="iq-progress-bar bg-primary-light mb-5">
										<span class="bg-primary iq-progress progress-1 per3" data-percent="${barChart.parPercent}"></span>
									</div>
									<c:forEach items="${chartList}" var="question"
										varStatus="status">
										<div class="card">
											<div class="card-header d-flex justify-content-between">
												<div class="header-title" style="margin-left: 270px; text-align: center;">
													<h4 class="card-title">${question.queMarkNo }.${question.questionContent } (${question.questionCheck })</h4>
												</div>
											</div>
											<div class="card-body" style="margin-left: 300px">
												<div id="chartIdIdId${status.count}"></div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-primary" onclick="location.href='surveyList'">처음으로</button>
				<button type="button" class="btn btn-primary listBtn">명단보기</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('.listBtn').on('click', function(){
			let survNo = $('input[type="hidden"]').val();
			location.href='surveyCustList?survNo=' + survNo;
		})
		
		window.onload = function() {
			
			// object를 JSON로 받음
			let chartData = ${chartJson};	
			console.log(chartData);
			// 전체 응답차트 start
			let cnt = 0;
			for(let i of chartData){
				let series = [];
				let labels = [];
				
				cnt++;
				for(let j of i.answerMap){
					series.push(j.responseCnt);
					labels.push(j.answerContent);
				}
				var options = {
						series: series,
		  				chart: {
		    				width: 700,
		    				type: 'pie',
		  				},
		  				labels: labels,
						responsive: [{
		    				breakpoint: 480,
		    				options: {
		   						chart: {
		        					width: 200
		      					},
		      					legend: {
		       						position: 'bottom'
		   						}
							}
						}]
					};
	    		var chart = new ApexCharts(document.querySelector("#chartId" + cnt), options);
				chart.render();
			}
			// 전체 응답차트 end
			
			// 학생 응답차트 start
			let cnt1 = 0;
			for(let i of chartData){
				let series = [];
				let labels = [];
				
				cnt1++;
				for(let j of i.answerMap){
					series.push(j.respStuCnt);
					labels.push(j.answerContent);
				}
				var options = {
						series: series,
		  				chart: {
		    				width: 700,
		    				type: 'pie',
		  				},
		  				labels: labels,
						responsive: [{
		    				breakpoint: 480,
		    				options: {
		   						chart: {
		        					width: 200
		      					},
		      					legend: {
		       						position: 'bottom'
		   						}
							}
						}]
					};
	    		var chart1 = new ApexCharts(document.querySelector("#chartIdId" + cnt1), options);
				chart1.render();
			}
			// 학생 응답차트 end
			
			// 학부모 응답차트 start
			let cnt2 = 0;
			for(let i of chartData){
				let series = [];
				let labels = [];
				
				cnt2++;
				for(let j of i.answerMap){
					series.push(j.respParCnt);
					labels.push(j.answerContent);
				}
				var options = {
						series: series,
		  				chart: {
		    				width: 700,
		    				type: 'pie',
		  				},
		  				labels: labels,
						responsive: [{
		    				breakpoint: 480,
		    				options: {
		   						chart: {
		        					width: 200
		      					},
		      					legend: {
		       						position: 'bottom'
		   						}
							}
						}]
					};
	    		var chart3 = new ApexCharts(document.querySelector("#chartIdIdId" + cnt2), options);
				chart3.render();
			}
			// 학부모 응답차트 end
			
			// 바차트 탭 넘어갈 때 애니메이션
			$(".nav-item").on('click', function(){
		  		jQuery(".iq-progress-bar > span").each(function () {
			    	let progressBar = jQuery(this);
				    let width = jQuery(this).data("percent");
				    progressBar.css({
					transition: "width 2s",
				    });

				    setTimeout(function () {
						progressBar.appear(function () {
				        	progressBar.css("width", width + "%");
						});
				    }, 1000);
				});
			})
		}
		
		
		
	</script>
</body>
</html>

