<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
											<h5>우리 반 &#60;학생정보&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class=" row align-items-center">
										<div class="form-group col-sm-12">
											<input type="hidden" class="form-control" id="classId"
												value="${studentInfo.classId}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<input type="hidden" class="form-control" id="studentNo"
												value="${studentInfo.studentNo}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentNo">반 번호</label> <input type="text"
												class="form-control" id="studentNo"
												value="${studentInfo.studentClassNo}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentName">이름</label> <input type="text"
												class="form-control" id="studentName"
												value="${studentInfo.studentName}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="memberId">아이디</label> <input type="text"
												class="form-control" id="memberId"
												value="${studentInfo.memberId}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentEmail">메일</label> <input type="text"
												class="form-control" id="studentEmail"
												value="${studentInfo.studentEmail}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="birthday">생년월일</label> <input type="text"
												class="form-control" id="birthday"
												value="<fmt:formatDate value="${studentInfo.birthday}"
							pattern="yyyy-MM-dd" />"
												readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="studentSex">성별</label> <input type="text"
												class="form-control" id="studentSex"
												value="${studentInfo.studentSex}" readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="remark">특이사항</label> <input type="text"
												class="form-control" id=remark value="${studentInfo.remark}"
												readonly="readonly">
										</div>
										<div class="form-group col-sm-12">
											<label for="allergy">알레르기</label> <input type="text"
												class="form-control" id="allergy"
												value="${studentInfo.allergy}" readonly="readonly">
										</div>
									</div>
								</div>
								<button type="button" class="btn iq-bg-danger"
									onclick="location.href='../student/studentList'">목록</button>
								<button type="button" class="btn btn-primary mr-2"
									onclick="location.href='../student/studentUpdate?studentNo=${studentInfo.studentNo}'">수정</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>