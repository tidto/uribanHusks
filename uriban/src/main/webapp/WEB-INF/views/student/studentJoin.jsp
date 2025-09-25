<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
	<sec:authentication property="principal" var="p" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="iq-edit-list-data">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="personal-information"
							role="tabpanel">
							<div class="card">
								<div class="card-body">
									<div class="card-body">
										<div
											class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
											<h5>우리 반 &#60;가입하기&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form name="studentJoinForm"
										action="studentJoin?${_csrf.parameterName}=${_csrf.token}"
										method="post" accept-charset="utf-8">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="classId"
													name="classId" value="${studentVO.classId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentClassNo">학생 반 번호</label> <input
													type="text" class="form-control" id="studentClassNo"
													name="studentClassNo">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentName">이름</label> <input type="text"
													class="form-control" id="studentName" name="studentName"
													value="${p.memberName}">
											</div>
											<div class="form-group col-sm-12">
												<label for="memberId">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId"
													value="${p.memberId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentEmail">메일</label> <input type="text"
													class="form-control" id="studentEmail" name="studentEmail"
													value="${p.email}">
											</div>
											<div class="form-group col-sm-12">
												<label for="allergyList" class="mr-2">알레르기</label>
												<div>
													<c:forEach items="${G2}" var="info">
														<label for="allergyList">${info.subCdNm}</label>
														<input type="checkbox" class="allergyList mr-2"
															name="allergyList" value="${info.subCd}">
													</c:forEach>
												</div>
											</div>
											<div class="form-group col-sm-12">
												<label for="classPw">반 비밀번호</label> <input type="password"
													required class="form-control" id=classPw name="classPw">
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
			<div class="iq-alert-text cnf align-self-center">가입 되었습니다.</div>
			<div>
				<button type="button" id="ok"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>
		
		<div class="alert alert-info layer" id="cnf2" role="alert">
			<div class="iq-alert-text cnf align-self-center">가입 실패하였습니다.</div>
			<div>
				<button type="button" id="ok2"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>
	</div>
	<script>
	$('form > :button').on('click', studentJoin);

	function studentJoin(event) {
	    let objData = getStudentInfo();
	    let allergy = [];

	    $('.allergyList:checked').each(function(i, checkbox) {
	        let val = $(checkbox).val();
	        allergy.push(val);
	        console.log(val);
	    });

	    objData.allergy = allergy.join();
	    let requestData = JSON.stringify(objData);

	    // AJAX
	    $.ajax({
	        type: 'post',
	        url: 'studentJoin',  
	        contentType: 'application/json',
	        data: requestData,
	    })
	    .done(result => {
	        if (result === 1) {
	            $('#cnf').show();

	            $("#ok").click(function () {
	                location.href = '${pageContext.request.contextPath}/myhome'; // 상대 경로
	            });
	        } else {
	        	 $('#cnf2').show();
	        	 
	        	 $("#ok2").click(function () {
	                 location.href = '${pageContext.request.contextPath}/myClass/myClassList';
	             });
	        }
	    })
	    .fail(reject => console.log(reject)); // error
	}




	function getStudentInfo() {
	    let formData = $('form').serializeArray();
	    let formObj = {};
	    
	    $.each(formData, function (idx, obj) {
	        formObj[obj.name] = obj.value;
	    });
	    
	    return formObj;
	}
</script>
</body>
</html>