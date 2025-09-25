<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
											<h5>우리 반 &#60;학부모 가입&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form name="parentsJoinForm"
										action="parentsJoin?${_csrf.parameterName}=${_csrf.token}"
										method="post" accept-charset="utf-8">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<input class="form-control" id="classId" type="hidden"
													name="classId" value="${classId.classId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentName">자녀 이름</label> <input type="text"
													class="form-control" id="studentName" name="studentName">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentId">자녀ID</label> <input type="text"
													class="form-control" id="studentId" name="studentId">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsName">이름</label> <input type="text"
													class="form-control" id="parentsName" name="parentsName"
													value="${p.memberName}">
											</div>
											<div class="form-group col-sm-12">
												<label for="memberId">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId"
													value="${p.memberId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsEmail">메일</label> <input type="text"
													class="form-control" id="parentsEmail" name="parentsEmail"
													value="${p.email}">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsRel">성별</label> <select
													class="form-control" id="parentsRel" name="parentsRel">
													<option value="모">모</option>
													<option value="부">부</option>
													<option value="조모">조모</option>
													<option value="조부">조부</option>
												</select>
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsTel">전화번호</label> <input type="text"
													class="form-control" id=parentsTel name="parentsTel"
													value="${p.phone}">
											</div>
											<div class="form-group col-sm-12">
												<label for="classPw">반PW</label> <input type="password"
													class="form-control" id=classPw name="classPw">
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='${pageContext.request.contextPath }/parents/myClassList'">취소</button>
										<button type="submit" class="btn btn-primary mr-2 ">등록</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>