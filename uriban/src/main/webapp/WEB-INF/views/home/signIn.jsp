<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mar100 {
	width: 30%;
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
	top: 40%;
	margin-top: -150px; /* half of height */
	overflow: auto;
	z-index: 10000;
}
</style>
</head>
<body>
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
										<a href="${pageContext.request.contextPath }"
											class="logo me-auto"><img
											src="${pageContext.request.contextPath }/homeview/img/logoWH.png"
											alt="" class="img-fluid img-hei"></a>
									</div>
								</div>
								<div class="mt-4 ml-4 mr-4">
									<form action="${pageContext.request.contextPath }/login"
										method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<div class="">
											<div class=" row align-items-center">
												<div class="form-group col-sm-12">
													<h4>로그인</h4>
												</div>
												<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
													<div class="form-group col-sm-12">
														<div class="alert alert-danger" role="alert">
															<div class="iq-alert-text" style="text-align: center;">
																<b>로그인 실패 :</b>
																${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }
															</div>
														</div>
													</div>
													<c:remove var="SPRING_SECURITY_LAST_EXCEPTION"
														scope="session" />
												</c:if>
												<div class="form-group col-sm-12">
													<label for="memberId">아이디</label> <input type="text"
														class="form-control" id="memberId" name="memberId">
												</div>

												<div class="form-group col-sm-12">
													<label for="memberPw">비밀번호</label> <input type="password"
														class="form-control" id="memberPw" name="memberPw">
												</div>
												<div class="form-group col-sm-12 mt-3 pb-3">
													<button type="submit"
														class="btn btn-primary mr-2 col-sm-12">로그인</button>
													<p class="mt-3">
														<a href="signup" class=" text-underline">회원가입</a>
													</p>
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
			<div class="iq-alert-text"><span class="done"></span><button type="button" class="close close1">
				<i class="ri-close-line"></i>
			</button></div>
			
		</div>
	<c:if test="${not empty result}">
	<script type="text/javascript">
		$('.done').text('정상적으로 가입되었습니다.');
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