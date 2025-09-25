<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
									<form action="memberInsert" method="post"
										accept-charset="utf-8">
										<div class="form-group row align-items-center">
											<div class="col-md-12">
												<div class="profile-img-edit">
													<div class="crm-profile-img-edit">
														<img class="crm-profile-pic rounded-circle avatar-100"
															src="" alt="profile-pic">

													</div>
												</div>
											</div>
										</div>
										<div class="mar100">
											<div class=" row align-items-center">
												<div class="form-group col-sm-12">
													<label>구분</label> <select class="form-control"
														id="authority" name="authority">
														<option value="A102">교사</option>
														<option value="A104">학생</option>
														<option value="A105">학부모</option>
													</select>
												</div>
												<div class="form-group col-sm-12">
													<label for="memberId">아이디</label> <input type="text"
														class="form-control" id="memberId" name="memberId">
														
													<!-- id ajax 중복체크 -->
													<span class="idText"></span>
												</div>

												<div class="form-group col-sm-6">
													<label for="memberPw">비밀번호</label> <input type="password"
														class="form-control" id="memberPw" name="memberPw">
													<span class="pwText"></span>
												</div>
												<div class="form-group col-sm-6">
													<label for="memberPwChk">비밀번호 확인</label> <input
														type="password" class="form-control" id="memberPwChk" name="memberPwChk">
													<span class="chkText"></span>
												</div>


												<div class="form-group col-sm-6">
													<label for="memberName">이름</label> <input type="text"
														class="form-control" id="memberName" name="memberName">
												</div>
												<div class="form-group col-sm-6">
													<label for="birth">생년월일</label> <input type="date"
														class="form-control" id="birth" name="birth">

												</div>
												<div class="form-group col-sm-6">
													<label for="phone">연락처</label> <input type="text"
														class="form-control" id="phone" name="phone">
												</div>
												<div class="form-group col-sm-6">
													<label for="code">인증 번호</label> <input type="text"
														class="form-control" id="code" name="code">
												</div>
												<div class="form-group col-sm-12">
													<label for="email">메일</label> <input type="text"
														class="form-control" id="email" name="email">
												</div>


												<div class="form-group col-sm-12">
													<button type="reset" class="btn iq-bg-danger col-sm-12">취소</button>
													<button type="submit"
														class="btn btn-primary mr-2 col-sm-12" disabled>가입</button>
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
	<script>
		$("#memberId").on("change", checkId);
		
		function checkId(event) {
			var memberId = $('#memberId').val(); //id값이 "id"인 입력란의 값을 저장
			$(".idText").text("");
			if (memberId != "" && memberId != null) {
				$.ajax({
					url : 'idCheck', //Controller에서 요청 받을 주소
					type : 'post', //POST 방식으로 전달
					data : {
						memberId : memberId
					},
					
					success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
						if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
							$(".idText").css("color", "#34aadc");
							$(".idText").text("사용 가능한 아이디입니다.");
						} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
							$(".idText").css("color", "rgb(255, 120, 203)");
							$(".idText").text("중복된 아이디 입니다.");
							alert("아이디를 다시 입력해주세요");
							//$('#memberId').val('');
							$('#memberId').focus();
						}
					},
					error : function() {
						alert("에러입니다");
					}
				});
			}	
		};

		let chkPw;
		let pw;
		$("#memberPw").on("change", checkPw);
			
			function checkPw() {
				pw = $('#memberPw').val()
				//$(".pwText").remove;
				if (pw != "" && pw != null) {
					$(".pwText").css("color", "rgb(255, 120, 203)");
					$(".pwText").text("사용 가능한 비밀번호입니다.");
				}else{
					$(".pwText").css("color", "rgb(255, 120, 203)");
					$(".pwText").text("비밀번호를 확인해주세요.");
				}
			};
		$("#memberPwChk").on("change", checkPwChk);
			
			function checkPwChk() {
				pw = $('#memberPw').val();
				chkPw = $('#memberPwChk').val();
				if (pw == chkPw) {
					$(".chkText").css("color", "#34aadc");
					$(".chkText").text("비밀번호가 일치합니다.");
					$(" :submit").removeAttr("disabled");
					
				} else {
					$(".chkText").css("color", "rgb(255, 120, 203)");
					$(".chkText").text("비밀번호를 확인해주세요.");
					$(":submit").attr("disabled", "true");
				};
			};
	</script>
</body>
</html>