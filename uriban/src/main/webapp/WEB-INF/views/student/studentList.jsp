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
	top: 40%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>

</head>
<div class="card">
	<div class="card-body">
		<div class="card-body">
			<div
				class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
				<h5>우리 반 &#60;학생관리&#62;</h5>
			</div>
		</div>
	</div>
</div>
<body class=" color-light">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="datatable" class="table data-table table-striped">
								<thead>
									<tr class="ligth">
										<th>반번호</th>
										<th>이름</th>
										<th>아이디</th>
										<th>메일</th>
										<th>성별</th>
										<th>생년월일</th>
										<th style="min-width: 100px">변경</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${studentList}" var="info">
										<tr class="targetCard" data-memberid="${info.studentNo}">
											<td><input type="hidden" value="${info.studentNo}"
												name="studentNo">${info.studentClassNo}</td>
											<td>${info.studentName}</td>
											<td>${info.memberId}</td>
											<td>${info.studentEmail}</td>
											<td>${info.studentSex}</td>
											<td><fmt:formatDate value="${info.birthday}"
													pattern="yyyy-MM-dd"></fmt:formatDate></td>
											<td>
												<div class="flex align-items-center list-user-action">
													<button class="btn btn-sm bg-primary" data-toggle="tooltip"
														data-placement="top" title="" data-original-title="정보"
														name="studentInfo" type="button">
														<i class="ri-pencil-line mr-0"></i>
													</button>
													<button class="btn btn-sm bg-primary studentDel"
														data-toggle="tooltip" data-placement="top" title=""
														data-value="studentDel" data-original-title="삭제">
														<i class="ri-delete-bin-line mr-0"></i>
													</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<button type="button"
									onclick="location.href = '../student/studentInsert'"
									class="btn btn-primary mi-mr">학생 추가</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- alert&confirm 디자인 시작 -->
		<div class="alert alert-info layer" id="cnf" role="alert">
			<div class="iq-alert-text cnf align-self-center">선택한 학생을
				삭제하시겠습니까?</div>
			<div>
				<button type="button"
					class="btn btn-outline-info float-right close1">취소</button>
				<button type="button" id="ok" class="btn btn-info float-right">확인</button>
			</div>
		</div>

		<div class="alert alert-info layer" id="cnf1" role="alert">
			<div class="iq-alert-text cnf align-self-center">등록되었습니다.</div>
			<div>
				<button type="button" id="ok"
					class="btn btn-info float-right close1">확인</button>
			</div>
		</div>
		<!-- alert&confirm 디자인 끝 -->
	</div>

	<script>
	
	
	$('[name="studentInfo"]').on('click', function(e) {
		
	    let studentNo = $(this).closest('tr').find('input[name="studentNo"]').val();
	    
	    location.href = '../student/studentInfo?studentNo=' + studentNo;
	});

		<!-- 힉생 삭제 -->	
		$('.studentDel').click(function (e) {
			e = e || window.event;
			let studentNo = $(event.currentTarget).closest(".targetCard").data("memberid");
	
			$('#cnf').show();	
			$("#ok").click(function () {						
				$.ajax('studentDelete' ,{
			      	type: "POST",
			      	data: {studentNo}
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
	<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text done"></div>
		<button type="button" class="close close1">
			<i class="ri-close-line"></i>
		</button>
	</div>
	<c:if test="${not empty result}">
		<script type="text/javascript">
		$('.done').text('정상적으로 등록 되었습니다.');
		$('#done').show();
	</script>
	</c:if>
	<script type="text/javascript">
		$('.close1').on('click', function() {
			$('.layer').hide();
		})
	</script>
</body>
</html>