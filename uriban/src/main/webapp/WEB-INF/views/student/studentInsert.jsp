<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
								<div class="card-body">
									<div class="card-body">
										<div
											class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
											<h5>우리 반 &#60;학생 등록&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form
										action="studentInsert?${_csrf.parameterName}=${_csrf.token}"
										method="post" accept-charset="utf-8">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<input type="hidden" class="form-control" id="classId"
													name="classId" value="${ourClassId}">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentClassNo">반번호</label> <input type="text"
													class="form-control" id="studentClassNo"
													name="studentClassNo">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentName">이름</label> <input type="text"
													class="form-control" id="studentName" name="studentName">
											</div>
											<div class="form-group col-sm-12">
												<label for="birthday">생년월일</label> <input type="date"
													class="form-control" id="birthday" name="birthday"
													value="<fmt:formatDate value="${studentInfo.birthday}"
							pattern="yyyy-MM-dd" />">
											</div>
											<div class="form-group col-sm-12">
												<label for="studentSex">성별</label> <select
													class="form-control" id="studentSex" name="studentSex">
													<option value="남자">남자</option>
													<option value="여자">여자</option>
												</select>
											</div>
											<div class="form-group col-sm-12">
												<label for="remark">가정환경</label> <select
													class="form-control" id="remark" name="remark">
													<option value="">해당없음</option>
													<option value="G101">다문화가정</option>
													<option value="G102">한부모가정</option>
													<option value="G103">조부모가정</option>
													<option value="G104">기초생활수급자</option>
													<option value="G105">차상위계층</option>
												</select>
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='../student/studentList'">취소</button>
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
</body>
</html>