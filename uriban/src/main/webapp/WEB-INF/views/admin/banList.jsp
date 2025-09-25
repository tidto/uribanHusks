<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.layer {
	position: fixed;
	width: 20%;
	left: 50%;
	margin-left: -10%; /* half of width */
	top: 50%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="p" />
	</sec:authorize>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h4>제한 관리</h4>
					</div>
				</div>
				<div class="card p-2">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h5>제한 내역</h5>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="banList" class="table data-table">
								<thead>
									<tr class="ligth">
										<th scope="col">제한번호</th>
										<th scope="col">신고번호</th>
										<th scope="col">제한유형</th>
										<th scope="col">아이디</th>
										<th scope="col">제한횟수</th>
										<th scope="col">제한기간</th>
										<th scope="col">제한시작일자</th>
										<th scope="col">제한종료일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${banList}" var="ban">
										<tr>
											<td>${ban.banNo}</td>
											<td>${ban.reportNo}</td>
											<td>${ban.banType}</td>
											<td>${ban.memberId}</td>
											<td>${ban.banCount}</td>
											<td>${ban.banDay}</td>
											<td><fmt:formatDate value="${ban.banStartDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${ban.banEndDate}"
													pattern="yyyy-MM-dd" /></td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			$('#banList').DataTable({
				"order" : [ [ 0, "desc" ] ],
				ordering : true,
				destroy : true
			});
		});
	</script>

</body>
</html>