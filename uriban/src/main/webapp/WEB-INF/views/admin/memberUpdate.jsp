<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="iq-edit-list-data">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="personal-information"
							role="tabpanel">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									<div class="iq-header-title">
										<h4 class="card-title">Personal Information</h4>
									</div>
								</div>
								<div class="card-body">
									<form id="updateFrm">
										<div class="form-group row align-items-center">
											<div class="col-md-12">
												<div class="profile-img-edit">
													<div class="crm-profile-img-edit">
														<img class="crm-profile-pic rounded-circle avatar-100"
															src="${pageContext.request.contextPath }/profile/${memberInfo.memberProfile}" alt="profile-pic">

													</div>
												</div>
											</div>
										</div>
										<div class=" row align-items-center">
											<div class="form-group col-sm-12">
												<label for="memberId">아이디</label> <input type="text"
													class="form-control" id="memberId" name="memberId"
													value="${memberInfo.memberId}" readonly="readonly">
											</div>
											
																						
											<div class="form-group col-sm-12">
												<label for="memberName">이름</label> <input type="text"
													class="form-control" id="memberName" name="memberName"
													value="${memberInfo.memberName}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="phone">연락처</label> <input type="text"
													class="form-control" id="phone" name="phone" value="${memberInfo.phone}">
											</div>
											<div class="form-group col-sm-12">
												<label for="email">메일</label> <input type="text"
													class="form-control" id="email" name="email" value="${memberInfo.email}">
											</div>
											<div class="form-group col-sm-12">
												<label for="birth">생년월일</label> <input type="text"
													class="form-control" id="birth" name="birth"
													value="<fmt:formatDate value="${memberInfo.birth}"
							pattern="yyyy-MM-dd" />"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="auth">권한</label> <input type="text"
													class="form-control" id="auth" name="auth"
													value="${memberInfo.authKor}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="createDate">가입일</label> <input type="text"
													class="form-control" id="createDate" name=createDate
													value="<fmt:formatDate value="${memberInfo.createDate}"
							pattern="yyyy-MM-dd" />"
													readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label for="banCount">제한횟수</label> <input type="text"
													class="form-control" id=banCount name=banCount
													value="${memberInfo.banCount}" readonly="readonly">
											</div>
											<div class="form-group col-sm-12">
												<label>상태</label> <select class="form-control"
													id="memberState" name="memberState">
													<option value="">상태변경</option>
													<option value="A501">정상</option>
													<option value="A502">댓글제한</option>
													<option value="A503">메일제한</option>
													<option value="A504">댓글,메일제한</option>
												</select>
											</div>
										</div>
										<button type="reset" class="btn iq-bg-danger"
											onclick="location.href='memberList'">취소</button>
										<button type="button" class="btn btn-primary mr-2">수정</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="alert text-white bg-info layer" id="done" role="alert">
		<div class="iq-alert-text done">
			A simple <b>info</b> alert—check it out!
		</div>
		<!-- <button type="button" class="close" data-dismiss="alert"
			aria-label="Close"> -->
		<button type="button" class="close">
			<i class="ri-close-line"></i>
		</button>
	</div>

	<div class="alert text-white bg-danger layer " id="err" role="alert">
		<div class="iq-alert-text err">
			A simple <b>info</b> alert—check it out!
		</div>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<i class="ri-close-line"></i>
		</button>
	</div>
	<script>
	$('.close').on('click', function() {
		$('.layer').hide();
	})
	
	
	$('form > :button').on('click', memberUpdate);
	function memberUpdate(event){

			// 보낼 데이터
			var form = $('#updateFrm');
			var data = new FormData(form[0]);  

			// ajax
			$.ajax('${pageContext.request.contextPath }/admin/memberUpdate',{
				type : 'post',
				contentType : 'multipart/form-data',
				data : data,
				dataType:'json',
				processData:false,
			    contentType:false,
			    cache:false,
			})
			.done(result =>{ 
				let message = '결과 : '+ result['result'];
				$('.done').text('정상적으로 변경되었습니다.');
				$('#done').show();
				
			})
			.fail(reject => {
				console.log(reject); // error
				$('.err').text('정상적으로 변경되지 않았습니다.');
				$('#err').show();	
			})
						
	}
	
	//$("#memberState").val("").prop("selected", true)
	</script>
</body>
</html>