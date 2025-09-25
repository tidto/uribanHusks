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
								<div class="card-header d-flex justify-content-between">
									<div class="iq-header-title">
										<h4 class="card-title">Personal Information</h4>
									</div>
								</div>
								<div class="card-body">
									<form>
										<div class="form-group row align-items-center">
											<div class="col-md-12">
												<div class="profile-img-edit">
													<div class="crm-profile-img-edit">
														<img class="crm-profile-pic rounded-circle avatar-100"
															src="${pageContext.request.contextPath }/profile/${memberInfo.memberProfile}" alt="profile-pic">
														
													</div>
												</div>
											</div>
										</div>
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<label for="fname">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId"
													value="${memberInfo.memberId}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="lname">이름</label> <input type="text"
													class="form-control" id="memberName"
													value="${memberInfo.memberName}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="uname">연락처</label> <input type="text"
													class="form-control" id="phone" name="phone" value="${memberInfo.phone}"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="cname">메일</label> <input type="text"
													class="form-control" id="email"  name="email" value="${memberInfo.email}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="cname">생년월일</label> <input type="text"
													class="form-control" id="birth"
													value="<fmt:formatDate value="${memberInfo.birth}"
							pattern="yyyy-MM-dd" />" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="cname">권한</label> <input type="text"
													class="form-control" id="auth"
													value="${memberInfo.authKor}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="cname">가입일</label> <input type="text"
													class="form-control" id="createDate" name="createDate"
													value="<fmt:formatDate value="${memberInfo.createDate}"
							pattern="yyyy-MM-dd" />" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="cname">신고횟수</label> <input type="text"
													class="form-control" id="banCount" name="banCount"
													value="${memberInfo.banCount}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="cname">상태</label> <input type="text"
													class="form-control" id="memberState" name="memberState"
													value="${memberInfo.memberState}" readonly="readonly">
											</div>
										</div>
										<button type="button" class="btn iq-bg-danger" onclick="location.href='memberList'">목록</button>
										<button type="button" class="btn btn-primary mr-2" onclick="location.href='memberUpdate?memberId=${memberInfo.memberId}'">수정</button>
										<button type="button" class="btn iq-bg-danger">삭제</button>
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