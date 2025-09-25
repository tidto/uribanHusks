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
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h4>회원 관리</h4>
					</div>
				</div>
				<div class="card p-2">
					<div class="card-header d-flex justify-content-between">
						<div class="header-title">
							<h5>회원 목록</h5>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="banList" class="table data-table">
								<thead>
									<tr class="ligth">
										<th>프로필 사진</th>
										<th>아이디</th>
										<th>이름</th>
										<th>연락처</th>
										<th>메일</th>
										<th>상태</th>
										<th>권한</th>
										<th>가입일</th>
										<th style="min-width: 100px">변경</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${memberList}" var="mb">
										<tr>
											<td class="text-center"><img
												class="rounded img-fluid avatar-40"
												src="${pageContext.request.contextPath }/profile/${mb.memberProfile}"
												alt="profile"></td>
											<td>${mb.memberId}</td>
											<td>${mb.memberName}</td>
											<td>${mb.phone}</td>
											<td>${mb.email}</td>
											<td><c:choose>
													<c:when test="${mb.memberState eq '정상' }">
														<span class="badge bg-primary">${mb.memberState}</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-secondary">${mb.memberState}</span>
													</c:otherwise>
												</c:choose></td>

											<td><c:choose>
													<c:when
														test="${mb.authority eq '교사' or mb.authority eq '교사(미인증)'}">
														<span class="badge bg-primary">${mb.authority}</span>
													</c:when>
													<c:when test="${mb.authority eq '학생'}">
														<span class="badge bg-info">${mb.authority}</span>
													</c:when>
													<c:when test="${mb.authority eq '학부모' }">
														<span class="badge bg-secondary">${mb.authority}</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-dark">${mb.authority}</span>
													</c:otherwise>
												</c:choose></td>
											<td><fmt:formatDate value="${mb.createDate}"
													pattern="yyyy-MM-dd"></fmt:formatDate></td>
											<td>
												<div class="flex align-items-center list-user-action">
													<a class="btn btn-sm bg-primary editBtn"
														data-toggle="tooltip" data-placement="top" title=""
														data-original-title="수정" href="#"><i
														class="ri-pencil-line mr-0"></i></a> <a
														class="btn btn-sm bg-primary" data-toggle="tooltip"
														data-placement="top" title="" data-original-title="삭제"
														href="#"><i class="ri-delete-bin-line mr-0"></i></a>
												</div>
											</td>
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
	
		// 회원정보 상세
		$('tbody > tr').on('click', function(e) {
			if (e.target.tagName != 'TD')
				return; // 실제 이벤트가 발생한 대상이 td가아니면 동작안함

			
			let memberId = $(e.currentTarget).find('td:nth-of-type(2)').text();
		
			location.href = 'memberInfo?memberId=' + memberId;
		});
		
		// 회원정보 수정
		$('.editBtn').on('click', function(e) {
			let memberId = $(e.currentTarget).closest('tr').find('td:nth-of-type(2)').text();
			location.href='memberUpdate?memberId=' + memberId;
		});
		
		$('td > div > a:nth-of-type(2)').on('click', memberInfoDel)
			
		function memberInfoDel(event){
			let trTag = $(event.currentTarget).closest('tr');
			let memberId = $(trTag).children().eq(1).text();
			
			console.log(memberId);

			$.ajax('memberDelete?memberId='+memberId)
			.done(result => {
				console.log(result);
				//$(trTag).remove();
				let deleteId = result.list[0];
				$('tbody > tr > td:nth-of-type(2)').each(function(idx, tag){
					if($(tag).text() == deleteId){
						$(tag).parent().remove();
					}
				})
			})
			.fail(reject => console.log(reject));
		}
		
		$(document).ready(function () {
			  $('#banList').DataTable({
				    "order": [[ 7, "desc" ]],
				    ordering: true,
				    destroy : true
			  }); 
		});
	</script>
</body>
</html>