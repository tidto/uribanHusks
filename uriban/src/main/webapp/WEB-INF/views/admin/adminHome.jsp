<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
				<h4>관리자 페이지</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 h-100">
				<div class="card h-50 p-2">
					<div class="card-header d-flex justify-content-between pb-0">
						<div class="header-title">
							<h5>신고 내역</h5>
						</div>
						<div class="header-title">
							<button class="btn btn-link mt-2"
								onclick="location.href='${pageContext.request.contextPath}/admin/rptList'">
								<svg class="svg-icon" width="20" height="20"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
									fill="currentColor" stroke="currentColor" stroke-width="2"
									stroke-linecap="round" stroke-linejoin="round">
		                     <path
										d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
		                 </svg>
							</button>
						</div>
					</div>
					<div class="card-body">
						<table id="rptTB"
							class="table table-bordered table-responsive-md text-center">
							<thead>
								<tr>
									<th scope="col">신고번호</th>
									<th scope="col">게시글항목</th>
									<th scope="col">내용</th>
									<th scope="col">작성자</th>
									<th scope="col">신고사유</th>
									<th scope="col">신고자</th>
									<th scope="col">신고일자</th>
									<th scope="col">신고상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty rptList}">
									<c:forEach items="${rptList}" var="rpt" varStatus="cnt">
										<c:if test="${cnt.index lt 5}">
											<tr>
												<td>${rpt.reportNo}</td>
												<td>${rpt.contentsType}<span class="cttNo">${rpt.contentsNo}</span></td>
												<td>${rpt.content}</td>
												<td>${rpt.memberId}</td>
												<td>${rpt.reportType}</td>
												<td>${rpt.reporterId}</td>
												<td><fmt:formatDate value="${rpt.reportDate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${rpt.reportState}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${empty rptList}">
									<tr>
										<td colspan="8">내역이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xl-12 h-100">
				<div class="card h-50 p-2">
					<div class="card-header d-flex justify-content-between pb-0">
						<div class="header-title">
							<h5>교원인증 신청내역</h5>
						</div>
						<div class="header-title">
							<button class="btn btn-link mt-2"
								onclick="location.href='${pageContext.request.contextPath}/admin/applyList'">
								<svg class="svg-icon" width="20" height="20"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
									fill="currentColor" stroke="currentColor" stroke-width="2"
									stroke-linecap="round" stroke-linejoin="round">
		                     <path
										d="M5 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm14 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-7 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path>
		                 </svg>
							</button>
						</div>
					</div>
					<div class="card-body">
						<table id="crtTB"
							class="table table-bordered table-responsive-md text-center">
							<thead>
								<tr>
									<th scope="col">신청번호</th>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">자격사본</th>
									<th scope="col">신청일자</th>
									<th scope="col">신청상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty applyList}">
									<c:forEach items="${applyList}" var="app" varStatus="status">
										<c:if test="${status.index lt 5}">
											<tr>
												<td>${app.certNo}</td>
												<td>${app.memberId}</td>
												<td>${app.memberName}</td>
												<td>${app.originalfileName}</td>
												<td><fmt:formatDate value="${app.updateDate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${app.certStat}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${empty applyList}">
									<tr>
										<td colspan="6">내역이 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Page end  -->
	</div>

	<script type="text/javascript">
		$('#rptTB').on('click', function() {
			location.href = '${pageContext.request.contextPath}/admin/rptList';
		});

		$('#crtTB')
				.on(
						'click',
						function() {
							location.href = '${pageContext.request.contextPath}/admin/applyList';
						});
	</script>
</body>
</html>