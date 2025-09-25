<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body class=" color-light">
	<sec:authentication property="principal" var="p" />
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<div class="card-body">
							<div
								class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
								<h5>우리 반 찾기</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="datatable" class="table data-table table-striped">
								<thead>
									<tr class="ligth">
										<th>시,도</th>
										<th>도시</th>
										<th>학교명</th>
										<th>학년</th>
										<th>반</th>
										<th>만든날짜</th>
										<c:if
											test="${p.authority eq 'ROLE_A101' || p.authority eq 'ROLE_A104' }">
											<th>가입</th>
										</c:if>
										<c:if
											test="${p.authority eq 'ROLE_A101' || p.authority eq 'ROLE_A105' }">
											<th>학부모가입</th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${myClassList}" var="info">
										<tr>
											<td><input type="hidden" value="${info.classId}"
												name="classId">${info.states}</td>
											<td>${info.city}</td>
											<td>${info.schoolName}</td>
											<td>${info.grade}</td>
											<td>${info.classes}</td>
											<td><fmt:formatDate value="${info.createDate}"
													pattern="yyyy-MM-dd"></fmt:formatDate></td>
											<c:if
												test="${p.authority eq 'ROLE_A101' || p.authority eq 'ROLE_A104' }">
												<td><button type="button"
														class="action-button btn btn-primary mi-mr"
														data-action="join">학생가입</button></td>
											</c:if>
											<c:if
												test="${p.authority eq 'ROLE_A101' || p.authority eq 'ROLE_A105' }">
												<td><button type="button"
														class="action-button btn btn-primary mi-mr"
														data-action="parentsJoin">학부모가입</button></td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		let message = '${result}';

		if (message != '') {
			alert(message)
		}

		$("tbody > tr")
				.on(
						'click',
						function(e) {
							if (e.target.tagName === 'BUTTON') {
								let classId = $(e.currentTarget).find(
										"input[name='classId']").val();
								let action = $(e.target).data('action');

								if (action === 'join') {
									location.href = '${pageContext.request.contextPath }/student/studentJoin?classId='
											+ classId;
								} else if (action === 'parentsJoin') {
									location.href = '${pageContext.request.contextPath }/parents/parentsJoin?classId='
											+ classId;
								}
							}
						});
	</script>
	
</body>
</html>