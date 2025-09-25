<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<sec:authentication property="principal" var="p" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="card">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">설문지 등록</h4>
						</div>
					</div>
					<div class="card-body">
						<form name="surveyInsertForm" action="surveyInsert?${_csrf.parameterName}=${_csrf.token}" method="post">
							<div class="form-row">
								<div class="col-md-6 mb-3">
									<label for="validationDefault01">제목 작성</label> 
									<input type="text" class="form-control" id="validationDefault01" name="survTitle"> 
									<input type="hidden" name="classId" value="${myClass.classId}" />
								</div>
								<div class="col-md-3 mb-4"></div>
								<div class="col-md-3 mb-3"></div>
								<div class="col-md-3 mb-3">
									<label for="validationDefault04">설문 대상자</label> 
									<select class="form-control" id="validationDefault04" name="accountType">
										<option value="E101">학생</option>
										<option value="E102">학부모</option>
										<option value="E103">학생, 학부모</option>
									</select>
								</div>
								<div class="col-md-3 mb-3">
									<label for="validationDefault02">설문시작일</label> 
									<input type="date" class="form-control" id="validationDefault02" name="startDate">
								</div>
								<div class="col-md-3 mb-3">
									<label for="validationDefault02">설문종료일</label>
									<input type="date" class="form-control" id="validationDefault02" name="endDate">
								</div>
								<button class="btn btn-primary m-3" id="plusBtn" type="button">설문지 만들기</button>
							</div>

							<!-- 문제 반복부분  문제 1 -->
							<div class="col-lg-12 plus" id="plus"></div>
							<div class="form-group">
								<button class="btn btn-warning" type="submit">등록</button>
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
	<div class="col-lg-12 plusPle" id="plusPle" style="display: none">
		<div class="card card-widget task-card">
			<div class="card-body">
				<div class="d-flex flex-wrap align-items-center justify-content-between">
					<div class="d-flex align-items-center">
						<div class="custom-control custom-task custom-checkbox custom-control-inline">
							<input type="checkbox" class="custom-control-input" id="customCheck01"> 
							<label class="custom-control-label" for="customCheck01"></label>
						</div>
						<div class="form-group mb-0 position-relative">
							<input type="text" class="form-control bg-white" placeholder="질문을 입력하세요." 
								name="questionContent" size="120"> 
							<a href="#" class="task-edit task-simple-edit text-body">
								<i class="ri-edit-box-line"></i>
							</a>
						</div>
					</div>
					<div class="media align-items-center mt-md-0 mt-3">
						<a class="btn btn-primary" data-toggle="collapse" href="#collapseEdit1" role="button" aria-expanded="false"
							aria-controls="collapseEdit1"> 
							<i class="ri-edit-box-line m-0"></i>펼치기
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 설문조사 보기(답변) start -->
		<div class="collapse" id="collapseEdit1">
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
					<div class="col-lg-10 mt-3 plusPlease" id="plusPlease">
						<div class="form-group row mb-6 position-relative">
							<div class="col-sm-9">
								<input type="text" class="form-control bg-white" name="answerContent"
									placeholder="답안을 입력하세요."> 
								<a href="#" class="task-edit task-simple-edit text-body mr-2">
									<i class="ri-edit-box-line"></i>
								</a>
							</div>
							<div class="col-sm-2">
								<input class="btn btn-primary mt-1" type="button" value="ㅡ"> 
							</div>
						</div>
					</div>
					<div class="col-lg-10 plusPlease" id="plusPlease">
						<div class="form-group row mb-6 position-relative">
							<div class="col-sm-9">
								<input type="text" class="form-control bg-white" name="answerContent"
									placeholder="답안을 입력하세요."> 
								<a href="#" class="task-edit task-simple-edit text-body mr-2">
									<i class="ri-edit-box-line"></i>
								</a>
							</div>
							<div class="col-sm-2">
								<input class="btn btn-primary mt-1" type="button" value="ㅡ"> 
							</div>
						</div>
					</div>
					<!-- 복제되는 부분 -->
					<div class="" id="plusHappy"></div>
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
		$('[name="surveyInsertForm"]').on('submit', function(event){
			event.preventDefault();
			
			let list = [];
			
			let questionContent = '';
			let answerContent = '';
			// 문제 for문
			$("#plus .plusPle").each(function(i, surveybox){
				let questionCheck = $(surveybox).find('[name="questionCheck"]').val();
				questionContent = $(surveybox).find('[name="questionContent"]').val();
				let obj = { questionContent, questionCheck};
				let answerlist = [];
				
				// 보기 for문
				$(surveybox).find('[name="answerContent"]').each(function(j, answerbox){
					answerContent = $(answerbox).val();
					
					answerlist.push({answerContent})
				}) 
				
				obj.answer = answerlist;
				
				list.push(obj);
			})
			let classId = $('[name="classId"]').val();
			console.log(classId);
			let survTitle = $('[name="survTitle"]').val();			
			let survNo = $('[name="survNo"]').val();	
			let accountType = $('[name="accountType"]').val();
			let survStatus = $('[name="survStatus"]').val();
			let startDate = $('[name="startDate"]').val();	
			let endDate = $('[name="endDate"]').val();	
			
			if(survTitle == ''){
				$('.done').text('제목을 작성하세요.');
				$('#done').show();
				return;
			} 
			if(startDate == ''){
				$('.done').text('시작일을 선택하세요.');
				$('#done').show();
				return;
			}
			if(endDate == ''){
				$('.done').text('마감일을 선택하세요.');
				$('#done').show();
				return;
			}
			if (Number(startDate.replace(/-/gi,"")) > Number(endDate.replace(/-/gi,""))) {
				$('.done').text('시작일이 종료일보다 클 수 없습니다.');
				$('#done').show();
				return false;
			}
			if(questionContent == ''){
				$('.done').text('질문을 작성하세요.');
				$('#done').show();
				return;
			} 
			if(answerContent == ''){
				$('.done').text('답안을 작성하세요.');
				$('#done').show();
				return;
			}
			
			// surveyVO
			survey = {classId, survTitle, survNo, accountType, survStatus, startDate, endDate, question:list}
			console.log(survey);
			
			$.ajax({
				url:'surveyInsert',
				type: 'post',
				contentType:'application/json',
				data: JSON.stringify(survey)
			})
			.done(data=>{
				$('.done').text('등록되었습니다.');
				$('#done').show();
				location.href='surveyList';
			})
			.fail(err=>{});
		});
		
		
		$(document).ready(function() {
			let plusNum = 1;
			$("#plusBtn").click(function(){
				let plipli = $("#plusPle").clone();
				
				//id 속성 변경
				// #collapseEdit1을 가져올 때는 처음에는 뒤에 1이 들어와야 하고 다음에 펼치기에는 2가 들어와야 하기 때문에 href에 ++를 한다.
				plipli.find('#collapseEdit1').attr('id', 'collapseEdit'+ plusNum)
				plipli.find('[href="#collapseEdit1"]').attr('href', '#collapseEdit'+plusNum++)
				plipli.css('display','block').attr('id', 'plusplus').appendTo("#plus");
			});
			
			// 문제 답변 answer 
			// .plusQueBtn를 부모 #plus에 복제한다.
			$('#plus').on("click", ".plusQueBtn", function(){
				let plusTar = $(event.target).closest('.collapse').find('#plusHappy')
				let newAn = $("#plusPlease").clone();
				newAn.find('input[type="text"]').val('');
				newAn.appendTo(plusTar);
			});
		});
		
	</script>
</body>
</html>