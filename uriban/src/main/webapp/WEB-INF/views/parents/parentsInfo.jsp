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
											<h5>우리 반 &#60;학부모 정보&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class=" row align-items-center">
										<div class="form-group col-sm-12">
											<input type="hidden" class="form-control" id="parentsNo"
												value="${parentsInfo.parentsNo}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<input type="hidden" class="form-control" id="ClassId"
												value="${parentsInfo.classId}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="memberId">아이디</label> <input type="text"
												class="form-control" id="memberId"
												value="${parentsInfo.memberId}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="parentsName">이름</label> <input type="text"
												class="form-control" id="parentsName"
												value="${parentsInfo.parentsName}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentName">자녀</label> <input type="text"
												class="form-control" id="studentName"
												value="${parentsInfo.studentName}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="parents">관계</label> <input type="text"
												class="form-control" id="parents"
												value="${parentsInfo.parentsRel}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="parentEmail">이메일</label> <input type="text"
												class="form-control" id=parentEmail
												value="${parentsInfo.parentsEmail}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="parentsTel">연락처</label> <input type="text"
												class="form-control" id="parentsTel"
												value="${parentsInfo.parentsTel}" readonly="readonly">
										</div>
									</div>
								</div>
								<button type="button" class="btn iq-bg-danger"
									onclick="location.href='../parents/parentsList'">목록</button>
								<button type="button" class="btn btn-primary mr-2"
									onclick="location.href='../parents/parentsUpdate?parentsNo=${parentsInfo.parentsNo}'">수정</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>