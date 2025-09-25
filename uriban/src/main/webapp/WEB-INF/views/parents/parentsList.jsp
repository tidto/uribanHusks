<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
<title>Insert title here</title>
</head>
<body class=" color-light">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<div class="card-body">
							<div
								class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
								<h5>우리 반 &#60;학부모 관리&#62;</h5>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="datatable" class="table data-table table-striped">
								<thead>
									<tr class="ligth">
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>자녀</th>
										<th>관계</th>
										<th>연락처</th>
										<th style="min-width: 100px">변경</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${parentsList}" var="info">
										<tr class="targetCard" data-memberno="${info.memberNo}">
											<td><input type="hidden" value="${info.parentsNo}"
												name="parentsNo"><input type="hidden"
												value="${info.classId}">${info.memberId}</td>
											<td>${info.memberNo}${info.parentsName}</td>
											<td>${info.parentsEmail}</td>
											<td>${info.studentName}</td>
											<td>${info.parentsRel}</td>
											<td>${info.parentsTel}
											<td>
												<div class="flex align-items-center list-user-action">
													<button class="btn btn-sm bg-primary" data-toggle="tooltip"
														data-placement="top" title="" data-original-title="수정"
														type="button" name="parentsInfo">
														<i class="ri-pencil-line mr-0"></i>
													</button>
													<button class="btn btn-sm bg-primary parentsDel" data-toggle="tooltip"
														 data-placement="top" title=""
														data-original-title="삭제">
														<i class="ri-delete-bin-line mr-0"></i>
													</button>
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
		<!-- alert&confirm 디자인 시작 -->
		<div class="alert alert-info layer" id="cnf" role="alert">
			<div class="iq-alert-text cnf align-self-center">선택한 학부모를 삭제하시겠습니까?</div>
			<div>
				<button type="button" class="btn btn-outline-info float-right close1">취소</button>
				<button type="button" id="ok" class="btn btn-info float-right">확인</button>
			</div>
		</div>	
		<!-- alert&confirm 디자인 끝 -->
	</div>
	<script>
	
	$('[name="parentsInfo"]').on('click',function(e) {
		
		let parentsNo = $(this).closest('tr').find('input[name="parentsNo"]').val();
	
		location.href = '../parents/parentsInfo?parentsNo=' + parentsNo;
});

	<!-- 학부모 삭제 -->
	$('.parentsDel').click(function (e) {
		e = e || window.event;
		let memberNo = e.target.closest(".targetCard").dataset["memberno"];
		
		$('#cnf').show();
		$("#ok").click(function () {
			$.ajax('parentsDelete' ,{
			     type: "POST",
			     data: {memberNo}
			})
			 .done(result => {
					if(result >= -1){
						e.currentTarget.closest(".targetCard").remove();
						$('.layer').hide();
					}else{
						alert("오류로 인해 삭제가 취소되었습니다.");
					};
				})
				.fail(reject => console.log(reject));
		});
	});
	
		$('.close1').on('click', function() {
			$('.layer').hide();
		})
	</script>
</body>
</html>