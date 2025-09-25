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
											<h5>우리 반 &#60;학부모 등록&#62;</h5>
										</div>
									</div>
								</div>
								<div class="card-body">
									<form
										action="parentsInsert?${_csrf.parameterName}=${_csrf.token}"
										method="post" accept-charset="utf-8">
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<label for="memberId">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsName">이름</label> <input type="text"
													class="form-control" id="parentsName" name="parentsName">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsEmail">이메일</label> <input type="text"
													class="form-control" id="parentsEmail" name="parentsEmail">
											</div>
											<div class="form-group col-sm-12">
												<label for="parentsTel">연락처</label> <input type="text"
													class="form-control" id=parentsTel name="parentsTel">
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='../parents/parentsList'">취소</button>
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