<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	<sec:authentication property="principal" var="p"/>
	<form name="surveySubmitForm" action="surveyAnswerInsert" method="post">
		<div class="container-fluid d-fex justify-content-center">
			<div class="row">
				<div class="col-sm-12 col-lg-12">
					<div class="card">
						<div class="card-header d-flex justify-content-between">
							<div class="header-title delSurvNo">
								<input type="hidden" value="${surveyInfo.survNo }">
								<h4 class="card-title">${surveyInfo.survTitle }</h4>
							</div>
						</div>
						<c:forEach items="${surveyInfo.question }" var="question" varStatus="queNo">
							<div class="question">
								<input type="hidden" name="memberId" value="${p.memberId }">
								<!-- 답안 단일체크 -->
								<c:if test="${question.questionCheck eq '단일체크' }">
									<div class="card-body radiobody">
										<p>${queNo.count }. <span style="font-weight: bold;"> ${question.questionContent }</span> (${ question.questionCheck})</p>
										<c:forEach items="${ question.answer}" var="answer" varStatus="singChk">
											<div class="custom-control custom-radio custom-radio-color-checked custom-control-inline single">
												<input type="hidden" name="answerNo" value="${answer.answerNo }">
		                        				<input type="radio" id="customRadio${singChk.current }" name="radiobtn${queNo.count }" class="custom-control-input bg-primary singbtn">
		                        				<label class="custom-control-label" for="customRadio${singChk.current }"> ${answer.answerContent }  </label>
		                     				</div>
										</c:forEach>
									</div>
								</c:if>
								<!-- 답안 중복체크 -->
								<c:if test="${question.questionCheck eq '중복체크 허용' }">
									<div class="card-body checkbody">
										<p>${queNo.count }. <span style="font-weight: bold;"> ${question.questionContent }</span> (${ question.questionCheck})</p>
										<c:forEach items="${ question.answer}" var="answer" varStatus="dupliChk">
		                      				<div class="custom-control custom-checkbox custom-checkbox-color-check custom-control-inline multi">
		                      					<input type="hidden" name="answerNo" value="${answer.answerNo }">
				                           		<input type="checkbox" class="custom-control-input bg-primary" id="customCheck${dupliChk.current }" name="chkbtn">
				                           		<label class="custom-control-label" for="customCheck${dupliChk.current }"> ${answer.answerContent } </label>
		                        			</div>
										</c:forEach>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-primary" type="submit">제출</button>
					<button class="btn btn-primary" type="button" onclick="location.href='surveyList'">뒤로가기</button>
				</div>
			</div>
		</div>
	</form>
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
	
	<div class="alert alert-info layer" id="cnf" role="alert">
		<div class="iq-alert-text cnf align-self-center">
			제출하시겠습니까?
		</div>
		<div>
			<button type="button" id="ok" class="btn btn-info float-right">확인</button>
			<button type="button" class="btn btn-outline-info float-right close1">취소</button>
		</div>
	</div>
	<script type="text/javascript">
		$('#done').hide();
		$('.close1').on('click', function() {
			$('.layer').hide();
		})
		$('[name="surveySubmitForm"]').on('submit', function(event){
			event.preventDefault();
			
			let survNo = $('.delSurvNo').find('input').val();
			
			let memberId = $('.question').find('input[type=hidden]').val();
			
			let list = [];
			let obj = {};
			
			let radio = $('input[type=radio]:checked');
			let check = $('input[type=checkbox]:checked');
			
			// 라디오 버튼 : 한개
			$(radio).each(function(i, box){
				let answerNo = $(box).closest('.single').find('input[type=hidden]').val();
				obj = {answerNo};
				
				list.push(obj);
			})
			
			// 체크 버튼 : 여러개
			$(check).each(function(i, box){
				let answerNo = $(box).closest('.multi').find('input[type=hidden]').val();
				obj = {answerNo};
				
				list.push(obj);
			})
			
			people = {survNo, memberId, respAnswer:list};
			
			$('#cnf').show();	
	    	$("#ok").click(function () {
	    		
				$.ajax({
					url: 'surveyAnswerInsert',
					type: 'post',
					contentType:'application/json',
					data: JSON.stringify(people)
				})
				.done(data=>{
					$('.done').text('제출되었습니다.');
					$('#done').show();
					$('#cnf').hide();
					location.href='surveyList';
				})
				.fail(reject => console.log(reject));
	    	})
		});
	</script>
</body>
</html>