<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mar100 {
	width: 60%;
	margin: auto;
}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

.backg {
	background-color: #5fcf80;
	width: 100%;
	padding: 5px;
}

.img-hei {
	height: 90px;
	text-align: center;
}

.mt150 {
	margin-top: 150px;
}

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
	<sec:authentication property="principal" var="p" />
	<div class="container-fluid 100vh">
		<div class="row ">
			<div class="col-lg-12">
				<div class="iq-edit-list-data">
					<div class="tab-content">
						<div class="tab-pane fade active show mt150"
							id="personal-information" role="tabpanel">
							<div class="mar100 blur-shadow shadow-showcas 100vh">
								<div class="backg">
									<div class="mt-2 mb-2 text-center">
										<a href="/" class="logo me-auto"><img
											src="${pageContext.request.contextPath }/homeview/img/logoWH.png"
											alt="" class="img-fluid img-hei"></a>
									</div>
								</div>
								<div class="mt-4 ml-4 mr-4">
									<form id="delFrm" method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<div class="">
											<div class=" row align-items-center">
												<div class="form-group col-sm-12">
													<h4>회원 탈퇴</h4>
												</div>
												<div class="form-group col-sm-12">
													<div class="alert alert-danger" role="alert">
														<div class="iq-alert-text" style="text-align: center;">
															<b>회원 탈퇴시 모든 데이터가 삭제됩니다.<br> 탈퇴를 원하시면 비밀번호를
																입력해주세요.
															</b>
														</div>
													</div>
												</div>
												<div class="form-group col-sm-12">
													<input type="hidden" class="form-control" id="memberId"
														name="memberId" value="${p.memberId }">
												</div>

												<div class="form-group col-sm-12">
													<label for="memberPw">비밀번호</label> <input type="password"
														class="form-control" id="memberPw" name="memberPw">
												</div>
												<div class="form-group col-sm-12 mt-3 pb-3">
													<button type="button"
														class="btn btn-primary mr-2 col-sm-12 subm">회원 탈퇴</button>
												</div>
											</div>
										</div>
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
		<button type="button" class="close close1">
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

	<script type="text/javascript">

	<!-- alert 끄기 시작 -->
	$('.close').on('click', function() {
		$('.layer').hide();
	});
	<!-- alert 끄기 끝 -->
	
	$('.subm').on('click', memberDel);
	function memberDel(event){
			
		// 보낼 데이터
		var form = $('#delFrm');
		var data = new FormData(form[0]);  
		//let objData = getMemberInfo();

		// ajax
		$.ajax('${pageContext.request.contextPath}/member/memberDelete',{
			type : 'post',
			contentType : 'multipart/form-data',
			data : data,
			dataType:'text',
			processData:false,
		    contentType:false,
		    cache:false,
		    async:false,
		})
		.done(result => {
			if(result==="success"){
				console.log(result);
				$('.done').text('정상적으로 탙퇴되었습니다.');
				$('#done').show();	
				document.getElementById('logoutFrm').submit();
			}else{
				$('.err').text('비밀번호를 다시 확인하세요.');
				$('#err').show();	
				$('#memberId').val();
			}
		})
		.fail(reject => {
			console.log(reject); // error
			$('.err').text('비밀번호를 다시 확인하세요.');
			$('#err').show();	
			$('#memberId').val();
		})
	}
</script>
</body>
</html>