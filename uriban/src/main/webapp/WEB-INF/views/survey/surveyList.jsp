<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.layer {
	display: none;
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
							<h4 class="card-title">설문조사 목록</h4>
						</div>
						<input id="memberId" type="hidden" value="${p.memberId }">
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
										<th scope="col">설문상태</th>
										<c:if test="${p.authority eq 'ROLE_A104' || p.authority eq 'ROLE_A105'}">
											<th scope="col">설문하기</th>
										</c:if>
										<c:if test="${p.authority eq 'ROLE_A102' }">
											<th scope="col">응답자명단</th>
											<th scope="col">응답차트</th>
											<th scope="col">수정 | 삭제</th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:if test="${p.authority eq 'ROLE_A102' }">
										<c:forEach items="${surveyList }" var="list">
											<tr>
												<td>${list.survNo }</td>
												<td>${list.accountType }</td>
												<td>${list.survTitle }</td>
												<td><fmt:formatDate value="${list.startDate }" pattern="yyyy년MM월dd일" /></td>
												<td><fmt:formatDate value="${list.endDate }" pattern="yyyy년MM월dd일" /></td>
												<c:choose>
													<c:when test="${list.survStatus eq '진행' }">
														<td><span class="badge border border-info text-info">${list.survStatus }</span></td>
														<td>
															<button type="button" class="btn btn-primary"
																onclick="location.href='surveyCustList?survNo=${list.survNo}'">명단확인</button>
														</td>
														<td>
															<button type="button" class="btn btn-primary chartBtn">응답차트</button>
														</td>
														<td>
															<button type="button" class="btn btn-warning upBtn">수정</button>
															<button type="button" class="btn btn-danger delBtn">삭제</button>
														</td>
													</c:when>
													<c:when test="${list.survStatus eq '미진행' }">
														<td><span class="badge border border-secondary text-secondary">${list.survStatus }</span></td>
														<td>
															<button type="button" class="btn btn-primary"
																onclick="location.href='surveyCustList?survNo=${list.survNo}'">명단확인</button>
														</td>
														<td>
															<button type="button" class="btn btn-primary chartBtn">응답차트</button>
														</td>
														<td>
															<button type="button" class="btn btn-warning upBtn">수정</button>
															<button type="button" class="btn btn-danger delBtn">삭제</button>
														</td>
													</c:when>
													<c:otherwise>
														<td><span class="badge border border-danger text-danger">${list.survStatus }</span></td>
														<td>
															<button type="button" class="btn btn-primary"
																onclick="location.href='surveyCustList?survNo=${list.survNo}'">명단확인</button>
														</td>
														<td>
															<button type="button" class="btn btn-primary chartBtn">응답차트</button>
														</td>
														<td>
															<button type="button" class="btn btn-warning upBtn" disabled>수정</button>
															<button type="button" class="btn btn-danger delBtn" disabled>삭제</button>
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${p.authority eq 'ROLE_A104' }">
										<c:forEach items="${peopleList }" var="list">
											<c:if test="${list.accountType eq '학생' or list.accountType eq '학생, 학부모'}">
												<c:choose>
													<c:when test="${ list.survStatus eq '진행' or list.survStatus eq '마감'}">
														<tr>
															<td>${list.survNo }</td>
															<td>${list.accountType }</td>
															<td>${list.survTitle }</td>
															<td><fmt:formatDate value="${list.startDate }" pattern="yyyy년MM월dd일" /></td>
															<td><fmt:formatDate value="${list.endDate }" pattern="yyyy년MM월dd일" /></td>
															<c:if test="${ list.survStatus eq '진행'}">
																<c:choose>
																	<c:when test="${list.survAnswer eq '미응답'}">
																		<td><span class="badge border border-info text-info">${list.survStatus }</span></td>
																		<td>
																			<button type="button" class="btn btn-primary"
																				onclick="location.href='surveyAnswerInsert?survNo=${list.survNo}'">설문하기</button>
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td><span class="badge border border-info text-info">${list.survStatus }</span></td>
																		<td>
																			<button class="btn btn-warning" type="button" 
																				onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">내용보기</button>
																		</td>
																	</c:otherwise>
																</c:choose>
															</c:if>
															<c:if test="${ list.survStatus eq '마감'}">
																<c:choose>
																	<c:when test="${list.survAnswer eq '미응답'}">
																		<td><span class="badge border border-danger text-danger">${list.survStatus }</span></td>
																		<td>
																			<button type="button" class="btn btn-primary" disabled>설문하기</button>
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td><span class="badge border border-danger text-danger">${list.survStatus }</span></td>
																		<td>
																			<button class="btn btn-warning" type="button" disabled>내용보기</button>
																		</td>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</tr>
													</c:when>
													<c:otherwise>
														
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${p.authority eq 'ROLE_A105' }">
										<c:forEach items="${peopleList }" var="list">
											<c:if test="${list.accountType eq '학부모' or  list.accountType eq '학생, 학부모'}">
												<c:choose>
													<c:when test="${ list.survStatus eq '진행' or list.survStatus eq '마감'}">
														<tr>
															<td>${list.survNo }</td>
															<td>${list.accountType }</td>
															<td>${list.survTitle }</td>
															<td><fmt:formatDate value="${list.startDate }" pattern="yyyy년MM월dd일" /></td>
															<td><fmt:formatDate value="${list.endDate }" pattern="yyyy년MM월dd일" /></td>
															<c:if test="${ list.survStatus eq '진행'}">
																<c:choose>
																	<c:when test="${list.survAnswer eq '미응답'}">
																		<td><span class="badge border border-info text-info">${list.survStatus }</span></td>
																		<td>
																			<button type="button" class="btn btn-primary"
																				onclick="location.href='surveyAnswerInsert?survNo=${list.survNo}'">설문하기</button>
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td><span class="badge border border-info text-info">${list.survStatus }</span></td>
																		<td>
																			<button class="btn btn-warning" type="button" 
																				onclick="location.href = 'surveyAnswerList?survManNo=${list.survManNo }'">내용보기</button>
																		</td>
																	</c:otherwise>
																</c:choose>
															</c:if>
															<c:if test="${list.survStatus eq '미진행' and list.survAnswer eq '미응답'}">
																<td><span class="badge border border-secondary text-secondary">${list.survStatus }</span></td>
																<td>
																	<button type="button" class="btn btn-primary" disabled
																		onclick="location.href='surveyAnswerInsert?survNo=${list.survNo}'">설문하기</button>
																</td>
															</c:if>
															<c:if test="${ list.survStatus eq '마감'}">
																<c:choose>
																	<c:when test="${list.survAnswer eq '미응답'}">
																		<td><span class="badge border border-danger text-danger">${list.survStatus }</span></td>
																		<td>
																			<button type="button" class="btn btn-primary" disabled
																				onclick="location.href='surveyAnswerInsert?survNo=${list.survNo}'">설문하기</button>
																		</td>
																	</c:when>
																	<c:otherwise>
																		<td><span class="badge border border-danger text-danger">${list.survStatus }</span></td>
																		<td>
																			<button class="btn btn-warning" type="button" disabled>내용보기</button>
																		</td>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</tr>
													</c:when>
													<c:otherwise>
														
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${p.authority eq 'ROLE_A102' }">
				<button type="button" class="btn btn-primary" onclick="location.href='surveyInsert'">설문조사 등록</button>
			</c:if>
		</div>
	</div>
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text done">
			A simple <b>info</b> alert—check it out!
		</div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
	
	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text err">
			A simple <b>info</b> alert—check it out!
		</div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
	
	<div class="alert alert-info layer" id="cnf" role="alert">
		<div class="iq-alert-text cnf align-self-center">
			설문지를 삭제하시겠습니까?
		</div>
		<div>
			<button type="button" id="ok" class="btn btn-info float-right">확인</button>
			<button type="button" class="btn btn-outline-info float-right close1">취소</button>
		</div>
	</div>
	<script type="text/javascript">
		$('#done').hide();
		$('#err').hide();
		$('.close1').on('click', function() {
			$('.layer').hide();
		})
		$('#banList').DataTable({
	    	"order": [[ 4, "asc" ]],
		    ordering: true,
		    destroy : true
		}); 
		
		// 응답한 인원이 1명이라도 있을 시 삭제 안 됨
		$('.delBtn').on('click', function(e) {
			let tr = $(this).closest('tr');
		    let survNo = tr.find('td').eq(0).text();
		
	    	$('#cnf').show();	
	    	$("#ok").click(function () {
	    		
	    		$.ajax('surveyDeleteAll',{
					type : 'post',
					data : {survNo}
				})
				.done(result => {
					if(result < 0){
						$('.done').text('삭제되었습니다.');
						$('#done').show();
						$(this).closest('td').find(".delBtn").attr("disabled", true);
						tr.hide();
					} else{
						$('.done').text('응답내역이 있어 삭제가 취소되었습니다.');
						$('#done').show();
					}
					$('#cnf').hide();
				})
	    		.fail(reject => console.log(reject));
	    	})
		})	
			
		// 응답한 인원이 1명이라도 있을 시 수정 페이지 못 들어감
		$('.upBtn').on('click', function(){
			let tr = $(this).closest('tr');
			let survNo = tr.find('td').eq(0).text();
			
			$.ajax('surveyUpdateAll',{
				type : 'post',
				data : {survNo}
			})
			.done(result => {
				if(result > 0){
					$('.done').text('응답 내역이 있어 수정 불가입니다.');
					$('#done').show();
					$(this).closest('td').find(".upBtn").attr("disabled", true);
				} else {
					location.href='surveyUpdate?survNo='+ survNo;				
				}
			})
			.fail(reject => console.log(reject));
		})
		
		// 응답한 인원이 0명일 경우 차트 페이지 못 들어감
		$('.chartBtn').on('click', function(){
			let tr = $(this).closest('tr');
			let survNo = tr.find('td').eq(0).text();
			
			$.ajax('surveyChartAll',{
				type : 'post',
				data : {survNo}
			})
			.done(result => {
				if(result == 0){
					$('.done').text('응답 내역이 없어 들어갈 수 없습니다.');
					$('#done').show();
					$(this).closest('td').find(".chartBtn").attr("disabled", true);
				} else {
					location.href='surveyChart?survNo='+ survNo;
				}
			})
			.fail(reject => console.log(reject));
		})
	</script>

</body>
</html>