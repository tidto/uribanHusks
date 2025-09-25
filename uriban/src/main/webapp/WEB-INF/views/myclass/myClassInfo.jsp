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
											<h5>우리 반 &#60;반 정보&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form>

										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<label for="classId">반ID</label> <input type="text"
													class="form-control" id="classId"
													value="${myClassInfo.classId}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12" style="display: none">
												<label for="createrId">생성자ID</label> <input type="text"
													class="form-control" id="createrId"
													value="${myClassInfo.createrId}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12" style="display: none">
												<label for="classPw">반PW</label> <input type="text"
													class="form-control" id="classPw"
													value="${myClassInfo.classPw}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="states">시,도</label> <input type="text"
													class="form-control" id="states"
													value="${myClassInfo.states}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="city">도시</label> <input type="text"
													class="form-control" id="city" value="${myClassInfo.city}"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="schoolName">학교명</label> <input type="text"
													class="form-control" id="schoolName"
													value="${myClassInfo.schoolName}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="grade">학년</label> <input type="text"
													class="form-control" id="grade"
													value="${myClassInfo.grade}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="classes">반</label> <input type="text"
													class="form-control" id="classes"
													value="${myClassInfo.classes}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="classComment">반 소개</label> <input type="text"
													class="form-control" id="classComment"
													value="${myClassInfo.classComment}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12" style="display: none">
												<label for="createDate">생성일</label> <input type="text"
													class="form-control" id="createDate"
													value="<fmt:formatDate value="${myClassInfo.createDate}"
							pattern="yyyy-MM-dd" />"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12" style="display: none">
												<label for="classState">반상태</label> <input type="text"
													class="form-control" id="classState"
													value="${myClassInfo.classState}" readonly="readonly">
											</div>
										</div>
									</form>
								</div>
								<button type="button" class="btn iq-bg-danger"
									onclick="location.href='../myClass/myClassList'">목록</button>
								<button type="button" class="btn btn-primary mr-2"
									onclick="location.href='../myClass/myClassUpdate?classId=${myClassInfo.classId}'">수정</button>
								<button type="button" class="btn iq-bg-danger">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>