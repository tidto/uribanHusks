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
											<h5>우리 반 생성하기</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form
										action="myClassInsert?${_csrf.parameterName}=${_csrf.token}"
										method="post" accept-charset="utf-8">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="memberId"
													name="memberId" value="${p.memberId}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="states">시,도</label> <input type="text"
													class="form-control" id="states" name="states" required>
											</div>
											<div class="form-group col-sm-12">
												<label for="city">도시(군,구)</label> <input type="text"
													class="form-control" id="city" name="city" required>
											</div>
											<div class="form-group col-sm-12">
												<label for="schoolName">학교명</label> <input type="text"
													class="form-control" id="schoolName" name="schoolName"
													required>
											</div>
											<div class="form-group col-sm-12">
												<label for="grade">학년</label> <input type="text"
													class="form-control" id=grade name="grade" required>
											</div>
											<div class="form-group col-sm-12">
												<label for="classes">반</label> <input type="text"
													class="form-control" id=classes name="classes" required>
											</div>
											<div class="form-group col-sm-12">
												<label for="classPw">반PW</label> <input type="password"
													class="form-control" id="classPw" name="classPw" required>
											</div>
											<div class="form-group col-sm-12">
												<label for="classComment">반 소개</label> <input type="text"
													class="form-control" id=classComment name="classComment">
											</div>
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="createDate"
													name="createDate" value="" />
											</div>
											<div class="form-group col-sm-12">
												<input type="hidden" value="정상" class="form-control"
													id=classState name="classState">
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='${pageContext.request.contextPath }/myClass/myClassList'">취소</button>
										<button type="submit" class="btn btn-primary mr-2">등록</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var now = new Date();

		var year = now.getFullYear();
		var month = String(now.getMonth() + 1).padStart(2, '0');
		var day = String(now.getDate()).padStart(2, '0');
		var formattedDate = year + '-' + month + '-' + day;

		document.getElementById('createDate').value = formattedDate;
	</script>
</body>
</html>