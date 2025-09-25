<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	top: 40%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="iq-edit-list-data">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="personal-information"
							role="tabpanel">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									<div class="header-title">
										<div class="card-body">
											<div class="card-body">
												<div
													class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
													<h5>우리 반 정보 수정</h5>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form name="myClassUpdateForm" action="myClassUpdate"
										method="post">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="classId"
													name="classId" readonly="readonly"
													value="${myClassUpdate.classId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="memberId">교사ID</label> <input type="text"
													readonly="readonly" class="form-control" id="memberId"
													name="memberId" value="${myClassUpdate.memberId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="classPw">반PW</label> <input type="password"
													class="form-control" id="classPw" name="classPw"
													value="${myClassUpdate.classPw}">
											</div>
											<div class="form-group col-sm-12">
												<label for="states">시,도</label> <input type="text"
													class="form-control" id="states" name="states"
													value="${myClassUpdate.states}">
											</div>
											<div class="form-group col-sm-12">
												<label for="city">도시</label> <input type="text"
													class="form-control" id="city" name="city"
													value="${myClassUpdate.city}">
											</div>
											<div class="form-group col-sm-12">
												<label for="schoolName">학교명</label> <input type="text"
													class="form-control" id="schoolName" name="schoolName"
													value="${myClassUpdate.schoolName}">
											</div>
											<div class="form-group col-sm-12">
												<label for="grade">학년</label> <input type="text"
													class="form-control" id="grade" name="grade"
													value="${myClassUpdate.grade}">
											</div>
											<div class="form-group col-sm-12">
												<label for="classes">반</label> <input type="text"
													name="classes" class="form-control" id=classes
													value="${myClassUpdate.classes}">
											</div>
											<div class="form-group col-sm-12">
												<label for="classComment">반 소개</label> <input type="text"
													class="form-control" id="classComment" name="classComment"
													value="${myClassUpdate.classComment}">
											</div>
											<div class="form-group col-sm-12">
												<label for="createDate">생성일</label> <input type="text"
													class="form-control" id="createDate" name="createDate"
													readonly="readonly"
													value="<fmt:formatDate value="${myClassUpdate.createDate}" 
							pattern="yyyy-MM-dd" /> ">
											</div>
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="classState"
													name="classState" value="${myClassUpdate.classState}">
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='../myClass/myClassList'">취소</button>
										<button type="button" class="btn btn-primary mr-2">등록</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="alert alert-info layer" id="cnf" role="alert">
			<div class="iq-alert-text cnf align-self-center">수정 되었습니다.</div>
			<div>
				<button type="button" id="ok"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>
	</div>
	<script>
	$('form > :button').on('click', myClassUpdate);
	
		function myClassUpdate(event){
				// 보낼 데이터
				let objData = getMyClassInfo();
				for(let field in objData){
				}	
				
				 $('#cnf').show();	

				    $("#ok").click(function () {
				    	$.ajax('myClassUpdate',{
							type : 'post',
							contentType : 'application/json',
							data : JSON.stringify(objData)
						})
						.done(result =>{
							let message = '결과 : '+ result['result'];
							location.href = "/uriban/myhome";
						})
						.fail(reject => console.log(reject));
				    });	
				}
		
		function getMyClassInfo(){
				let formData = $('form').serializeArray();
		
				let formObj = {};
				$.each(formData, function(idx, obj){
					formObj[obj.name] = obj.value;
				});
		
				return formObj;
		}
	</script>
</body>
</html>