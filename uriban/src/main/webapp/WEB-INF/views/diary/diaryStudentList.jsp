<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<div class="card-body">
							<div
								class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
								<h5>우리 반 &#60;학생일지&#62;</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<div class="row justify-content-between">
								<div class="col-sm-6 col-md-6">
									<div id="user_list_datatable_info" class="dataTables_filter">
										<form class="mr-3 position-relative">
											<div class="form-group mb-0">
												<input type="search" class="form-control"
													id="exampleInputSearch" placeholder="Search"
													aria-controls="user-list-table">
											</div>
										</form>
									</div>
								</div>
								<div class="col-sm-6 col-md-6">
									<div class="user-list-files d-flex">
										<a class="bg-primary" href="javascript:void();"> Print </a> <a
											class="bg-primary" href="javascript:void();"> Excel </a> <a
											class="bg-primary" href="javascript:void();"> Pdf </a>
									</div>
								</div>
							</div>
							<table id="user-list-table"
								class="table table-striped dataTable mt-4" role="grid"
								aria-describedby="user-list-page-info">
								<thead>
									<tr class="ligth">
										<th>반번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>메일</th>
										<th>성별</th>
										<th>생년월일</th>
										<th style="min-width: 100px">변경</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${studentList}" var="info">
										<tr>
											<td><input type="hidden" value="${info.studentNo}"
												name="studentNo">${info.studentClassNo}</td>
											<td>${info.memberId}</td>
											<td>${info.studentName}</td>
											<td>${info.studentEmail}</td>
											<td>${info.studentSex}</td>
											<td><fmt:formatDate value="${info.birthday}"
													pattern="yyyy-MM-dd"></fmt:formatDate></td>
											<td>
												<div class="flex align-items-center list-user-action">
													<button class="btn btn-sm bg-primary" data-toggle="tooltip"
														data-placement="top" title="" data-original-title="일지작성"
														type="button" name="diaryInfo">
														<i class="ri-pencil-line mr-0"></i>
													</button>
													<button class="btn btn-sm bg-primary" data-toggle="tooltip"
														data-placement="top" title="" data-original-title="삭제">
														<i class="ri-delete-bin-line mr-0"></i>
													</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row justify-content-between mt-3">
							<div id="user-list-page-info" class="col-md-6">
								<span>Showing 1 to 5 of 5 entries</span>
							</div>
							<div class="col-md-6">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-end mb-0">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
										<li class="page-item active"><a class="page-link"
											href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">Next</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('button[name="diaryInfo"]').on(
				'click',
				function(e) {
					let studentNo = $(this).closest('tr').find(
							"input[name='studentNo']").val();
					location.href = 'diaryInfo?studentNo=' + studentNo;
				});
	</script>
</body>
</html>