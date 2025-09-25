

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
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h4 class="card-title">제한 이력</h4>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="banList" class="table data-table">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">대상자</th>
										<th scope="col">설문명</th>
										<th scope="col">설문시작일</th>
										<th scope="col">설문종료일</th>
										<c:if
											test="${p.authority eq 'ROLE_A104' || p.authority eq 'ROLE_A105'}">
											<th scope="col">설문하기</th>
										</c:if>
										<c:if test="${p.authority eq 'ROLE_A102' }">
											<th scope="col">설문상태</th>
											<th scope="col">응답명단</th>
											<th scope="col">응답차트</th>
											<th scope="col">수정 | 삭제</th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${surveyList }" var="list">
										<c:if test="${p.authority eq 'ROLE_A104' and list.accountType eq 'E101' or list.accountType eq 'E103'">
											<tr>
												<td>${list.survNo }</td>
												<td>${list.accountType }</td>
												<td>${list.survTitle }</td>
												<td><fmt:formatDate value="${list.startDate }"
														pattern="yyyy년MM월dd일" /></td>
												<td><fmt:formatDate value="${list.endDate }"
														pattern="yyyy년MM월dd일" /></td>
												<c:if
													test="${p.authority eq 'ROLE_A104' or p.authority eq 'ROLE_A105'}">
													<c:forEach items="${list.people }" var="people"
														varStatus="status">
															<c:choose>
																<c:when
																	test="${ p.memberId eq people.memberId and people.survAnswer eq '미응답'}">
																	<td>
																		<button type="button" class="btn btn-primary"
																			onclick="location.href='surveyAnswerInsert?survNo=${list.survNo}'">설문하기</button>
																	</td>
																</c:when>
																<c:otherwise>
																	<td>
																		<button class="btn btn-warning" type="button"
																			onclick="location.href = 'surveyAnswerList?survManNo=${people.survManNo }'">제출보기</button>
																		<input type="text" id="respCnt"
																		value="${status.count}" />
																	</td>
																</c:otherwise>
															</c:choose>
													</c:forEach>
												</c:if>
												<c:if test="${p.authority eq 'ROLE_A102' }">
													<td>${list.survStatus }</td>
													<td>
														<button type="button" class="btn btn-primary"
															onclick="location.href='surveyCustList?survNo=${list.survNo}'">명단확인</button>
													</td>
													<td>
														<button type="button" class="btn btn-primary"
															onclick="location.href='surveyChart?survNo=${list.survNo}'">명단차트</button>
													</td>
													<td>
														<button type="button" class="btn btn-warning upBtn">수정</button>
														<button type="button" class="btn btn-danger delBtn">삭제</button>
													</td>
												</c:if>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${p.authority eq 'ROLE_A102' }">
				<button type="button" class="btn btn-primary"
					onclick="location.href='surveyInsert'">설문조사 만들기</button>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
		$('.delBtn').on('click', function(e) {
			let tr = $(this).closest('tr');
	
		    let survNo = tr.find('td').eq(0).text();
			
			if (!confirm("설문지를 삭제하시겠습니까?")) {
				alert("취소되었습니다.");
			} else {
				$.ajax('surveyDeleteAll',{
					type : 'post',
					data : {survNo}
				})
				.done(result => {
					if(result > 0){
						console.log(result);
						alert("응답내역이 있어 삭제가 취소되었습니다.");
					} else {
						alert("설문지가 삭제되었습니다.");
					}
				})
				.fail(reject => console.log(reject));
			}
		})
		
// 		$('.upBtn').on('click', function(){
// 			let tr = $(this).closest('tr');
// 			let respCount = tr.find('td').find('#respCnt').val();
// 			console.log(respCount);
// 			// onclick="location.href='surveyUpdate?survNo=${list.survNo }'"
// 		})
	</script>

</body>
</html>