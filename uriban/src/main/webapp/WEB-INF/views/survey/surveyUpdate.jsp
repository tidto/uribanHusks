<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div class="col-sm-12 col-lg-12">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">설문지 수정</h4>
						</div>
					</div>
					<div class="card-body">
						<form name="surveyUpdateForm" action="surveyUpdate?${_csrf.parameterName}=${_csrf.token}" method="post">
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<input type="hidden" name="survNo" value="${surveyInfo.survNo }">
									<label for="validationDefault01">제목 작성</label>
									<input type="text" class="form-control" id="validationDefault01" name="survTitle" value="${surveyInfo.survTitle }">
								</div>
								<div class="col-md-3 mb-4"></div>
								<div class="col-md-3 mb-3"></div>
								<div class="col-md-2 mb-3">
									<label for="validationDefault04">설문 대상자</label> 
									<select class="form-control" id="validationDefault04" name="accountType">
										<option value="E101" <c:if test="${surveyInfo.accountType eq '학생'}">selected</c:if>>학생</option>
										<option value="E102" <c:if test="${surveyInfo.accountType eq '학부모'}">selected</c:if>>학부모</option>
										<option value="E103" <c:if test="${surveyInfo.accountType eq '학생, 학부모'}">selected</c:if>>학생, 학부모</option>
									</select>
								</div>
								<div class="col-md-3 mb-3">
									<label for="validationDefault02">설문시작일</label> 
									<input type="date" class="form-control" id="startDate" name="startDate"
										value="<fmt:formatDate value="${surveyInfo.startDate }" pattern="yyyy-MM-dd" />">
								</div>
								<div class="col-md-3 mb-3">
									<label for="validationDefault02">설문종료일</label> 
									<input type="date" class="form-control" id="endDate" name="endDate"
										value="<fmt:formatDate value="${surveyInfo.endDate }" pattern="yyyy-MM-dd" />">
								</div>
								<button class="btn btn-primary m-3" id="plusBtn" type="button">설문지 만들기</button>
							</div>

							<!-- 단건 조회 -->
							<div class="col-lg-12 plus" id="plus">
								<div class="col-lg-12 plusPle" id="plusPle">
									<c:forEach var="question" items="${ surveyInfo.question }" varStatus="status">
										<div class="question">
											<input type="hidden" name="questionNo" value="${question.questionNo }">
											<div class="card card-widget task-card">
												<div class="card-body">
													<div class="d-flex flex-wrap align-items-center justify-content-between">
														<div class="d-flex align-items-center checkBox">
															<div class="custom-control custom-task custom-checkbox custom-control-inline">
																<input type="checkbox" class="custom-control-input" id="customCheck${status.count}" name="checkName"> 
																<label class="custom-control-label" for="customCheck${status.count}"></label>
															</div>
															<div class="form-group mb-0 position-relative">
																<input type="text" class="form-control bg-white chkQuestion" name="questionContent"
																	value="${question.questionContent }" size="120"> 
																<a href="#" class="task-edit task-simple-edit text-body">
																	<i class="ri-edit-box-line"></i>
																</a>
															</div>
														</div>
														<div class="media align-items-center mt-md-0 mt-3">
															<a class="btn btn-primary aBtn" data-toggle="collapse" href="#collapse${status.count}" role="button"
																aria-expanded="false" aria-controls="collapse${status.count}"> 
																<i class="ri-edit-box-line m-0"></i>펼치기
															</a>
														</div>
													</div>
												</div>
											</div>
											<!-- 설문조사 보기(답변) start -->
											<div class="collapse" id="collapse${status.count}">
												<div class="card card-list task-card">
													<div class="card-body">
														<div class="row">
															<div class="col-lg-6">
																<div class="form-group mb-0">
																	<select class="form-control" id="validationDefault04" name="questionCheck">
																		<option value="E201" <c:if test="${question.questionCheck eq '단일체크'}">selected</c:if>>단일체크</option>
																		<option value="E202" <c:if test="${question.questionCheck eq '중복체크 허용'}">selected</c:if>>중복체크</option>
																	</select>
																</div>
															</div>
															<div class="col-lg-6">
																<button class="btn btn-primary plusQueBtn" id="plusQueBtn" type="button">답안 추가</button>
															</div>
														</div>
														<div class="col-lg-10 mt-3 plusPlease" id="plusPlease">
															<c:forEach var="answer" items="${question.answer }" varStatus="stat">
																<div class="form-group row mb-6 position-relative answerNone">
																	<input type="hidden" name="answerNo" value="${answer.answerNo }">
																	<div class="col-sm-9">
																		<input type="text" class="form-control bg-white" name="answerContent" value="${answer.answerContent }">
																		<a href="#" class="task-edit task-simple-edit text-body mr-2">
																			<i class="ri-edit-box-line"></i>
																		</a>
																	</div>
																	<div class="col-sm-2">
																		<input class="btn btn-primary mt-1" type="button" id="answerDel${stat.current}" value="ㅡ" name="bogi">
																	</div>
																</div>
															</c:forEach>
														</div>
														<div class="" id="plusHappy"></div>
													</div>
												</div>
											</div>
										</div>
										<!-- 설문조사 보기(답변) end -->
									</c:forEach>
								</div>
							</div>
							<div class="form-group">
								<button class="btn btn-warning" type="submit">수정</button>
								<button class="btn btn-danger delSelBtn" type="button">선택삭제</button>
								<button class="btn btn-primary" type="button" onclick="location.href='surveyList'">뒤로가기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- template -->
	<div class="col-lg-12 plusPle survTemp" id="plusPle" style="display: none">
		<div class="question" id="disNone">
			<div class="card card-widget task-card chkNone">
				<div class="card-body">
					<div class="d-flex flex-wrap align-items-center justify-content-between">
						<div class="d-flex align-items-center">
							<div class="custom-control custom-task custom-checkbox custom-control-inline checkDel">
								<input type="checkbox" class="custom-control-input" id="customCheck" name="checkName"> 
								<label class="custom-control-label" for="customCheck"></label>
							</div>
							<div class="form-group mb-0 position-relative">
								<input type="text" class="form-control bg-white p-6" placeholder="문제를 입력하세요." name="questionContent" size="120"> 
								<a href="#" class="task-edit task-simple-edit text-body">
									<i class="ri-edit-box-line"></i>
								</a>
							</div>
						</div>
						<div class="media align-items-center mt-md-0 mt-3">
							<a class="btn btn-primary aBtn" data-toggle="collapse" href="#collapseEdit1" role="button" aria-expanded="false"
								aria-controls="collapseEdit1">
								<i class="ri-edit-box-line m-0"></i>펼치기
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 설문조사 보기(답변) start -->
			<div class="collapse spanTemp" id="collapseEdit1">
				<div class="card card-list task-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group mb-0">
									<select class="form-control" id="validationDefault04" name="questionCheck">
										<option value="E201">단일체크</option>
										<option value="E202">중복체크</option>
									</select>
								</div>
							</div>
							<div class="col-lg-6">
								<button class="btn btn-primary plusQueBtn" id="plusQueBtn" type="button">답안 추가</button>
							</div>
						</div>
						
						
						<div class="col-lg-10 mt-3 plusPlease answerTemp" id="plusPlease">
							<div class="form-group row mb-6 position-relative">
								<div class="col-sm-9">
										<input type="text" class="form-control bg-white" name="answerContent" value="${answer.answerContent }" placeholder="답안을 입력하세요.">
										<a href="#" class="task-edit task-simple-edit text-body mr-2">
											<i class="ri-edit-box-line"></i>
										</a>
									</div>
								<div class="col-sm-2">
									<input class="btn btn-primary mt-1" type="button" id="answerDel${stat.current}" value="ㅡ" name="bogi">
								</div>
							</div>
						</div>
						<div class="col-lg-10 plusPlease" id="plusPlease">
							<div class="form-group row mb-6 position-relative">
								<div class="col-sm-9">
									<input type="text" class="form-control bg-white p-6" name="answerContent" placeholder="답안을 입력하세요."> 
									<a href="#" class="task-edit task-simple-edit text-body mr-2">
										<i class="ri-edit-box-line"></i>
									</a>
								</div>
								<div class="col-sm-2">
									<input class="btn btn-primary" id="answerDel" name="bogi" type="button" value="ㅡ"> 
								</div>
							</div>
						</div>
						<div class="" id="plusHappy"></div>
					</div>
				</div>
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
		
		$('[name="surveyUpdateForm"]').on('submit', function(event){
			event.preventDefault();
			
			let list = [];
			
			// 설문조사 업데이트
			$("#plus .question").each(function(i, surveybox){
				let questionCheck = $(surveybox).find('[name="questionCheck"]').val();
				let questionContent = $(surveybox).find('[name="questionContent"]').val();
				let obj = { questionContent, questionCheck};
// 				let anscnt = 1;
// 				quecnt += 1;
// 				console.log('문제번호 : ' + quecnt);
				let answerlist = [];
				$(surveybox).find('[name="answerContent"]').each(function(j, answerbox){
					let answerContent = $(answerbox).val();
					
					answerlist.push({answerContent})
					
				})
				obj.answer = answerlist;
				
				list.push(obj);
// 				anscnt += 1;
// 				console.log('보기번호 : ' + anscnt);
			})
			let survTitle = $('[name="survTitle"]').val();			
			let survNo = $('[name="survNo"]').val();	
			let accountType = $('[name="accountType"]').val();	
			let startDate = $('[name="startDate"]').val();	
			let endDate = $('[name="endDate"]').val();	
			let survStatus = $('[name="survStatus"]').val();
			
			if (Number(startDate.replace(/-/gi,"")) > Number(endDate.replace(/-/gi,""))) {
				   alert("시작일이 종료일보다 클 수 없습니다.");
				   startDate.focus();
				   return false;
			}
			
			survey = {survTitle, survNo, accountType, startDate, endDate, survStatus, question:list}
			console.log(survey);
			
			$.ajax({
				url:'surveyUpdate',
				type: 'post',
				contentType:'application/json',
				data: JSON.stringify(survey)
			})
			.done(data=>{
				$('.done').text('수정되었습니다.');
				$('#done').show();
				location.href='surveyList';
			})
			.fail(err=>{});
		});
		// 설문조사 업데이트 end
		
		// 선택 문제 삭제
		$('.delSelBtn').on('click', surveyDelete);
		function surveyDelete(event){
			event.preventDefault();
			
			let list = [];
			let checkName = $('[name="checkName"]:checked');
			let survNo = $('[name="survNo"]').val();
			
			$(checkName).each(function(i, box){
				
				let questionNo = $(box).parent().parent().parent().parent().parent().parent().find('input[type=hidden]').val();
				console.log(questionNo);
				
				// questionNo가 없을 경우/ 설문지 만들기 누르고 지울 경우
				if(questionNo != null){
					let obj = { questionNo };
					list.push(obj);
				} else {
					$(box).closest('.question').remove();
				}
			})
			// surveyVO에 담음
			survey = {survNo, question:list};
			
			if(list != null){
		
				$.ajax({
					url: 'surveyDelete',
					type: 'post',
					contentType: 'application/json',
					data: JSON.stringify(survey)
				})
				.done(result =>{
					$('.done').text('삭제되었습니다.');
					$('#done').show();
					// 여러개 삭제할 경우 대비해서 FOR문
					$(checkName).each(function(i, box){
						$(this).closest('.question').remove();
					})
				})
				.fail(reject =>{});
			} else{
				('.done').text('삭제되었습니다.');
				$('#done').show();
			}
		}
		// 선택 문제 삭제 end
		
		// 선택 보기 삭제 start
		$('input[name="bogi"]').on('click', function(event){
			event.preventDefault();
			let answerNo = $(this).closest('.answerNone').find('input[type=hidden]').val();
			console.log(answerNo);
			let noAnswer = $(this).closest('.spanTemp').find('input[type=hidden]');
			
			// answerNo가 없을 경우/ 설문지 만들기 누르고 지울 경우
			if(noAnswer == null){
				$(noAnswer).closest('.spanTemp').remove();
			} else {
				survAnswers = { answerNo };
			}
			
			$.ajax({
				url: 'answerDelete',
				type: 'post',
				contentType: 'application/json',
				data: JSON.stringify(survAnswers)
			})
			.done(result => {
				
				$(this).closest('.answerNone').remove();
			})
			.fail(reject =>{});
		})
		// 선택 보기 삭제 end
		
		// template 복제
		$(document).ready(function() {
			
			$("#plusBtn").click(function(){
				let plipli = $(".survTemp").clone();
				
				// abtn 업데이트된 갯수에 복제되는 것에 더하기 하기 위함
				let abtn = $('.aBtn').length;
				//id 속성 변경(펼치기)
				// #collapseEdit1을 가져올 때는 처음에는 뒤에 1이 들어와야 하고 다음에 펼치기에는 2가 들어와야 하기 때문에 href에 ++를 한다.
				plipli.find('.spanTemp').attr('id', 'collapse' + abtn);
				plipli.find('.aBtn').attr('href', '#collapse' + abtn);
				// 문제 check해서 삭제할 때
				plipli.find('.checkDel').find('input').attr('id', 'customCheck' + abtn);
				plipli.find('.checkDel').find('label').attr('for', 'customCheck' + abtn);
				
				plipli.css('display','block').attr('id', 'plusplus').appendTo("#plus");
				plipli.removeClass('survTemp');
			});
			
			// 문제 답변 answer 
			// .plusQueBtn를 부모 #plus에 복제한다.
			$('#plus').on("click", ".plusQueBtn", function(){
				let plusTar = $(event.target).closest('.collapse').find('#plusHappy');
				let ansTemp = $(".answerTemp").clone().appendTo(plusTar);
				ansTemp.find('input[type="text"]').val('');
				ansTemp.appendTo(plusTar);
				ansTemp.removeClass('answerTemp');
			});
		});
		// template end
	</script>
</body>
</html>