<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과제목록</title>
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
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text done" id="done2"></div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
	<div class="alert alert-info layer" data-value="${page.pageNo}" id="cnf" role="alert">
		<div class="iq-alert-text cnf align-self-center">
			정말 삭제하시겠습니까?	
		</div>
		<div>
			<button type="button" id="ok" class="btn btn-info float-right">확인</button>
			<button type="button" class="btn btn-outline-info float-right close1">취소</button>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<div class="d-flex justify-content-start breadcrumb-content">
				<h5><span>${myClass.schoolName}</span><span>${myClass.grade}학년</span><span>${myClass.classes}반</span>  과제목록</h5>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-sm bg-primary"
					onclick='location.href="${pageContext.request.contextPath }/homework/homeworkInsert"'>
					<i class="ri-add-fill"><span class="pl-1">과제 등록</span></i>
				</button>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<div>
				<form name="searchForm" action="${pageContext.request.contextPath}/homework/homeworkList">
					<input type="hidden" name="pageNo" value="1">
					<div class="input-group mb-1">
						<select class="custom-select" id="homeworkStatus" name="homeworkStatus">
				       		<option value="" selected>진행상태</option>
				       		<option value="미진행" <c:if test="${param.homeworkStatus == '미진행'}">selected</c:if> >미진행</option>
				       		<option value="진행중" <c:if test="${param.homeworkStatus == '진행중'}">selected</c:if>>진행중</option>
				       		<option value="마감" <c:if test="${param.homeworkStatus == '마감'}">selected</c:if>>마감</option>
				    	</select>
				    	<select class="custom-select" id="testSubject" name="testSubject">
				       		<option value="" selected>과목선택</option>
				       		<option value="국어" <c:if test="${param.testSubject == '국어'}">selected</c:if> >국어</option>
				       		<option value="수학" <c:if test="${param.testSubject == '수학'}">selected</c:if>>수학</option>
				       		<option value="영어" <c:if test="${param.testSubject == '영어'}">selected</c:if>>영어</option>
				    	</select>
						<input type="text" class="form-control" placeholder="제목 또는 날짜"
			              aria-label="제목 또는 날짜" name="keyword" value="${param.keyword}">
						<div class="input-group-append">
			              <button class="btn btn-primary" type="submit">검색</button>
			           </div>
			        </div>
			    </form>	
			</div>
				<div id="table">
			<table
				class="table table-bordered table-responsive-md table-striped text-center">
				<thead>
					<tr>
						<th>과목</th>
						<th>제목</th>
						<th>등록</th>
						<th>마감</th>
						<th>문항수</th>
						<th>제출인원</th>
						<th>과제상태</th>
						<th>제출상태</th>
						<th>수정 | 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageList}" var="list">
						<tr>
							<td>${list.testSubject}</td>
							<td>${list.homeworkTitle}</td>
							<td><fmt:formatDate value="${list.homeworkRdate}"
									pattern="yyyy월 MM월 dd일" /></td>
							<td><fmt:formatDate value="${list.homeworkDdate}"
									pattern="yyyy월 MM월 dd일" /></td>
							<td>${list.problemCount}</td>
							<td>${list.submitCount} / ${list.allStudent}</td>
							<td>${list.homeworkStatus}</td>
							<td><span>
									<button type="button"
										class="btn bg-danger-light btn-rounded btn-sm my-0"
										onclick="location.href='${pageContext.request.contextPath }/submitTest/submitTestList?homeworkNo=${list.homeworkNo}'">상세보기</button>
							</span></td>
								<!-- 날짜 조건만 비교됨 // 날짜 조건도 안됨 -->
							<c:choose>
								<c:when test="${list.submitCount eq '0' and list.homeworkDdate >= list.today}">
									<td><span>
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0"
												onclick="location.href='homeworkUpdate?homeworkNo=${list.homeworkNo}'">수정</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0"
												id="delBtn" onclick="remove()">삭제</button>
											<input type="hidden" value="${list.homeworkNo}" id="homeworkNo"> <!-- location.href='homeworkDelete?homeworkNo=${list.homeworkNo}' -->
									</span></td>
								</c:when>
								<c:otherwise>
								<td><span>
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0" disabled>수정</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button"
												class="btn bg-danger-light btn-rounded btn-sm my-0" disabled>삭제</button>
									</span></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- page el 사용 -->
			<ul class="pagination d-flex justify-content-center">
				<c:choose>
					<c:when test="${page.startPage eq page.pageNo}">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="javascript:goPage(${page.pageNo-1})">Previous</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="pages" begin="${page.startPage}"
					end="${page.endPage}">
					<c:if test="${page.pageNo ne pages}">
						<li class="page-item"><a class="page-link"
							href="javascript:goPage(${pages})">${pages}</a></li>
					</c:if>
					<c:if test="${page.pageNo eq pages}">
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="javascript:goPage(${pages})">${pages}<span
								class="sr-only">(current)</span></a></li>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${page.endPage eq page.pageNo}">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="javascript:goPage(${page.pageNo+1})">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		</div>
	</div>
	<script>
	// 필터링 시작
		$('#homeworkStatus').val("${param.homeworkStatus}");
		$('#homeworkStatus').on('change', function(){
			goPage(1)
		});
		
   		function goPage(pageNo){
   			searchForm.pageNo.value = pageNo;
   			searchForm.submit();
   		}
	// 필터링 끝
	// 삭제 알림 시작
		$('#cnf').hide();
		function remove() {
// 			let no = event.currentTarget.nextElementSibling.value;
				$('#cnf').show();
				$('#ok').click(function(){
					$('#cnf').hide();
					$('.done').text('삭제되었습니다');
			    	$('#done').show();
			    	
					setTimeout('gotoPage()', 500);
// 					location.href = 'homeworkDelete?homeworkNo='+no;
				})
		}
		let no = $('#homeworkNo').val();
		function gotoPage(){
			location.href = 'homeworkDelete?homeworkNo='+no;
		}
	// 삭제 알림 끝
	</script>
</body>
</html>